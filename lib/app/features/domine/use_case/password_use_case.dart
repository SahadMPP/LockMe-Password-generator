import 'package:password_gen/app/core/use_case/use_case.dart';
import 'package:password_gen/app/features/domine/entities/password_settings.dart';
import 'package:password_gen/app/features/domine/repository/password_repo.dart';

class PasswordUseCase implements UseCase<String, PasswordSettings> {
  final PassWordRepo passWordRepo;
  PasswordUseCase(this.passWordRepo);

  @override
  String call(PasswordSettings params) {
    return passWordRepo.generatePassword(params);
  }
}
