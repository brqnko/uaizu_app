// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'UAIZU App';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get notifications => 'Notifications';

  @override
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

  @override
  String get library => 'Library';

  @override
  String get campusSquare => 'Campus Square';

  @override
  String get lms => 'LMS';

  @override
  String get moodle => 'Moodle';

  @override
  String get search => 'Search';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get back => 'Back';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get account => 'Account';

  @override
  String get appearance => 'Appearance';

  @override
  String get hideStudentId => 'Hide Student ID';

  @override
  String get studentId => 'Student ID';

  @override
  String get password => 'Password';

  @override
  String get bookDetail => 'Book Detail';

  @override
  String get newBooks => 'New Books';

  @override
  String get openingCalendar => 'Opening Calendar';

  @override
  String get twoYearCollege => '2-year College';

  @override
  String get fourYearUniversity => '4-year University';

  @override
  String get schedule => 'Schedule';

  @override
  String get registration => 'Registration';

  @override
  String get gradeAndExam => 'Grade and Exam';

  @override
  String get syllabus => 'Syllabus';

  @override
  String get notification => 'Notification';

  @override
  String get close => 'Close';

  @override
  String get square => 'Square';

  @override
  String get accountTitle => 'Campus Square and Moodle Account';

  @override
  String get languageThemeStudentId => 'Language, Theme, Hide Student ID';

  @override
  String get versionLicensePrivacy => 'Version, License, Privacy Policy';

  @override
  String get description => 'Description';

  @override
  String get sourceCode => 'Source Code';

  @override
  String get license => 'License';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get appDescription =>
      'uaizu_app allows you to access Campus Square, Moodle and Library without browser.';

  @override
  String get login => 'Login';

  @override
  String get loggingIn => 'Logging in...';

  @override
  String get loginSuccessful => 'Login successful';

  @override
  String get author => 'Author';

  @override
  String get publisher => 'Publisher';

  @override
  String get publishedDate => 'Published Date';

  @override
  String get location => 'Location';

  @override
  String get isbn => 'ISBN';

  @override
  String get alternative => 'Alternative';

  @override
  String get callMark => 'Call Mark';

  @override
  String get countryOfPublication => 'Country of Publication';

  @override
  String get format => 'Format';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get firstSemester => 'First Semester';

  @override
  String get secondSemester => 'Second Semester';

  @override
  String get studentInformation => 'Student Information';

  @override
  String get name => 'Name';

  @override
  String get department => 'Department';

  @override
  String get year => 'Year';

  @override
  String get semester => 'Semester';

  @override
  String get showAll => 'Show All';

  @override
  String get showPartial => 'Show Partial';

  @override
  String get grades => 'Grades';

  @override
  String get quarter1 => '1st Quarter';

  @override
  String get quarter2 => '2nd Quarter';

  @override
  String get quarter3 => '3rd Quarter';

  @override
  String get quarter4 => '4th Quarter';

  @override
  String get toeicBestScore => 'TOEIC Best Score';

  @override
  String get toeicHistory => 'TOEIC History';

  @override
  String get freeWord => 'Free Word';

  @override
  String get displayCount => 'Display Count';

  @override
  String get searchButton => 'Search';

  @override
  String get classCancel => 'Class Cancelled';

  @override
  String get classOpen => 'Class Open';

  @override
  String get makeupClass => 'Makeup Class';

  @override
  String get reminder => 'Reminder';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get addNotification => 'Add Notification';

  @override
  String get notificationTitle => 'Notification Title';

  @override
  String get notificationBody => 'Notification Body';

  @override
  String get notificationTime => 'Notification Time';

  @override
  String get upcoming => 'Upcoming';

  @override
  String get confirmed => 'Confirmed';

  @override
  String get notificationDetails => 'Notification Details';

  @override
  String get deleteNotification => 'Delete Notification';

  @override
  String get selectTime => 'Select Time';

  @override
  String get selectDate => 'Select Date';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String get deleteNotificationMessage =>
      'Do you want to delete this notification?';

  @override
  String get emptyNotifications => 'No notifications';

  @override
  String get titleRequired => 'Title is required';

  @override
  String get bodyRequired => 'Body is required';

  @override
  String get addNotificationToSchedule => 'Add Notification';

  @override
  String get notificationAdded => 'Notification added';

  @override
  String errorOccurredWithDetails(String error) {
    return 'An error occurred: $error';
  }

  @override
  String classWillStart(String timeSlot, String location) {
    return 'Class will start ($timeSlot - $location)';
  }

  @override
  String taskDeadlineApproaching(String deadline) {
    return 'Task deadline is approaching (Due: $deadline)';
  }

  @override
  String taskDeadline(String deadline) {
    return 'Task Deadline: $deadline';
  }

  @override
  String get activityLink => 'Activity Link';

  @override
  String get taskLink => 'Task Link';

  @override
  String get addNotificationTitle => 'Add Notification';

  @override
  String get title => 'Title';

  @override
  String get content => 'Content';

  @override
  String get titlePlaceholder => 'Enter notification title';

  @override
  String get contentPlaceholder => 'Enter notification content';

  @override
  String get scheduleNotificationTime => 'Scheduled Time';

  @override
  String get titleLabel => 'Title';

  @override
  String get contentLabel => 'Content';

  @override
  String get notificationTimeLabel => 'Notification Time';

  @override
  String get scheduled => 'Scheduled';

  @override
  String get confirmedNotifications => 'Confirmed';

  @override
  String get noScheduledNotifications => 'No scheduled notifications';

  @override
  String get noConfirmedNotifications => 'No confirmed notifications';

  @override
  String get viewDetails => 'View Details';

  @override
  String get markAsConfirmed => 'Mark as Confirmed';

  @override
  String get markAsUnconfirmed => 'Mark as Unconfirmed';

  @override
  String errorOccurred2(String error) {
    return 'An error occurred: $error';
  }
}
