enum Constants { dev, stg, prod }

extension ConstantsExtension on Constants {
  String get baseUrl {
    switch (this) {
      case Constants.dev:
        return 'http://192.168.1.47:5001/api';
      case Constants.stg:
        return 'https://s-mobils.theonlyducks.com.br/api';
      case Constants.prod:
        return 'https://s-mobils.theonlyducks.com.br/api';
    }
  }
}
