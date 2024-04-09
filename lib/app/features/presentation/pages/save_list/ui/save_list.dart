import 'package:flutter/material.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({super.key});

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
                child: ListView.builder(
                  itemBuilder: (context,index) {
                    return Container(
                      height: 70,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.edit,color: Colors.grey,)),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.delete,color: Colors.red,)),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ),
            IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
          ],
        ),
      ),
    );
  }
}
