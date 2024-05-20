import 'package:deligo/features/language/ui/language_page.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

import 'login/ui/login_page.dart';
import 'registration/ui/registration_page.dart';
import 'verification/ui/verification_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/language';
  static const String loginPage = 'login/login';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
}

class LoginNavigator extends StatelessWidget {
  const LoginNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.loginRoot,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              builder = (BuildContext _) => const LanguagePage(fromRoot: true);
              break;
            case LoginRoutes.loginPage:
              builder = (BuildContext _) => const LoginPage();
              break;
            case LoginRoutes.registration:
              builder = (BuildContext _) => RegistrationPage(
                    settings.arguments as String?,
                  );
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage(
                    () => Navigator.pushReplacementNamed(
                      context,
                      PageRoutes.bottomNavigation,
                    ),
                  );
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
