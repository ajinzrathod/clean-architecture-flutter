import 'dart:convert';
import 'dart:io';
import 'package:clean_architecture_1/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'number_trivia_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  MockClient mockClient = MockClient();
  NumberTriviaRemoteDataSourceImpl dataSource = NumberTriviaRemoteDataSourceImpl(
    client: mockClient
  );

  group('getConcreteNumberTrivia', () {
  final tNumber = 1;

    test(
      '''should perform a GET request on a URL with number 
      being the endpoint and with application/json header''',
      () async {
        // arrange
        // when(mockClient.get(any, headers: anyNamed('headers')))
        // act
        // assert
      },
    );
  });
}
