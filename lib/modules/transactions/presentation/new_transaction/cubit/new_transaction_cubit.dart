import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';

part 'new_transaction_state.dart';
part 'new_transaction_cubit.freezed.dart';

class NewTransactionCubit extends Cubit<NewTransactionState> {
  NewTransactionCubit() : super(const NewTransactionState.initial());

  void setupTransactionType({required TransactionType transactionType}) {
    emit(state.copyWith(transactionType: transactionType));
  }

  void editTransactionValue() {}
}
