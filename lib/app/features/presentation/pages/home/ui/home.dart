import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/app/features/presentation/pages/home/bloc/home_bloc.dart';
import 'package:password_gen/app/features/presentation/pages/save_list/ui/save_list.dart';
import 'package:password_gen/app/features/widget/bottom_taxt.dart';
import 'package:password_gen/app/features/widget/mini_box.dart';
import 'package:password_gen/app/features/widget/setting_check_box.dart';
import 'package:password_gen/app/features/widget/slider.dart';
import 'package:password_gen/app/features/widget/text_file.dart';

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
                              icon: Icons.save_alt_rounded,
                              onChange: () {
                               
                              }),
                              const SizedBox(width: 10),
                          CustomMiniBox(
                              icon: Icons.view_list_rounded,
                              onChange: () {
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PasswordList(),));
                              }),
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
