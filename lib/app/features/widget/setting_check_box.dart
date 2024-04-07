import 'package:flutter/material.dart';

class SettingBox extends StatelessWidget {
  final String text;
  final bool value;
  final VoidCallback onChange;
  const SettingBox({
    super.key,
    required this.text,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                  fontWeight: FontWeight.w700),
            ),
            IconButton(
                onPressed: onChange,
                icon: Icon(
                  value
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  size: 24,
                  color: Colors.white70,
                )),
          ],
        ),
      ),
    );
  }
}
