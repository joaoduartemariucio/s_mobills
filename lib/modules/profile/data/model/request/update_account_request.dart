import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/modules/profile/module.dart';

part 'update_account_request.freezed.dart';

@freezed
class UpdateAccountRequest with _$UpdateAccountRequest {
  factory UpdateAccountRequest({
    required String name,
    required double balance,
  }) = _UpdateAccountRequest;

  UpdateAccountRequest._();

  factory UpdateAccountRequest.toData({required BankAccount account}) {
    return UpdateAccountRequest(
      name: account.name,
      balance: account.balance.value,
    );
  }

  static JSON toUpdateJson({
    String? name,
    double? balance,
  }) {
    return <String, Object?>{
      if (name != null) 'name': name,
      if (balance != null) 'balance': balance,
    };
  }

  JSON toJson() {
    return <String, Object?>{
      'name': name,
      'balance': balance,
    };
  }
}
