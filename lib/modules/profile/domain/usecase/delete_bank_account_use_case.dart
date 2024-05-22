import 'package:s_mobills/modules/profile/module.dart';

class DeleteBankAccountUseCase {
  DeleteBankAccountUseCase({required this.repository});

  final ProfileRepository repository;

  Future<void> call({required int id}) async {
    return repository.deleteAccount(id: id);
  }
}
