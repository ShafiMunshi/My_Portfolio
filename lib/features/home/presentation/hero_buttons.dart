import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants/app_strings.dart';
import 'package:my_portfolio/extension.dart';

import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/styled_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // PrimaryButton(title: context.texts.courses),
        TextButton(
            onPressed: () {
              launchUrl(
                  Uri.parse(
                    'https://github.com/ShafiMunshi',
                  ),
                  mode: LaunchMode.externalApplication);
            },
            child: Text(
              AppStrings.github,
              style: TextStyle(
                color: Colors.blue,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            )),
        Gap(Insets.lg / 2),
        Text('/',
            style: context.textStyles.bodyLgBold
                .copyWith(color: context.colorScheme.onSurface)),
        Gap(Insets.lg / 2),
        TextButton(
            onPressed: () {
              launchUrl(
                  Uri.parse(
                    'https://www.linkedin.com/in/mosharop-hossain-b82112381/',
                  ),
                  mode: LaunchMode.externalApplication);
            },
            child: Text(
              AppStrings.linkedin,
              style: TextStyle(
                  color: Colors.blue,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontStyle: FontStyle.italic,
                  decorationColor: Colors.blue,
                  decoration: TextDecoration.underline),
            )),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(title: AppStrings.courses),
        ),
        Gap(Insets.lg),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(title: AppStrings.cooperationRequest),
        ),
      ],
    );
  }
}
