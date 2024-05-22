import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/modules/profile/module.dart';

part 'create_account_request.freezed.dart';

@freezed
class CreateAccountRequest with _$CreateAccountRequest {
  factory CreateAccountRequest({
    required String name,
    required double balance,
  }) = _CreateAccountRequest;

  CreateAccountRequest._();

  factory CreateAccountRequest.toData({required CreateAccount account}) {
    return CreateAccountRequest(
      name: account.name,
      balance: account.balance,
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
