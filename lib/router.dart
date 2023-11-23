import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nomad_flutter_twitter/features/authentication/initial_screen.dart';
import 'package:nomad_flutter_twitter/features/main_navigation/main_navigation_screen.dart';
import 'package:nomad_flutter_twitter/features/profile/privacy_screen.dart';
import 'package:nomad_flutter_twitter/features/profile/setting_screen.dart';

//나는 스테이징이다~~
//
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: InitialScreen(),
        //child: PrivacyScreen(),
      ),
    ),
    GoRoute(
      path: "/:tab(home|search|activity|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    // GoRoute(
    //   path: '/search',
    //   pageBuilder: (context, state) => const MaterialPage<void>(
    //     child: SearchScreen(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/activity',
    //   pageBuilder: (context, state) => const MaterialPage<void>(
    //     child: ActivityScreen(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/profile',
    //   pageBuilder: (context, state) => const MaterialPage<void>(
    //     child: ProfileScreen(),
    //   ),
    // ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: SettingScreen(),
      ),
      routes: [
        GoRoute(
          path: 'privacy', // Notice the lack of leading '/'
          pageBuilder: (context, state) => const MaterialPage<void>(
            child: PrivacyScreen(),
          ),
        ),
      ],
    ),
  ],
);
