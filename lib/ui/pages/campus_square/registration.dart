import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/state/registration.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({super.key});

  Widget _buildRegistrationsListView(
      List<Registration> data, ColorScheme colorScheme) {
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
                              DateTime(ref.watch(registrationYearProvider)),
                          onChanged: (DateTime dateTime) {
                            ref.read(registrationYearProvider.notifier).state =
                                dateTime.year;
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                ref.watch(registrationYearProvider).toString(),
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(registrationSemesterProvider.notifier).state =
                    !ref.read(registrationSemesterProvider);
              },
              child: Text(
                ref.watch(registrationSemesterProvider) ? '前期' : '後期',
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(
                      registrationSearchResultProvider.notifier,
                    )
                    .requestUpdateSearchResult();
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
        child: ref.watch(registrationSearchResultProvider).when(
          data: (data) {
            if (data.isEmpty) {
              return const Text('no search result');
            } else {
              return _buildRegistrationsListView(data, colorScheme);
            }
          },
          loading: () {
            return const CircularProgressIndicator();
          },
          error: (err, stack) {
            return Text(stack.toString());
          },
        ),
      ),
    );
  }
}
