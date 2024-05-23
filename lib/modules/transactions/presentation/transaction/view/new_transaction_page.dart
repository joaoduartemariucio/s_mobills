// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

class NewTransactionPage extends StatelessWidget {
  const NewTransactionPage({
    required this.transactionType,
    super.key,
  });

  final TransactionType transactionType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionCubit(
        deleteTransactionUseCase: GetIt.I<DeleteTransactionUseCase>(),
        newTransactionUseCase: GetIt.I<NewTransactionUseCase>(),
        updateTransactionUseCase: GetIt.I<UpdateTransactionUseCase>(),
      )..setupTransactionType(
          transactionType: transactionType,
        ),
      child: const TransactionView(),
    );
  }
}
