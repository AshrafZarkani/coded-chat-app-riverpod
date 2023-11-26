import 'package:firebase_chat_app/app/config/router/named_routes.dart';
import 'package:firebase_chat_app/app/modules/auth/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///[rootNavigatorKey] used for global | general navigation
final rootNavigatorKey = GlobalKey<NavigatorState>();

///[shellNavigatorKey] used for nesting routes within bottom nav bar (stickey bottom nav bar)
final shellNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const SizedBox();

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: MyNamedRoutes.root,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // outside the [ShellRoute] to make the screen on top of the [BottomNavBar]
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.root,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return const SizedBox();
          // return ScaffoldWithBottomNavBar(
          //   tabs: BottomNavBarTabs.tabs(context),
          //   child: child,
          // );
        },
        routes: [
          // messages
          GoRoute(
              path: "/${MyNamedRoutes.messages}",
              name: MyNamedRoutes.messages,
              pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const SizedBox(),
                    // GroupChannelView(),
                  ),
              routes: [
                // GoRoute(
                //   path: MyNamedRoutes.groupChannelView,
                //   name: MyNamedRoutes.groupChannelView,
                //   pageBuilder: (context, state) => NoTransitionPage(
                //     key: state.pageKey,
                //     child: MessagesScreen(
                //         groupChannel: state.extra as GroupChannel),
                //   ),
                // ),
              ]),

          // account
          GoRoute(
              path: "/${MyNamedRoutes.account}",
              name: MyNamedRoutes.account,
              pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const SizedBox(),
                    //const AccountScreen(),
                  ),
              routes: [
                GoRoute(
                  path: MyNamedRoutes.profile,
                  name: MyNamedRoutes.profile,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const SizedBox(),
                  ),
                ),
              ]),
        ],
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.login}",
        name: MyNamedRoutes.login,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SizedBox(),
          //const LoginScreen(),
        ),
      ),
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}
