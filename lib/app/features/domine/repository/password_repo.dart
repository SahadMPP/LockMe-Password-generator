import 'package:password_gen/app/features/domine/entities/password_settings.dart';

abstract class PassWordRepo{
  String generatePassword(PasswordSettings passwordSettings);
}