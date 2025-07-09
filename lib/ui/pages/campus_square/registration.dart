import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/ui/dialogs/select_year_dialog.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/future_body.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/ui/widgets/search_button.dart';
import 'package:uaizu_app/use_case/campus_square_usecase.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final year = useState(DateTime.now().year);
    final semester = useState(false);
    final registrationsTrigger = useState(false);

    final registrationsFuture = useMemoized(
      () {
        return ref.read(getRegistrationUseCaseProvider).call(
              GetRegistrationUseCaseParam(
                query: SearchRegistrationQuery(
                  year: year.value,
                  semester: semester.value,
                ),
                useCache: false,
              ),
            );
      },
      [registrationsTrigger.value],
    );

    final registrations = useFuture(registrationsFuture);

    final appBar = brandAppBarWithOptions(
      context,
      [
        ElevatedButton(
          onPressed: () => showDialog<void>(
            context: context,
            builder: (BuildContext context) => SelectYearDialog(year: year),
          ),
          child: Text(
            year.value.toString(),
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ),
        ElevatedButton(
          onPressed: () => semester.value = !semester.value,
          child: Text(
            semester.value ? l10n.firstSemester : l10n.secondSemester,
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ),
        SearchButton(
          onPressed: () =>
              registrationsTrigger.value = !registrationsTrigger.value,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: futureBody(registrations, (data) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final registration = data[index];
            return HorizontalExpandedContainer(
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
                  const SizedBox(height: 8),
                  ...registration.info.map((info) {
                    return Text(
                      info,
                      style: Fonts.bodyS
                          .copyWith(color: colorScheme.onSurfaceVariant),
                    );
                  }),
                ],
              ),
            );
          },
        );
      }, l10n),
    );
  }
}
