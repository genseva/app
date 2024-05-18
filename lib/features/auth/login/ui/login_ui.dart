import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_field.dart';
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
                Expanded(
                    child: Image.asset('assets/logo_main.png', scale: 3.2)),
                Text(
                  "${locale.heyMate},",
                  style: theme.textTheme.caption!
                      .copyWith(fontSize: 14, color: greyTextColor),
                ),
                const SizedBox(height: 8),
                Text(
                  locale.signInNow,
                  style: theme.textTheme.headline5!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 60),
                CustomTextField(
                  textEditingController: _numberController,
                  hintText: locale.enterPhoneNumber,
                  title: 'Phone Number',
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  onTap: () {
                    widget.loginInteractor
                        .loginWithPhone('', _numberController.text);
                  },
                ),
                const SizedBox(height: 42),
                Text(
                  locale.orContinueWith,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      prefix: 'assets/fb.png',
                      text: locale.facebook,
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: CustomButton(
                      prefix: 'assets/google.png',
                      text: locale.google,
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                    )),
                  ],
                ),
                const SizedBox(height: 42),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
