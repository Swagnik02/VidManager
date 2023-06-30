// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidmanager/component/show_error_dialogue.dart';
import 'package:vidmanager/constants/color_constants.dart';
import '../component/cust_text_field.dart';
import '../constants/routes.dart';

class RegisterColumn extends StatelessWidget {
  RegisterColumn({super.key});
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        buildCustomTextField(
          'Username',
          'Enter your username here',
          _username,
        ),
        const SizedBox(height: 16.0),
        buildCustomTextField(
          'Email Id',
          'Enter your email here',
          _email,
        ),
        const SizedBox(height: 16.0),
        buildCustomTextField(
          'Password',
          'Enter your password here',
          _password,
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 50, right: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return ColorConstants.btnOnPressed;
                    }
                    return ColorConstants.btnEnabled;
                  },
                ),
              ),
              onPressed: () async {
                final username = _username.text;
                final email = _email.text;
                final password = _password.text;

                if (username.isEmpty) {
                  await showErrorDialogue(context, 'Enter Username');
                  return;
                }
                try {
                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userCredential.user?.uid)
                      .set({
                    'username': username,
                    'email': email,
                  });

                  Navigator.of(context).restorablePushNamedAndRemoveUntil(
                      mainRoute, (route) => false);
                } on FirebaseAuthException catch (e) {
                  if (email.isEmpty && password.isEmpty) {
                    await showErrorDialogue(
                      context,
                      'Enter email and password',
                    );
                  } else if (email.isEmpty) {
                    await showErrorDialogue(
                      context,
                      'Enter email',
                    );
                  } else if (password.isEmpty) {
                    await showErrorDialogue(
                      context,
                      'Enter password',
                    );
                  } else if (e.code == 'weak-password') {
                    await showErrorDialogue(
                      context,
                      'Weak Password',
                    );
                  } else if (e.code == 'email-already-in-use') {
                    await showErrorDialogue(
                      context,
                      'Email Already In Use',
                    );
                  } else if (e.code == 'invalid-email') {
                    await showErrorDialogue(
                      context,
                      'Invalid Email Entered',
                    );
                  } else {
                    await showErrorDialogue(
                      context,
                      'Error: ${e.code}',
                    );
                    // devtools.log(e.stackTrace.toString());
                  }
                } catch (e) {
                  await showErrorDialogue(context, e.toString());
                }
              },
              child: Text(
                'Register',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
