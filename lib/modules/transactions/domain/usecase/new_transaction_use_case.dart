import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/presentation/new_transaction/cubit/new_transaction_cubit.dart';

class NewTransactionUseCase {
  Future<void> call({required NewTransactionState state}) async {
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
  }
}
