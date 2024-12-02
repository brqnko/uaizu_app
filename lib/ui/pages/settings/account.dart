import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/provider/client_provider.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/dialogs/close_dialog.dart';
import 'package:uaizu_app/ui/dialogs/loading_dialog.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = useState(
      ref.read(settingsProvider.select((s) => s.accountInfo.studentId)),
    );
    final password = useState(
      ref.read(settingsProvider.select((s) => s.accountInfo.password)),
    );

    final colorScheme = Theme.of(context).colorScheme;

    final settingsWidgets = [
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(height: 12),
            Text(
              ref.read(accountNameProvider),
              style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        // username and password form
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                initialValue: username.value,
                obscureText: ref.watch(settingsProvider).hideStudentId,
                decoration: const InputDecoration(
                  labelText: 'Student ID',
                ),
                onChanged: (value) {
                  username.value = value;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                obscureText: true,
                initialValue: password.value,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  password.value = value;
                },
              ),
              const SizedBox(height: 12),
              // save button left
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(settingsProvider.notifier).update(
                          studentId: username.value,
                          password: password.value,
                        );

                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => LoadingDialog(
                        title: 'Logging in...',
                        future: ref
                            .read(campusSquareClientProvider)
                            .requireRwfHash(),
                        onSuccessful: (context) => const CloseDialog(
                          title: 'Login successful',
                        ),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    final body = Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (context, index) => settingsWidgets[index],
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: settingsWidgets.length,
      ),
    );

    return Scaffold(
      appBar: brandAppBar(context, title: 'Account'),
      backgroundColor: colorScheme.surface,
      body: body,
    );
  }
}
