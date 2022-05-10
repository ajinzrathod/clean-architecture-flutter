import 'dart:convert';

import 'package:clean_architecture_1/core/error/exceptions.dart';
import 'package:clean_architecture_1/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_1/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_local_data_source_test.mocks.dart';


@GenerateMocks([SharedPreferences])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  NumberTriviaLocalDataSourceImpl dataSource = NumberTriviaLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences
  );

  MockSharedPreferences mockSharedPreferences2 = MockSharedPreferences();
  NumberTriviaLocalDataSourceImpl dataSource2 = NumberTriviaLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences2
  );

  group('getLastNumberTrivia', () {
    final  tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));
    test(
      'should return numberTriviaModel from SharedPreferences where there is one in cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('trivia_cached.json'));
        // act
        final result = await dataSource.getLastNumberTrivia();
        // assert
        verify(mockSharedPreferences.getString(cachedNumberTrivia));
        expect(result, tNumberTriviaModel);
      },
    );

    test(
      'should throw a CacheException where there is no cache',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        final call = dataSource.getLastNumberTrivia;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('cacheNumberTrivia', () {
    final tNumberTriviaModel  = NumberTriviaModel(number: 1, text: 'test trivia');
    test(
      'should call SharedPreferences to cache the data',
          () async {
        // act
        // dataSource2.cacheNumberTrivia(tNumberTriviaModel);
        // assert
        // final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
        // verify(mockSharedPreferences.setString(
        //     cachedNumberTrivia,
        //     expectedJsonString,
        // ));
      },
    );
  });
}
