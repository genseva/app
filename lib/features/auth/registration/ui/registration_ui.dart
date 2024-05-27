import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  const RegistrationUI(this.registrationInteractor, this.phoneNumber, {super.key});

  @override
  State<RegistrationUI> createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.signUpNow,
                  style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Text(
                  locale.youAreNotRegistered,
                  style: theme.textTheme.labelLarge!,
                ),
                const SizedBox(
                  height: 28,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/placeholder_profile.png',
                        height: 85,
                        width: 85,
                      ),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: blackColor,
                      child: Icon(
                        Icons.photo_camera,
                        color: theme.scaffoldBackgroundColor,
                        size: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                CustomTextField(
                  hintText: locale.enterPhoneNumber,
                  title: locale.phoneNumber,
                  initialValue:
                      widget.phoneNumber!.isEmpty ? '+1 987 654 3210' : widget.phoneNumber,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  hintText: locale.enterFullName,
                  title: locale.fullName,
                  initialValue: 'Samantha Smith',
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  hintText: locale.enterEmailAddress,
                  title: locale.emailAddress,
                  initialValue: 'samanthasmith@gmail.com',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 28.0, left: 16, right: 16, top: 8),
        child: CustomButton(
          onTap: () {
            widget.registrationInteractor.register('phoneNumber', 'name', 'email');
          },
        ),
      ),
    );
  }
}
