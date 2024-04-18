enum Constants { dev, stg, prod }

extension ConstantsExtension on Constants {
  String get baseUrl {
    switch (this) {
      case Constants.dev:
        return 'https://s-mobils.theonlyducks.com.br';
      case Constants.stg:
        return 'https://s-mobils.theonlyducks.com.br';
      case Constants.prod:
        return 'https://s-mobils.theonlyducks.com.br';
    }
  }
}
