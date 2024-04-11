import 'package:flutter/material.dart';
import 'package:password_gen/app/features/data/function/db_functions.dart';
import 'package:password_gen/app/features/data/model/llist_model.dart';
import 'package:lottie/lottie.dart';

class PasswordListSc extends StatefulWidget {
  const PasswordListSc({super.key});

  @override
  State<PasswordListSc> createState() => _PasswordListScState();
}

class _PasswordListScState extends State<PasswordListSc> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                child: FutureBuilder(
                    future: getAllPassword(),
                    builder: (context, AsyncSnapshot snapshot) {
                      List<PasswordList> passwordlist = snapshot.data;
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (passwordlist.isEmpty) {
                          return Center(
                            child: LottieBuilder.asset(
                              "asset/Animation - 1712679165409.json",
                              fit: BoxFit.fill,
                              height: 200,
                            ),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: passwordlist.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 70,
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SingleChildScrollView(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              maxWidth: 230),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                passwordlist[index].title,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.5,
                                                ),
                                              ),
                                              Text(
                                                passwordlist[index].password,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                titleEditingController.text =
                                                    passwordlist[index].title;
                                                passwordEditingController.text =
                                                    passwordlist[index]
                                                        .password;
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Form(
                                                      key: formkey,
                                                      child: Column(
                                                        children: [
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .onUserInteraction,
                                                            controller:
                                                                titleEditingController,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return "Field is empty";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                          ),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .onUserInteraction,
                                                            controller:
                                                                passwordEditingController,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return "Field is empty";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              "Close")),
                                                      TextButton(
                                                          onPressed: () {
                                                            if (formkey
                                                                .currentState!
                                                                .validate()) {
                                                              PasswordList data = PasswordList(
                                                                  title:
                                                                      titleEditingController
                                                                          .text,
                                                                  password:
                                                                      passwordEditingController
                                                                          .text,
                                                                  id: passwordlist[
                                                                          index]
                                                                      .id);
                                                              setState(() {
                                                                update(data);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                            }
                                                          },
                                                          child: const Text(
                                                              "Update")),
                                                    ],
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.grey,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          "Are you sure to delete?"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                "Close")),
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                delete(passwordlist[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: const Text(
                                                                    "deleted successfully"),
                                                                backgroundColor:
                                                                    Colors.red[
                                                                        500],
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                              ));
                                                            },
                                                            child: const Text(
                                                                "Sure")),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      }
                    }),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
