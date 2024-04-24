enum Constants { dev, stg, prod }

extension ConstantsExtension on Constants {
  String get name {
    switch (this) {
      case Constants.dev:
        return 'DEV';
      case Constants.stg:
        return 'STG';
      case Constants.prod:
        return 'PROD';
    }
  }

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
