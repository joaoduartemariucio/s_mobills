import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

class UpdateTransactionUseCase {
  UpdateTransactionUseCase({required this.repository});

  final TransactionRepository repository;

  Future<void> call({required TransactionState state}) async {
    if (state.bankAccountId == -1) {
      throw SMobillsException(message: 'Selecione uma conta valida');
    }

    if (state.description.isEmpty) {
      throw SMobillsException(message: 'Insira uma descrição');
    }

    if (state.transactionValue == 0) {
      throw SMobillsException(
        message: r'O valor da transação não pode ser R$ 0,00',
      );
    }

    final transaction = Transaction.stateToDomain(state);

    return repository.updateTransaction(transaction: transaction);
  }
}
