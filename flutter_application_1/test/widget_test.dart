import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Asigură-te că folosești calea corectă.

void main() {
  testWidgets('Verifică aplicația Barbershop', (WidgetTester tester) async {
    await tester.pumpWidget(BarbershopApp()); // Înlocuiește 'MyApp' cu 'BarbershopApp'.

    // Adaugă teste pentru a verifica widgeturile tale.
    expect(find.text('Cea mai apropiată frizerie'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
