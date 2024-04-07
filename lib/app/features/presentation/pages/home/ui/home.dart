import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/app/features/presentation/pages/home/bloc/home_bloc.dart';
import 'package:password_gen/app/features/widget/setting_check_box.dart';
import 'package:password_gen/app/features/widget/slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/pexels-rebecca-diack-1154723.jpg"),
                fit: BoxFit.fill),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                width: 5,
                color: Colors.grey.withOpacity(0.32),
              ),
              color: Colors.black.withOpacity(0.81),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'UnknowPass',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 270,
                      ),
                      child: const Text(
                        'Create strong passwords that no one can break!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            SettingBox(
                              text: "Uppercases(A-Z)",
                              value: state.isUppercase,
                              onChange: () => context
                                  .read<HomeBloc>()
                                  .add(ChangeUppercaseEvent()),
                            ),
                            SettingBox(
                              text: "Lowercases(a-z)",
                              value: state.isLowercase,
                              onChange: () => context
                                  .read<HomeBloc>()
                                  .add(ChangeLowerCaseEvent()),
                            ),
                            SettingBox(
                              text: "Number(0-9)",
                              value: state.isNumber,
                              onChange: () => context
                                  .read<HomeBloc>()
                                  .add(ChangeNumberEvent()),
                            ),
                            SettingBox(
                              text: "Symbols(&#@\$!)",
                              value: state.isSymbol,
                              onChange: () => context
                                  .read<HomeBloc>()
                                  .add(ChangeSymbolEvent()),
                            ),
                            SettingBox(
                              text: "Exclude Duplicate",
                              value: state.isExcludeDuplicate,
                              onChange: () => context
                                  .read<HomeBloc>()
                                  .add(ChangeExcludedDuplicateEvent()),
                            ),
                            SettingBox(
                              text: "Include Space",
                              value: state.isIncludeSpaces,
                              onChange: () => context
                                  .read<HomeBloc>()
                                  .add(ChangeIncludeSpaceEvent()),
                            ),
                          ],
                        );
                      },
                    ),

                    const CustomSlider(),
                    const SizedBox(height: 20),
                    const CustomTextField(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomMiniBox(
                              icon: Icons.refresh_rounded,
                              onChange: () {                           
                                context
                                    .read<HomeBloc>()
                                    .add(GeneratePasswordSubmittedEvent());
                              }),
                          const SizedBox(width: 10),
                          CustomMiniBox(
                              icon: Icons.save_alt_rounded, onChange: () {}),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    const CustomBottomText(
                        icon: Icons.no_encryption_outlined,
                        text: "No data traking"),
                    const CustomBottomText(
                        icon: Icons.lock_outline_rounded,
                        text: "Guaranteed security"),
                    const CustomBottomText(
                        icon: Icons.private_connectivity,
                        text: "Privacy friendly"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

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

class CustomBottomText extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomBottomText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 15,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}

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
