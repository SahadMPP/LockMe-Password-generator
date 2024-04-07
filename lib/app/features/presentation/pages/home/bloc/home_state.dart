part of 'home_bloc.dart';

class HomeState {
  final int passwordLength;
  final int maxPasswordLength;
  final bool isLowercase;
  final bool isUppercase;
  final bool isNumber;
  final bool isSymbol;
  final bool isExcludeDuplicate;
  final bool isIncludeSpaces;
  final TextEditingController passwordController;

  const HomeState(
      {required this.passwordLength,
      required this.maxPasswordLength,
      required this.isLowercase,
      required this.isUppercase,
      required this.isNumber,
      required this.isSymbol,
      required this.isExcludeDuplicate,
      required this.isIncludeSpaces,
      required this.passwordController});

  factory HomeState.initial() => HomeState(
      passwordLength: 10,
      maxPasswordLength: 26,
      isLowercase: true,
      isUppercase: false,
      isNumber: false,
      isSymbol: false,
      isExcludeDuplicate: false,
      isIncludeSpaces: false,
      passwordController: TextEditingController(text: ''));

  HomeState copyWith({
    int? passwordLength,
    int? maxPasswordLength,
    bool? isLowercase,
    bool? isUppercase,
    bool? isNumber,
    bool? isSymbol,
    bool? isExcludeDuplicate,
    bool? isIncludeSpaces,
    String? password,
  }) =>
      HomeState(
          passwordLength: passwordLength ?? this.passwordLength,
          maxPasswordLength: maxPasswordLength ?? this.maxPasswordLength,
          isLowercase: isLowercase ?? this.isLowercase,
          isUppercase: isUppercase ?? this.isUppercase,
          isNumber: isNumber ?? this.isNumber,
          isSymbol: isSymbol ?? this.isSymbol,
          isExcludeDuplicate: isExcludeDuplicate ?? this.isExcludeDuplicate,
          isIncludeSpaces: isIncludeSpaces ?? this.isIncludeSpaces,
          passwordController: password != null
              ? TextEditingController(text: password)
              : passwordController);
}

// final class HomeInitial extends HomeState {}



