import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:meals_catalogue/api_service.dart';
import 'package:meals_catalogue/model/meal.dart';

class MockClient extends Mock implements http.Client {}

main() {
  group('getDessert', () {
    test('menampilkan sebuat Meal jika panggil API berhasil', () async {
      final client = MockClient();

      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert'))
          .thenAnswer((_) async => http.Response('{"meals": "Test"}', 200));
      expect(await getDessert(client), isInstanceOf<Meal>());
    });

    test('throws sebuah exception jika terdapat error', () {
      final client = MockClient();

      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert'))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(getDessert(client), throwsException);
    });
  });

  group('getSeafood', () {
    test('menampilkan sebuat Meal jika panggil API berhasil', () async {
      final client = MockClient();

      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'))
          .thenAnswer((_) async => http.Response('{"meals": "Test"}', 200));
      expect(await getSeafood(client), isInstanceOf<Meal>());
    });

    test('throws sebuah exception jika terdapat error', () {
      final client = MockClient();

      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(getSeafood(client), throwsException);
    });
  });

  group('getDetailMeal', () {
    test('menampilkan sebuat Meal jika panggil API berhasil', () async {
      final client = MockClient();

      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/lookup.php?i=52893'))
          .thenAnswer((_) async => http.Response('{"meals": "Test"}', 200));
      expect(await getDetailMeal(client), isInstanceOf<Meal>());
    });

    test('throws sebuah exception jika terdapat error', () {
      final client = MockClient();

      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/lookup.php?i=52893'))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(getDetailMeal(client), throwsException);
    });
  });
}
