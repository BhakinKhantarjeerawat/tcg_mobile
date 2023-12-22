import 'package:flutter/material.dart';
import 'package:my_tcg_mobile/features/authen/presentation/sign_in_screen.dart';
import 'package:my_tcg_mobile/features/home/presentation/home.dart';
import 'package:my_tcg_mobile/route/route_master_observer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routemaster/routemaster.dart';

part 'route_master.g.dart';

@riverpod
RoutemasterDelegate routemasterDelegate(RoutemasterDelegateRef ref) {
  // final authStatus = ref.watch(getAuthStatusProvider).value;
  const authStatus = 'notSignedIn';

  return RoutemasterDelegate(
      observers: [MyObserver()],
      routesBuilder: (context) {
        switch (authStatus) {
          case 'notSignedIn':
            return RouteMap(
              onUnknownRoute: (context) => const Redirect('/'),
              routes: {
                '/': (_) => const MaterialPage(child: SignInScreen()),
              },
            );
          case 'loggedIn':
            return RouteMap(
              onUnknownRoute: (_) => const Redirect('/'),
              routes: {
                '/': (_) => const MaterialPage(child: HomeScreen()),
              },
            );
        }

        /// this is the duplicate of (signedIn) if riverpod return null value (becasue loading, error ,or the true null)
        return RouteMap(
          onUnknownRoute: (context) => const Redirect('/'),
          routes: {
            '/': (_) => const MaterialPage(child: SignInScreen()),
          },
        );
      });
}
