import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/app/core/slider.dart';
import 'package:password_gen/app/features/presentation/pages/home/bloc/home_bloc.dart';

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
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Row(
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
                    max: state.maxPasswordLength.toDouble(),
                    value: state.passwordLength.toDouble(),
                    onChanged: (value)=> context.read<HomeBloc>().add(ChangePasswordLenghtEvent(passwordLength: value.toInt())),
                  )),
              const Spacer(),
               Text(
                state.passwordLength.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        },
      ),
    );
  }
}
