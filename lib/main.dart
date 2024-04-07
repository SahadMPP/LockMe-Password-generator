import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

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
            child:  Padding(
              padding: const EdgeInsets.only(left:20,right:20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text('UnknowPass',style: TextStyle(
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 270,
                    ),
                    child: const Text('Create strong passwords that no one can break!',textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(8),      
                    ),
                    child: const Text("Uppercases(A-Z)",style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
