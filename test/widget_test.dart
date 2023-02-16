import 'package:flutter_test/flutter_test.dart';
import 'package:localization_example/auth/auth_localization.dart';
import 'package:localization_example/helper/test_app.dart';

import 'package:localization_example/main.dart';

void main() {
  group('HomePage test', () {
    late AppTestMaterialApp app;
    late AuthLocalization localization;

    setUp(() async {
      localization = AuthLocalization();
      app = AppTestMaterialApp(
        home: HomePage(localization: localization),
      );
    });

    testWidgets('can render HomePage', (WidgetTester tester) async {
      await tester.pumpWidget(app.widget);
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(localization.title, 'Example of Localization');
      expect(find.text(localization.title), findsOneWidget);
    });
  });
}
