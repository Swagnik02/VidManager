import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidmanager/constants/color_constants.dart';
import '../constants/routes.dart';

class RegisterColumn extends StatelessWidget {
  const RegisterColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Container(
            color: ColorConstants.textFieldBg,
            child: const TextField(
              enableSuggestions: true,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Enter your username here',
                labelText: 'Username',
                labelStyle: TextStyle(color: ColorConstants.accentColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.accentColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.accentColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Container(
            color: ColorConstants.textFieldBg,
            child: const TextField(
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter your email here',
                labelText: 'Email Id',
                labelStyle: TextStyle(
                  color: ColorConstants.accentColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.accentColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.accentColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Container(
            color: ColorConstants.textFieldBg,
            child: const TextField(
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Enter your password here',
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: ColorConstants.accentColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.accentColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.accentColor,
                  ),
                ),
              ),
            ),
          ),
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
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  mainRoute,
                  (route) => false,
                );
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
