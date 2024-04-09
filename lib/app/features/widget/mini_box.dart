import 'package:flutter/material.dart';

class CustomMiniBox extends StatelessWidget {
  final IconData icon;
  final VoidCallback onChange;
  const CustomMiniBox({
    super.key,
    required this.icon,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]!, width: 1),
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
          onPressed: onChange,
          icon: Icon(
            icon,
            size: 20,
            color: Colors.white70,
          )),
    );
  }
}
