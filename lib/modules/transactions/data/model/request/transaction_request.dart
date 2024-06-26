import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/modules/transactions/module.dart';

part 'transaction_request.freezed.dart';

@freezed
class TransactionRequest with _$TransactionRequest {
  factory TransactionRequest({
    required double value,
    required String description,
    required DateTime date,
    required bool done,
    required String type,
    required String category,
  }) = _TransactionRequest;

  TransactionRequest._();

  factory TransactionRequest.newTransaction({
    required NewTransaction transaction,
  }) {
    return TransactionRequest(
      value: transaction.value,
      description: transaction.description,
      date: transaction.date,
      done: transaction.done,
      type: transaction.transactionType.name,
      category: transaction.categoryType.name,
    );
  }

  factory TransactionRequest.editTransaction({
    required Transaction transaction,
  }) {
    return TransactionRequest(
      value: transaction.value.value,
      description: transaction.description,
      date: transaction.date,
      done: transaction.done,
      type: transaction.type.name,
      category: transaction.category.name,
    );
  }

  JSON toJson() {
    return <String, Object?>{
      'value': value,
      'description': description,
      'date': date.toIso8601String(),
      'done': done,
      'type': type,
      'category': category,
    };
  }
}
