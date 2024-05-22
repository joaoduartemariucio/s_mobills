import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/modules/transactions/module.dart';

part 'new_transaction_request.freezed.dart';

@freezed
class NewTransactionRequest with _$NewTransactionRequest {
  factory NewTransactionRequest({
    required double value,
    required String description,
    required DateTime date,
    required bool done,
    required String type,
    required String category,
  }) = _NewTransactionRequest;

  NewTransactionRequest._();

  factory NewTransactionRequest.toData({required NewTransaction transaction}) {
    return NewTransactionRequest(
      value: transaction.value,
      description: transaction.description,
      date: transaction.date,
      done: transaction.done,
      type: transaction.transactionType.name,
      category: transaction.categoryType.name,
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
