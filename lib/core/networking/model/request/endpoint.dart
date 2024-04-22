import 'package:s_mobills/core/networking/model/request/request_method.dart';
import 'package:s_mobills/core/networking/model/request/url_request.dart';

abstract class Endpoint {
  String get path;
  RequestMethod get method;
  bool get requiresAuthentication;

  URLRequest asRequest();
}
