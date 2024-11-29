import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/settings.dart';

class SettingsNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    return const AppSettings(
      accountInfo: AccountInfo(
        studentId: '',
        password: '',
      ),
      hideStudentId: true,
      appTheme: AppTheme.light,
      appLocale: AppLocale.en,
    );
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
  }
}

final settingsProvider =
    NotifierProvider<SettingsNotifier, AppSettings>(SettingsNotifier.new);

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
