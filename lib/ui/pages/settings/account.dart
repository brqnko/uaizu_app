import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';

import '../../res/fonts.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final username = useState('');
    final password = useState('');

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
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(height: 10),
            Text(
              ref.read(settingsProvider.select((s) => s.accountInfo.studentId)),
              style: Fonts.titleM.copyWith(color: colorScheme.onSecondary),
            ),
            const SizedBox(height: 20),
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
                initialValue: ref.read(settingsProvider.select((s) => s.accountInfo.studentId)),
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
                initialValue: ref.read(settingsProvider.select((s) => s.accountInfo.password)),
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
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    final body = Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (context, index) => settingsWidgets[index],
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: settingsWidgets.length,
      ),
    );

    return Scaffold(
      appBar: appBar(context, 'Account'),
      backgroundColor: colorScheme.surface,
      body: body,
    );
  }
}