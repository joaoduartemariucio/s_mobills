// ignore_for_file: no_default_cases

import 'package:s_mobills/core/networking/model/request/endpoint.dart';
import 'package:s_mobills/core/networking/model/request/request_method.dart';
import 'package:s_mobills/core/networking/model/request/url_request.dart';

enum TransactionEndpoint implements Endpoint {
  newTransaction,
  userTransactions;

  @override
  String get path {
    switch (this) {
      case newTransaction:
        return '/transaction/account';
      case userTransactions:
        return '/transaction/user';
    }
  }

  @override
  RequestMethod get method {
    switch (this) {
      case newTransaction:
        return RequestMethod.POST;
      case userTransactions:
        return RequestMethod.GET;
    }
  }

  @override
  bool get requiresAuthentication {
    switch (this) {
      default:
        return true;
    }
  }

  @override
  URLRequest asRequest() {
    return URLRequest(
      method: method.value,
      path: path,
      requiresAuthentication: requiresAuthentication,
    );
  }
}
