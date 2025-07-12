import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/ui/pages/campus_square/campus_square.dart';
import 'package:uaizu_app/ui/pages/campus_square/grade_and_exam.dart';
import 'package:uaizu_app/ui/pages/campus_square/registration.dart';
import 'package:uaizu_app/ui/pages/campus_square/schedule.dart';
import 'package:uaizu_app/ui/pages/campus_square/syllabus.dart';
import 'package:uaizu_app/ui/pages/home.dart';
import 'package:uaizu_app/ui/pages/library/book_detail.dart';
import 'package:uaizu_app/ui/pages/library/book_search.dart';
import 'package:uaizu_app/ui/pages/library/library.dart';
import 'package:uaizu_app/ui/pages/moodle/moodle.dart';
import 'package:uaizu_app/ui/pages/notification/add_notification.dart';
import 'package:uaizu_app/ui/pages/notification/notification.dart';
import 'package:uaizu_app/ui/pages/notification/notification_detail.dart';
import 'package:uaizu_app/ui/pages/settings/about.dart';
import 'package:uaizu_app/ui/pages/settings/account.dart';
import 'package:uaizu_app/ui/pages/settings/appearance.dart';
import 'package:uaizu_app/ui/pages/settings/settings.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final squareNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'square');
final moodleNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'moodle');
final libraryNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'library');
final notificationNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'notification');
final accountNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'account');

final squareCalendarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'squareCalendar');
final squareGradeAndExamNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'squareGradeAndExam');
final squareRegistrationNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'squareRegistration');
final squareSyllabusNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'squareSyllabus');

final goRouterProvider = Provider((ref) {
  final appRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/square/calendar',
    redirect: (context, state) {
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomePage(navigationShell: navigationShell);
        },
        branches: [
          // square
          StatefulShellBranch(
            navigatorKey: squareNavigatorKey,
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) {
                  return CampusSquarePage(navigationShell);
                },
                branches: [
                  StatefulShellBranch(
                    navigatorKey: squareCalendarNavigatorKey,
                    routes: [
                      GoRoute(
                        path: '/square/calendar',
                        pageBuilder: (context, state) {
                          return NoTransitionPage(
                            key: state.pageKey,
                            child: const SchedulePage(),
                          );
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: squareRegistrationNavigatorKey,
                    routes: [
                      GoRoute(
                        path: '/square/registration',
                        pageBuilder: (context, state) {
                          return NoTransitionPage(
                            key: state.pageKey,
                            child: const RegistrationPage(),
                          );
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: squareGradeAndExamNavigatorKey,
                    routes: [
                      GoRoute(
                        path: '/square/grade_and_exam',
                        pageBuilder: (context, state) {
                          return NoTransitionPage(
                            key: state.pageKey,
                            child: const GradeAndExamPage(),
                          );
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: squareSyllabusNavigatorKey,
                    routes: [
                      GoRoute(
                        path: '/square/syllabus',
                        pageBuilder: (context, state) {
                          return NoTransitionPage(
                            key: state.pageKey,
                            child: const SyllabusPage(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // moodle
          StatefulShellBranch(
            navigatorKey: moodleNavigatorKey,
            routes: [
              GoRoute(
                path: '/moodle',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const MoodlePage(),
                  );
                },
              ),
            ],
          ),
          // library
          StatefulShellBranch(
            navigatorKey: libraryNavigatorKey,
            routes: [
              GoRoute(
                path: '/library',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const LibraryPage(),
                  );
                },
              ),
              GoRoute(
                path: '/library/search',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const BookSearchPage(),
                  );
                },
              ),
              GoRoute(
                path: '/library/book/:path',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: BookDetailPage(
                      path: Uri.decodeComponent(state.pathParameters['path']!),
                    ),
                  );
                },
              ),
            ],
          ),
          // notification
          StatefulShellBranch(
            navigatorKey: notificationNavigatorKey,
            routes: [
              GoRoute(
                path: '/notification',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const NotificationPage(),
                  );
                },
                routes: [
                  GoRoute(
                    path: '/add',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        key: state.pageKey,
                        child: const AddNotificationPage(),
                      );
                    },
                  ),
                  GoRoute(
                    path: '/details/:id',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        key: state.pageKey,
                        child: NotificationDetailPage(
                          notificationId: state.pathParameters['id']!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          // account
          StatefulShellBranch(
            navigatorKey: accountNavigatorKey,
            routes: [
              GoRoute(
                path: '/account',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const SettingsPage(),
                  );
                },
              ),
              GoRoute(
                path: '/account/account',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const AccountPage(),
                  );
                },
              ),
              GoRoute(
                path: '/account/appearance',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const AppearancePage(),
                  );
                },
              ),
              GoRoute(
                path: '/account/about',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const AboutPage(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  return appRouter;
});
