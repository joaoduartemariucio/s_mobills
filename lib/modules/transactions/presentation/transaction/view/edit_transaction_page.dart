import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/modules/transactions/module.dart';

class EditTransactionPage extends StatelessWidget {
  const EditTransactionPage({
    required this.transaction,
    super.key,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionCubit(
        deleteTransactionUseCase: GetIt.I<DeleteTransactionUseCase>(),
        newTransactionUseCase: GetIt.I<NewTransactionUseCase>(),
        updateTransactionUseCase: GetIt.I<UpdateTransactionUseCase>(),
      )..setupTransaction(transaction: transaction),
      child: const TransactionView(),
    );
  }
}
