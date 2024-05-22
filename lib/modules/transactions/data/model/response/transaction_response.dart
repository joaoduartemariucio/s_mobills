import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
class TransactionResponse with _$TransactionResponse {
  factory TransactionResponse({
    required int id,
    required String description,
    required double value,
    required int accountId,
    required DateTime date,
    required bool done,
    required TransactionType type,
    required CategoryType category,
  }) = _TransactionResponse;

  TransactionResponse._();

  factory TransactionResponse.fromJson(JSON json) =>
      _$TransactionResponseFromJson(json);
}
