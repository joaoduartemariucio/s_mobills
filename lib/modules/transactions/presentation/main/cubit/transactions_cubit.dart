import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsState.initial());

  void addTransaction({required TransactionType type}) {
    AppRouter.router.push(Routes.newTransaction.fullPath);
  }
}
