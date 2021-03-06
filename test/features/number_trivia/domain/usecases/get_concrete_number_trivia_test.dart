import 'package:clean_architecture_1/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_1/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_1/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'text');

  group('all', () {
    test(
      'should get trivia for the number from repository',
      () async {
        MockNumberTriviaRepository mockNumberTriviaRepository = MockNumberTriviaRepository();
        GetConcreteNumberTrivia usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);

        // arrange
        when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
            .thenAnswer((_) async => Right(tNumberTrivia));

        // act
        final result = await usecase(Params(number: tNumber));

        // assert
        expect(result, Right(tNumberTrivia));
        verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      },
    );
  });
}