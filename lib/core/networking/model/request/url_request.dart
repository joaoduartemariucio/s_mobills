class URLRequest {
  const URLRequest({
    required this.path,
    required this.method,
    required this.requiresAuthentication,
  });

  final String path;
  final String method;
  final bool requiresAuthentication;
}
