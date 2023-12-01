import 'package:flutter/material.dart';
import 'package:pixelfield_test/generated/l10n.dart';
import 'package:pixelfield_test/src/ui/widget/button_widgets.dart';
import 'package:pixelfield_test/utils/colors.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final L = S.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the shadow
        leading: IconButton(
          icon: Image.asset(
            'assets/images/common/arrow_left.png',
            height: 24,
          ), // Replace with your image path
          onPressed: () {
            Navigator.pop(context); // Navigate back when the image is pressed
          },
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              L.signIn,
              style: AppTextStyles.headlineLStyle,
            ),
            SizedBox(height: size.height * 0.08),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: L.email,
                labelStyle:
                    const TextStyle(color: AppColors.primaryYellowColor),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryYellowColor),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryYellowColor),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: AppTextStyles.bodyLStyleGrey,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: L.password,
                labelStyle:
                    const TextStyle(color: AppColors.primaryYellowColor),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryYellowColor),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryYellowColor),
                ),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                    color: AppColors.primaryYellowColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              obscureText: _isObscure,
              textInputAction: TextInputAction.done,
              style: AppTextStyles.bodyLStyleGrey,
            ),
            SizedBox(height: size.height * 0.05),
            PrimaryButton(
              buttonTitle: L.continueAction,
              onPressed: () => Navigator.pushNamed(context, '/home'),
              width: 343,
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    L.cantSignIn,
                    style: AppTextStyles.textButtonLStyleGrey,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    L.recoverPassword,
                    style: AppTextStyles.secondaryLStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
