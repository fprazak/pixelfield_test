import 'package:flutter/material.dart';
import 'package:pixelfield_test/generated/l10n.dart';
import 'package:pixelfield_test/src/ui/widget/button_widgets.dart';
import 'package:pixelfield_test/utils/colors.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final L = S.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/common/background.png"),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Container(
                height: 264,
                width: 343,
                color: AppColors.containerBlueColor,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      L.welcome,
                      style: AppTextStyles.headlineLStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      L.text,
                      style: AppTextStyles.bodyLStyle,
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      buttonTitle: L.scanBottle,
                      width: 311,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            L.haveAnAccount,
                            style: AppTextStyles.textButtonLStyleGrey,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/signIn'),
                          child: Text(
                            L.signInFirst,
                            style: AppTextStyles.secondaryLStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
