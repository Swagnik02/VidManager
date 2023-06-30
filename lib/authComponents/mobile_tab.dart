import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidmanager/constants/color_constants.dart';

class MobileTab extends StatelessWidget {
  // MobileTab({super.key});
  MobileTab({Key? key, required this.onNextPressed}) : super(key: key);
  final countrycode = TextEditingController(text: "+91");

  final TextEditingController _phone = TextEditingController();
  final VoidCallback onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40.0),
        Text(
          'Phone Verification : ',
          style: GoogleFonts.roboto(
            fontSize: 25,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30.0),
        Container(
          height: 55,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: ColorConstants.btnEnabled),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: countrycode,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Text(
                  '|',
                  style: TextStyle(
                    fontSize: 33,
                    color: ColorConstants.btnEnabled,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: ColorConstants.btnEnabled),
          ),
          child: Material(
            elevation: 5.0,
            color: const Color.fromARGB(109, 210, 139, 33),
            borderRadius: BorderRadius.circular(50.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_rounded),
              color: Colors.grey,
              onPressed: onNextPressed,
              // splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
