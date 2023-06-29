import 'package:flutter/material.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              width: 200,
              height: 150,
              child: Image.asset(
                'assets/icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'VidManager',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
