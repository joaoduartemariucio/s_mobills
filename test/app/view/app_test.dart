import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/modules/auth/presentation/login/view/login_page.dart';
import 'package:s_mobills/ui/ui.dart';

void main() {
  group('App', () async {
    final theme = await SMobillsLoadTheme.load(
      'lib/resources/theme/s_mobills_theme.json',
    );

    final darkTheme = await SMobillsLoadTheme.load(
      'lib/resources/theme/s_mobills_theme_dark.json',
    );

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          theme: theme,
          darkTheme: darkTheme,
        ),
      );
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
