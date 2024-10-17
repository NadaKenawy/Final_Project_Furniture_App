// ignore_for_file: unused_local_variable, prefer_const_constructors_in_immutables, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth/components/show_snak_bar.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/auth/components/custom_button.dart';
import 'package:furniture_app/screens/auth/components/custom_text_field.dart';
import 'package:furniture_app/screens/auth/components/custom_title_text.dart';
import 'package:furniture_app/screens/auth/components/furniture_logo.dart';
import 'package:furniture_app/screens/auth/components/have_account.dart';
import 'package:furniture_app/screens/auth/sign_up.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Spacer(flex: 2),
                const FurnitureLogo(),
                const Spacer(flex: 1),
                const CustomTitleText(titleText: 'LOGIN'),
                const SizedBox(height: 20),
                CustomTextField(
                  onChange: (data) => email = data,
                  hintText: 'Email',
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  onChange: (data) => password = data,
                  hintText: 'Password',
                  obscure: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  title: 'LOGIN',
                  onTap: () => _handleLogin(context),
                ),
                const SizedBox(height: 12),
                const HaveAccount(
                  hintText: 'Sign Up',
                  pageRoute: SignUpPage.id,
                  messageText: 'Don\'t have an account? ',
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      setLoading(true);
      try {
        await loginUser();
        Navigator.of(context).pushNamed(ProductsScreen.id, arguments: email);
      } on FirebaseAuthException catch (e) {
        handleAuthErrors(e, context);
      } catch (e) {
        showSnacBar(context, e.toString());
      } finally {
        setLoading(false);
      }
    }
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  void handleAuthErrors(FirebaseAuthException e, BuildContext context) {
    final String message = e.code == 'user-not-found'
        ? 'No user found for that email.'
        : e.code == 'wrong-password'
            ? 'Wrong password provided for that user.'
            : 'Wrong email or password';

    showSnacBar(context, message);
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
}
