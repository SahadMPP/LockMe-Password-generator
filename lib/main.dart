import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/app/features/data/function/db_functions.dart';
import 'package:password_gen/app/features/data/local/password_genetator.dart';
import 'package:password_gen/app/features/data/repository/password_repo_impl.dart';
import 'package:password_gen/app/features/domine/use_case/password_use_case.dart';
import 'package:password_gen/app/features/presentation/pages/home/bloc/home_bloc.dart';
import 'package:password_gen/app/features/presentation/pages/home/ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeBloc(PasswordUseCase(PasswordRepoImpl(PasswordGenerator()))),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
