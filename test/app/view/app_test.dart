import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/modules/auth/presentation/login/view/login_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
