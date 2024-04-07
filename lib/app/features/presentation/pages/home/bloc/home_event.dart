part of 'home_bloc.dart';

abstract class HomeEvent {}

class ChangeEvent extends HomeEvent {}

class ChangePasswordLenghtEvent extends ChangeEvent{
  final int passwordLength;

  ChangePasswordLenghtEvent({required this.passwordLength});
}

class ChangeLowerCaseEvent extends ChangeEvent{}

class ChangeUppercaseEvent extends ChangeEvent{}

class ChangeNumberEvent extends ChangeEvent{}

class ChangeSymbolEvent extends ChangeEvent{}

class ChangeExcludedDuplicateEvent extends ChangeEvent{}

class ChangeIncludeSpaceEvent extends ChangeEvent{}

class GeneratePasswordSubmittedEvent extends HomeEvent {}

