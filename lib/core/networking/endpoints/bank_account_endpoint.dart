// ignore_for_file: no_default_cases

import 'package:s_mobills/core/networking/model/request/endpoint.dart';
import 'package:s_mobills/core/networking/model/request/request_method.dart';
import 'package:s_mobills/core/networking/model/request/url_request.dart';

enum BankAccountEndpoint implements Endpoint {
  createAccount,
  deleteAccount,
  updateAccount,
  accounts;

  @override
  String get path {
    switch (this) {
      case createAccount || deleteAccount || updateAccount:
        return '/account';
      case accounts:
        return '/account/user';
    }
  }

  @override
  RequestMethod get method {
    switch (this) {
      case createAccount:
        return RequestMethod.POST;
      case deleteAccount:
        return RequestMethod.DELETE;
      case updateAccount:
        return RequestMethod.PUT;
      case accounts:
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
