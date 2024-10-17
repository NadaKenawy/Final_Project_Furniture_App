
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth/components/show_snak_bar.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/auth/components/custom_button.dart';
import 'package:furniture_app/screens/auth/components/custom_text_field.dart';
import 'package:furniture_app/screens/auth/components/custom_title_text.dart';
import 'package:furniture_app/screens/auth/components/furniture_logo.dart';
import 'package:furniture_app/screens/auth/components/have_account.dart';
import 'package:furniture_app/screens/auth/login_page.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String id = 'signUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Spacer(flex: 2),
                const FurnitureLogo(),
                const Spacer(flex: 1),
                const CustomTitleText(
                  titleText: 'SIGN UP',
                ),
                const SizedBox(height: 20),
                buildEmailField(),
                const SizedBox(height: 12),
                buildPasswordField(),
                const SizedBox(height: 20),
                buildSignUpButton(),
                const SizedBox(height: 12),
                HaveAccount(
                  hintText: 'Login',
                  pageRoute: LoginPage.id,
                  messageText: 'Have an account? ',
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return CustomTextField(
      onChange: (data) {
        _email = data;
      },
      hintText: 'Email',
    );
  }

  Widget buildPasswordField() {
    return CustomTextField(
      onChange: (data) {
        _password = data;
      },
      hintText: 'Password',
      obscure: true,
    );
  }

  Widget buildSignUpButton() {
    return CustomButton(
      title: 'Sign up',
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          await performSignUp();
        }
      },
    );
  }

  Future<void> performSignUp() async {
    setState(() => isLoading = true);
    try {
      await signUpUser();
      Navigator.of(context).pushNamed(ProductsScreen.id, arguments: _email);
    } on FirebaseAuthException catch (e) {
      handleSignUpError(e);
    } catch (e) {
      showSnacBar(context, e.toString());
    }
    setState(() => isLoading = false);
  }

  Future<void> signUpUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _email!,
      password: _password!,
    );
  }

  void handleSignUpError(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      showSnacBar(context, 'Weak password');
    } else if (e.code == 'email-already-in-use') {
      showSnacBar(context, 'Account already exists for this email');
    }
  }
}
