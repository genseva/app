import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height - kToolbarHeight - mediaQuery.viewPadding.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locale.profile,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                locale.everythingAboutYou,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.unselectedWidgetColor,
                ),
              ),
              const SizedBox(height: 32),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      Assets.assetsUser,
                      height: 100,
                    ),
                  ),
                  PositionedDirectional(
                    end: -8,
                    top: -6,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: theme.primaryColorDark,
                      foregroundColor: theme.scaffoldBackgroundColor,
                      child: const Icon(Icons.camera_alt, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
               const CustomTextField(
                title: "Phone Number",
                initialValue: "+1 9876543210",
              ),
              const SizedBox(height: 24),
               CustomTextField(
                title: locale.fullName,
                initialValue: "Samantha Smith",
              ),
              const SizedBox(height: 24),
               CustomTextField(
                title: locale.emailAddress,
                initialValue: "samanthasmith@email.com",
              ),
              const Spacer(),
              CustomButton(
                text: locale.update,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
