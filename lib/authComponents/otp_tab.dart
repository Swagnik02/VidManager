// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:vidmanager/constants/color_constants.dart';
import '../constants/routes.dart';

class OtpTab extends StatelessWidget {
  OtpTab({Key? key}) : super(key: key);

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    
    textStyle: const TextStyle(
        fontSize: 20,
        color: ColorConstants.btnEnabled,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  late final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(8),
  );

  late final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: ColorConstants.textFieldBg,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40.0),
        Text(
          'Enter Your OTP',
          style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
        ),
        const SizedBox(height: 16.0),
        Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          validator: (s) {
            return s == '2222' ? null : 'Pin is incorrect';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) => print(pin),
        ),
        const SizedBox(
          height: 15,
        ),
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
                'Check',
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
