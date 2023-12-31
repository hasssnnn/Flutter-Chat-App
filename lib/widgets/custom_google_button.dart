import 'package:flutter/material.dart';


class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key, required this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue[600],
        ),
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: .7,
                  image: AssetImage(
                    'assets/images/google.png',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "Google",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
