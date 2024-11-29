import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

import '../../../use_case/campus_square_usecase.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({super.key});

  Widget _buildRegistrationsListView(
      List<Registration> data, ColorScheme colorScheme,) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final registration = data[index];
        return Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  registration.title,
                  style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                ),
                const SizedBox(height: 8),
                if (registration.timeSlots != null)
                  Text(
                    registration.timeSlots!,
                    style: Fonts.bodyS
                        .copyWith(color: colorScheme.onSurfaceVariant),
                  ),
                if (registration.info.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: registration.info.map((info) {
                      return Text(
                        info,
                        style: Fonts.bodyS
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorScheme = Theme.of(context).colorScheme;

    final year = useState(DateTime.now().year);
    final semester = useState(false);
    final registrationsTrigger = useState(false);

    final registrationsFuture = useMemoized(() {
      return ref.read(getRegistrationUseCaseProvider).call(
        GetRegistrationUseCaseParam(
          query: SearchRegistrationQuery(
            year: year.value,
            semester: semester.value,
          ),
          useCache: false,
        ),
      );
    }, [registrationsTrigger.value],);

    final registrations = useFuture(registrationsFuture);

    final appBar = AppBar(
      toolbarHeight: 55,
      backgroundColor: colorScheme.onPrimaryContainer,
      iconTheme: IconThemeData(color: colorScheme.secondary),
      title: SizedBox(
        height: 34,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Select Year'),
                      content: SizedBox(
                        width: 300,
                        height: 300,
                        child: YearPicker(
                          firstDate: DateTime.utc(1993, 4),
                          lastDate: DateTime.utc(2030, 3, 31),
                          selectedDate:
                              DateTime(year.value),
                          onChanged: (DateTime dateTime) {
                            year.value = dateTime.year;
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                year.value.toString(),
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                semester.value = !semester.value;
              },
              child: Text(
                semester.value ? '前期' : '後期',
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                registrationsTrigger.value = !registrationsTrigger.value;
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(
                      text: '検索',
                      style: Fonts.bodyS
                          .copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: registrations.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : _buildRegistrationsListView(registrations.data!, colorScheme),
      ),
    );
  }
}
