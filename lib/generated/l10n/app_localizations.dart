import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'UAIZU App'**
  String get appTitle;

  /// Settings menu label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Language setting label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Theme setting label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Notifications setting label
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Enabled option
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// Disabled option
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// Library section label
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// Campus Square section label
  ///
  /// In en, this message translates to:
  /// **'Campus Square'**
  String get campusSquare;

  /// LMS section label
  ///
  /// In en, this message translates to:
  /// **'LMS'**
  String get lms;

  /// Moodle section label
  ///
  /// In en, this message translates to:
  /// **'Moodle'**
  String get moodle;

  /// Search action label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Error message label
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Retry action label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Cancel action label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// OK action label
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Save action label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Delete action label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Edit action label
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Add action label
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Back navigation label
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Home page label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Profile page label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// About page label
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Version information label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Account page label
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Appearance setting label
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// Hide student ID setting
  ///
  /// In en, this message translates to:
  /// **'Hide Student ID'**
  String get hideStudentId;

  /// Student ID label
  ///
  /// In en, this message translates to:
  /// **'Student ID'**
  String get studentId;

  /// Password label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Book detail page title
  ///
  /// In en, this message translates to:
  /// **'Book Detail'**
  String get bookDetail;

  /// New books section label
  ///
  /// In en, this message translates to:
  /// **'New Books'**
  String get newBooks;

  /// Opening calendar label
  ///
  /// In en, this message translates to:
  /// **'Opening Calendar'**
  String get openingCalendar;

  /// 2-year college option
  ///
  /// In en, this message translates to:
  /// **'2-year College'**
  String get twoYearCollege;

  /// 4-year university option
  ///
  /// In en, this message translates to:
  /// **'4-year University'**
  String get fourYearUniversity;

  /// Schedule page label
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// Registration page label
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// Grade and exam page label
  ///
  /// In en, this message translates to:
  /// **'Grade and Exam'**
  String get gradeAndExam;

  /// Syllabus page label
  ///
  /// In en, this message translates to:
  /// **'Syllabus'**
  String get syllabus;

  /// Notification page label
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// Close action label
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Campus Square navigation label
  ///
  /// In en, this message translates to:
  /// **'Square'**
  String get square;

  /// Account settings subtitle
  ///
  /// In en, this message translates to:
  /// **'Campus Square and Moodle Account'**
  String get accountTitle;

  /// Appearance settings subtitle
  ///
  /// In en, this message translates to:
  /// **'Language, Theme, Hide Student ID'**
  String get languageThemeStudentId;

  /// About settings subtitle
  ///
  /// In en, this message translates to:
  /// **'Version, License, Privacy Policy'**
  String get versionLicensePrivacy;

  /// Description label
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Source code label
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// License label
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// Privacy policy label
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Application description text
  ///
  /// In en, this message translates to:
  /// **'uaizu_app allows you to access Campus Square, Moodle and Library without browser.'**
  String get appDescription;

  /// Login button label
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Login progress message
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get loggingIn;

  /// Login success message
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccessful;

  /// Book author field label
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// Book publisher field label
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get publisher;

  /// Book published date field label
  ///
  /// In en, this message translates to:
  /// **'Published Date'**
  String get publishedDate;

  /// Book location field label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Book ISBN field label
  ///
  /// In en, this message translates to:
  /// **'ISBN'**
  String get isbn;

  /// Book alternative field label
  ///
  /// In en, this message translates to:
  /// **'Alternative'**
  String get alternative;

  /// Book call mark field label
  ///
  /// In en, this message translates to:
  /// **'Call Mark'**
  String get callMark;

  /// Book country of publication field label
  ///
  /// In en, this message translates to:
  /// **'Country of Publication'**
  String get countryOfPublication;

  /// Book format field label
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get format;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// First semester label
  ///
  /// In en, this message translates to:
  /// **'First Semester'**
  String get firstSemester;

  /// Second semester label
  ///
  /// In en, this message translates to:
  /// **'Second Semester'**
  String get secondSemester;

  /// Student information section label
  ///
  /// In en, this message translates to:
  /// **'Student Information'**
  String get studentInformation;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Department field label
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// Year field label
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// Semester field label
  ///
  /// In en, this message translates to:
  /// **'Semester'**
  String get semester;

  /// Show all items button label
  ///
  /// In en, this message translates to:
  /// **'Show All'**
  String get showAll;

  /// Show partial items button label
  ///
  /// In en, this message translates to:
  /// **'Show Partial'**
  String get showPartial;

  /// Grades section label
  ///
  /// In en, this message translates to:
  /// **'Grades'**
  String get grades;

  /// First quarter label
  ///
  /// In en, this message translates to:
  /// **'1st Quarter'**
  String get quarter1;

  /// Second quarter label
  ///
  /// In en, this message translates to:
  /// **'2nd Quarter'**
  String get quarter2;

  /// Third quarter label
  ///
  /// In en, this message translates to:
  /// **'3rd Quarter'**
  String get quarter3;

  /// Fourth quarter label
  ///
  /// In en, this message translates to:
  /// **'4th Quarter'**
  String get quarter4;

  /// TOEIC best score section label
  ///
  /// In en, this message translates to:
  /// **'TOEIC Best Score'**
  String get toeicBestScore;

  /// TOEIC history section label
  ///
  /// In en, this message translates to:
  /// **'TOEIC History'**
  String get toeicHistory;

  /// Free word search field placeholder
  ///
  /// In en, this message translates to:
  /// **'Free Word'**
  String get freeWord;

  /// Display count field placeholder
  ///
  /// In en, this message translates to:
  /// **'Display Count'**
  String get displayCount;

  /// Search button label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchButton;

  /// Class cancelled status
  ///
  /// In en, this message translates to:
  /// **'Class Cancelled'**
  String get classCancel;

  /// Class open status
  ///
  /// In en, this message translates to:
  /// **'Class Open'**
  String get classOpen;

  /// Makeup class status
  ///
  /// In en, this message translates to:
  /// **'Makeup Class'**
  String get makeupClass;

  /// Reminder button label
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get reminder;

  /// Error message when something unexpected happens
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// Message when no data is found
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
