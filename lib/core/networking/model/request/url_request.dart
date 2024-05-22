class URLRequest {
  URLRequest({
    required this.path,
    required this.method,
    required this.requiresAuthentication,
  });

  final String path;
  final String method;
  final bool requiresAuthentication;

  URLRequest setParameter({dynamic parameter}) {
    return URLRequest(
      path: '$path/$parameter',
      method: method,
      requiresAuthentication: requiresAuthentication,
    );
  }
}
