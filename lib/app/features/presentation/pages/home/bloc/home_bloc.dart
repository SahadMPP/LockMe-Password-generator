import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:password_gen/app/features/domine/entities/password_settings.dart';
import 'package:password_gen/app/features/domine/use_case/password_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PasswordUseCase passwordUseCase;
  HomeBloc(this.passwordUseCase) : super(HomeState.initial()) {
    on<ChangePasswordLenghtEvent>((event, emit) {
      emit(state.copyWith(passwordLength: event.passwordLength));
    });
    on<ChangeLowerCaseEvent>((event, emit) {
      if (!state.isLowercase ||
          state.isLowercase && state.isUppercase ||
          state.isLowercase && state.isNumber ||
          state.isLowercase && state.isSymbol) {
        emit(state.copyWith(isLowercase: !state.isLowercase));
      }
    });
    on<ChangeUppercaseEvent>((event, emit) {
      if (!state.isUppercase ||
          state.isUppercase && state.isLowercase ||
          state.isUppercase && state.isNumber ||
          state.isUppercase && state.isSymbol) {
        emit(state.copyWith(isUppercase: !state.isUppercase));
      }
    });
    on<ChangeNumberEvent>((event, emit) {
      if (!state.isNumber ||
          state.isNumber && state.isLowercase ||
          state.isNumber && state.isUppercase ||
          state.isNumber && state.isSymbol) {
        emit(state.copyWith(isNumber: !state.isNumber));
      }
    });
    on<ChangeSymbolEvent>((event, emit) {
      if (!state.isSymbol ||
          state.isSymbol && state.isLowercase ||
          state.isSymbol && state.isUppercase ||
          state.isSymbol && state.isNumber) {
        emit(state.copyWith(isSymbol: !state.isSymbol));
      }
    });
    on<ChangeExcludedDuplicateEvent>((event, emit) {
      emit(state.copyWith(isExcludeDuplicate: !state.isExcludeDuplicate));
    });
    on<ChangeIncludeSpaceEvent>((event, emit) {
      emit(state.copyWith(isIncludeSpaces: !state.isIncludeSpaces));
    });
    on<ChangeEvent>((event, emit) {
      final max = getMaxPasswordLenght(state);
      emit(state.copyWith(
        passwordLength: state.passwordLength > max ? max : state.passwordLength,
        maxPasswordLength: max,
      ));
    });
    on<GeneratePasswordSubmittedEvent>((event, emit) {
      var params = PasswordSettings(
          passwordLength: state.passwordLength,
          withLowerCase: state.isLowercase,
          withUpperCase: state.isUppercase,
          withSymbol: state.isSymbol,
          withNumber: state.isNumber,
          excludeDuplicate: state.isExcludeDuplicate,
          includeSpaces: state.isIncludeSpaces);

          var randomPassword = passwordUseCase.call(params);
          emit(state.copyWith(password: randomPassword));
    });
  }

  int getMaxPasswordLenght(HomeState state) {
    var maxPasswordLength = 0;
    if (state.isLowercase) maxPasswordLength += 26;
    if (state.isUppercase) maxPasswordLength += 26;
    if (state.isNumber) maxPasswordLength += 10;
    if (state.isSymbol) maxPasswordLength += 23;
    if (state.isIncludeSpaces) maxPasswordLength += 2;
    return maxPasswordLength;
  }
}
