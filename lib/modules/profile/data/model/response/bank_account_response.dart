import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';

part 'bank_account_response.freezed.dart';
part 'bank_account_response.g.dart';

@freezed
class BankAccountResponse with _$BankAccountResponse {
  factory BankAccountResponse({
    required int id,
    required String name,
    required double balance,
  }) = _BankAccountResponse;

  BankAccountResponse._();

  factory BankAccountResponse.fromJson(JSON json) =>
      _$BankAccountResponseFromJson(json);
}
