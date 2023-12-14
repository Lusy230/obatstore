import 'package:apotek/view/todo_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('TodoList displays UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TodoList()));
    expect(find.text('Todo List'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('TodoList adds and removes items', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TodoList()));
    expect(find.byType(Dismissible), findsNothing);

    // Add an item
    await tester.enterText(find.byType(TextField), 'Task 1');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify if the item is added
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text('Task 1'), findsOneWidget);

    // Dismiss the item
    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
    await tester.pumpAndSettle();

    // Verify if the item is removed
    expect(find.byType(ListTile), findsNothing);
  });
}
