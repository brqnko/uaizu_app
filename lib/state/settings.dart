import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/domain/provider/settings_provider.dart';

class SettingsNotifier extends Notifier<AppSettings> {
  SettingsNotifier(this.initialSettings);

  final AppSettings initialSettings;

  @override
  AppSettings build() {
    return initialSettings;
  }

  void update({
    String? studentId,
    String? password,
    bool? hideStudentId,
    AppTheme? appTheme,
    AppLocale? appLocale,
  }) {
    state = AppSettings(
      accountInfo: AccountInfo(
        studentId: studentId ?? state.accountInfo.studentId,
        password: password ?? state.accountInfo.password,
      ),
      hideStudentId: hideStudentId ?? state.hideStudentId,
      appTheme: appTheme ?? state.appTheme,
      appLocale: appLocale ?? state.appLocale,
    );

    ref.watch(settingsRepositoryProvider).saveSettings(state);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(
  () => throw UnimplementedError(),
);

final accountNameProvider = Provider((ref) {
  var name = ref.watch(settingsProvider.select((s) => s.accountInfo.studentId));
  if (name.isEmpty) {
    name = 'not logged in';
  }

  if (ref.watch(settingsProvider.select((s) => s.hideStudentId))) {
    return name;
  } else {
    return 'anonyomous';
  }
});

String getAnonymousableValue(String value, WidgetRef ref) {
  final hideStudentId =
      ref.watch(settingsProvider.select((settings) => settings.hideStudentId));
  return hideStudentId ? 'anonymous' : value;
}
