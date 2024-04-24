import 'package:s_mobills/modules/modules.dart';

class ModulesDI {
  static void initializeDependencies() {
    AuthDI.initializeDependencies();
    ProfileDI.initializeDependencies();
  }
}
