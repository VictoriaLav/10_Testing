// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//запуск интеграционных тестов
//flutter drive --target=test_driver/app.dart

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final fieldFinderSubmit = find.byValueKey('button1');

    test('Test email field', () async {
      await driver!.tap(fieldFinderEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('test@test.com');
      await driver!.waitFor(find.text('test@test.com'));
    });

    test('Test phone field', () async {
      await driver!.tap(fieldFinderPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('8008800');
      await driver!.waitFor(find.text('8008800'));
    });

    test('Test submit', () async {
      await driver!.tap(fieldFinderSubmit);
    });

    test('Success text', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver!.getText(success), 'Добро пожаловать');
    });

  });

  group('Rigister form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final fieldFinderFirstName = find.byValueKey('fieldFirstName');
    final fieldFinderLastName = find.byValueKey('fieldLastName');
    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final fieldFinderSubmit = find.byValueKey('button2');
    final fieldFinderLoginOrRegister = find.byValueKey('fieldLoginOrRegister');

    test('Test Login or Register', () async {
      await driver!.tap(fieldFinderLoginOrRegister);
    });

    test('Test first name field', () async {
      await driver!.tap(fieldFinderFirstName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Ivan');
      await driver!.waitFor(find.text('Ivan'));
    });

    test('Test last name field', () async {
      await driver!.tap(fieldFinderLastName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Ivanov');
      await driver!.waitFor(find.text('Ivanov'));
    });

    test('Test phone field', () async {
      await driver!.tap(fieldFinderPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('8008800');
      await driver!.waitFor(find.text('8008800'));
    });

    test('Test email field', () async {
      await driver!.tap(fieldFinderEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('test@test.com');
      await driver!.waitFor(find.text('test@test.com'));
    });

    test('Test submit', () async {
      await driver!.tap(fieldFinderSubmit);
    });

    test('Success text', () async {
      final success = find.text('Вы успешно зарегистрировались');
      expect(await driver!.getText(success), 'Вы успешно зарегистрировались');
    });

  });
}
