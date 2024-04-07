import 'package:password_gen/app/features/data/local/password_genetator.dart';
import 'package:password_gen/app/features/domine/entities/password_settings.dart';
import 'package:password_gen/app/features/domine/repository/password_repo.dart';

class PasswordRepoImpl implements PassWordRepo{

  PasswordGenerator passwordGenerator;
  PasswordRepoImpl(this.passwordGenerator);

  @override 
  String generatePassword(PasswordSettings passwordSettings){
    return passwordGenerator.generatePassword(passwordSettings);
  }
}