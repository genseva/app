import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  const LoginUI(this.loginInteractor, {Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                Image.asset('assets/logo_main.png', scale: 3.2),
                Text(
                  // "${locale.welcomeTo}\n${AppConfig.appName}",
                  "Hey mate,",
                  style: theme.textTheme.caption!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in now',
                  style: theme.textTheme.headline5!,
                ),
                const Spacer(),
                // EntryField(
                //   Icon(
                //     Icons.phone_android,
                //     size: 20,
                //     color: theme.primaryColor,
                //   ),
                //   locale.phoneNumber,
                // ),
                const SizedBox(height: 32),
                // CustomButton(
                //   locale.signIn,
                //   () {
                //     widget.loginInteractor
                //         .loginWithPhone('isoCode', 'mobileNumber');
                //   },
                // ),
                const Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
