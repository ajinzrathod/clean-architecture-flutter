import 'dart:convert';

import 'package:clean_architecture_1/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets cached [NumberTriviaModel] which was gotten the last time
  /// user had internet connection
  ///
  /// Throws [CacheException] if no cache is present
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const cachedNumberTrivia = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(cachedNumberTrivia);
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    }
    throw CacheException();
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) async {
    sharedPreferences.setString(
        cachedNumberTrivia, json.encode(triviaToCache.toJson()));
  }
}
