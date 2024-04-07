import 'package:flutter/material.dart';
import 'package:password_gen/app/core/slider.dart';
import 'package:password_gen/app/features/widget/setting_check_box.dart';

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
                  SettingBox(
                      text: "Uppercases(A-Z)", value: false, onChange: () {}),
                  SettingBox(
                      text: "Lowercases(a-z)", value: false, onChange: () {}),
                  SettingBox(
                      text: "Number(0-9)", value: false, onChange: () {}),
                  SettingBox(
                      text: "Symbols(&#@\$!)", value: false, onChange: () {}),
                  const CustomSlider(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'kf0349u9hisaddkwajdoiawdokljknf09eu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      CustomMiniBox(icon: Icons.copy, onChange: () {}),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomMiniBox(
                            icon: Icons.refresh_rounded, onChange: () {}),
                        const SizedBox(width: 10),
                        CustomMiniBox(
                            icon: Icons.save_alt_rounded, onChange: () {}),
                      ],
                    ),
                  ),
                  const Spacer(),
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
      ],
    ));
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

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 25),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Text(
            "Length",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w700),
          ),
          SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                trackHeight: 1,
                activeTickMarkColor: Colors.transparent,
                inactiveTickMarkColor: Colors.transparent,
                thumbColor: const Color.fromARGB(197, 100, 100, 100),
                trackShape: const RectangularSliderTrackShape(),
                thumbShape: const CustomSquareSliderThumbShape(
                  thumbRadius: 9.0, // Adjust the radius as needed
                ),
              ),
              child: Slider(
                min: 6,
                max: 20,
                value: 15,
                onChanged: (value) {},
              )),
          const Spacer(),
          const Text(
            "32",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
