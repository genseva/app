import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  const RegistrationUI(this.registrationInteractor, this.phoneNumber,
      {Key? key})
      : super(key: key);

  @override
  State<RegistrationUI> createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Image.asset('Assets.logo', scale: 3.2),
                Text(
                  // "${locale.join} ${AppConfig.appName}\n${locale.community}",
                  "tesst",
                  style: theme.textTheme.headline5,
                ),
                const SizedBox(height: 8),
                Text(
                  'locale.registrationSubtitle',
                  style: theme.textTheme.caption!.copyWith(fontSize: 14),
                ),
                const Spacer(),
                // EntryField(
                //   Icon(Icons.person, color: theme.primaryColor, size: 20),
                //   locale.fullName,
                //   borderType: BorderType.topRound,
                // ),
                // EntryField(
                //   Icon(Icons.email, color: theme.primaryColor, size: 20),
                //   locale.emailAddress,
                //   borderType: BorderType.none,
                // ),
                // EntryField(
                //   Icon(
                //     Icons.phone_android,
                //     color: theme.primaryColor,
                //     size: 20,
                //   ),
                //   locale.phoneNumber,
                //   borderType: BorderType.bottomRound,
                // ),
                // const Spacer(),
                // CustomButton(
                //   locale.signUp,
                //   () {
                //     widget.registrationInteractor
                //         .register('phoneNumber', 'name', 'email');
                //   },
                // ),
                // const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
