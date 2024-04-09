import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/app/features/presentation/pages/home/bloc/home_bloc.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isCopy = false;
  Color broderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[700],
            border: Border.all(color: broderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              controller: state.passwordController,
              readOnly: true,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: state.passwordController.text));
                setState(() => broderColor = Colors.blue);
                Timer(const Duration(milliseconds: 300),
                    () => setState(() => broderColor = Colors.transparent));
              },
            ),
          ),
        );
      },
    );
  }
}

