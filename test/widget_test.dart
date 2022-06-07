// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import '../lib/main.dart';
import '../lib/views/login_view.dart';

void main() {
  group('Login view tests', () {

    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));


      // В поле email должен быть валидный email-адрес, и оно не должно быть пустым.
      await tester.enterText(find.byKey(const Key('fieldEmail')), 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);
      // await tester.enterText(find.byKey(const Key('fieldEmail')), '');
      // expect(find.text(''), findsOneWidget);

      // Нужно проверить, что в поле phone введены только цифры.
      await tester.enterText(find.byKey(const Key('fieldPhone')), '8008800');
      expect(find.text('8008800'), findsOneWidget);

      // При клике на кнопку «Отправить» нужно убедиться,
      // что на экране появилась надпись «Добро пожаловать».
      await tester.tap(find.byKey(const Key('button1')));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);

    });
  });

  group('Register view tests', () {

    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      await tester.tap(find.byKey(const Key('fieldLoginOrRegister')));
      await tester.pump();

      // Поля firstName и lastName не должны быть пустыми.
      await tester.enterText(find.byKey(const Key('fieldFirstName')), 'Ivan');
      expect(find.text('Ivan'), findsOneWidget);
      // await tester.enterText(find.byKey(const Key('fieldFirstName')), '');
      // expect(find.text(''), findsOneWidget);

      await tester.enterText(find.byKey(const Key('fieldLastName')), 'Ivanov');
      expect(find.text('Ivanov'), findsOneWidget);
      // await tester.enterText(find.byKey(const Key('fieldLastName')), 'Ivanov');
      // expect(find.text('Ivanov'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('fieldEmail')), 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);

      // Нужно проверить, что в поле phone введены только цифры.
      await tester.enterText(find.byKey(const Key('fieldPhone')), '8008800');
      expect(find.text('8008800'), findsOneWidget);

      // При клике на кнопку «Отправить» нужно убедиться,
      // что на экране появилась надпись «Вы успешно зарегистрировались».
      await tester.tap(find.byKey(const Key('button2')));
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);

    });
  });
}
