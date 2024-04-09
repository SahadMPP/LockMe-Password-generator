import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/app/features/data/function/db_functions.dart';
import 'package:password_gen/app/features/data/model/llist_model.dart';
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
    TextEditingController textEditingController = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey();
    GlobalKey<FormState> formkey1 = GlobalKey();
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
                    CustomTextField(keyg: formkey1),
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
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              return CustomMiniBox(
                                  icon: Icons.save_alt_rounded,
                                  onChange: () {
                                    if (formkey1.currentState!.validate()) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Give a title'),
                                            content: SingleChildScrollView(
                                                child: Form(
                                              key: formkey,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "title is empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                controller:
                                                    textEditingController,
                                                decoration: InputDecoration(
                                                    hintText: "title",
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8))),
                                              ),
                                            )),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Add'),
                                                onPressed: () {
                                                  if (formkey.currentState!
                                                      .validate()) {
                                                    PasswordList list = PasswordList(
                                                        title:
                                                            textEditingController
                                                                .text,
                                                        password: state
                                                            .passwordController
                                                            .text);
                                                    addPassword(list);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: const Text(
                                                          "Password is saved"),
                                                      backgroundColor:
                                                          Colors.green[500],
                                                      margin:
                                                          const EdgeInsets.all(
                                                              8),
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                    ));
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  });
                            },
                          ),
                          const SizedBox(width: 10),
                          CustomMiniBox(
                              icon: Icons.view_list_rounded,
                              onChange: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const PasswordListSc(),
                                ));
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
