import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/modules/transactions/wiring/transactions_di.dart';

class ModulesDI {
  static void initializeDependencies() {
    AuthDI.initializeDependencies();
    ProfileDI.initializeDependencies();
    TransactionDI.initializeDependencies();
  }
}
