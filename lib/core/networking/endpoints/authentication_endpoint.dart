import 'package:s_mobills/core/networking/model/request/endpoint.dart';
import 'package:s_mobills/core/networking/model/request/request_method.dart';
import 'package:s_mobills/core/networking/model/request/url_request.dart';

enum AuthenticationEndpoint implements Endpoint {
  login,
  logout,
  createAccount,
  deleteAccount,
  info,
  edit;

  @override
  String get path {
    switch (this) {
      case login:
        return '/api/auth/login';
      case logout:
        return '/api/auth/logout';
      case createAccount:
        return '/api/user';
      case deleteAccount:
        return '/api/user';
      case info:
        return '/api/user';
      case edit:
        return '/api/user';
    }
  }

  @override
  RequestMethod get method {
    switch (this) {
      case login || logout || createAccount:
        return RequestMethod.POST;
      case deleteAccount:
        return RequestMethod.DELETE;
      case info:
        return RequestMethod.GET;
      case edit:
        return RequestMethod.PUT;
    }
  }

  @override
  bool get requiresAuthentication {
    switch (this) {
      case login || logout || createAccount:
        return false;
      case deleteAccount || info || edit:
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
