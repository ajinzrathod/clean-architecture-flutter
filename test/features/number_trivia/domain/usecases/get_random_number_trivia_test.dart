import 'package:clean_architecture_1/core/usecases/usecase.dart';
import 'package:clean_architecture_1/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_1/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_1/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  final tNumberTrivia = NumberTrivia(number: 1, text: 'text');
  MockNumberTriviaRepository mockNumberTriviaRepository = new MockNumberTriviaRepository();
  GetRandomNumberTrivia usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);

  group('all', () {
    test(
      'should get random trivia from the repository',
      () async {
        // arrange
        when(mockNumberTriviaRepository.getRandomNumberTrivia())
            .thenAnswer((_) async => Right(tNumberTrivia));

        // act
        final result = await usecase(NoParams());

        // assert
        expect(result, Right(tNumberTrivia));
        verify(mockNumberTriviaRepository.getRandomNumberTrivia());
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      },
    );
  });
}
