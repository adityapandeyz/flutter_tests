import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:users_http_example/user_model.dart';
import 'package:users_http_example/user_repository.dart';

// test should always written in isolation not depending on external factors

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group(
    'UserRepositry - ',
    () {
      group(
        'getUser function',
        () {
          test(
            'given UserRepository class when when getUser function is called and status code is 200 then usermodel should be returned',
            () async {
              // Arrange
              when(
                () => mockHTTPClient.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
                ),
              ).thenAnswer((invocation) async {
                return Response("""
                    {
              "id": "1",
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
                    }  
                """, 200);
              });
              // Act
              final user = await userRepository.getUser();
              // Assert
              expect(user, isA<User>());
            },
          );

          test(
            'given UserRepository class when getUser function is called and status code is not 200 then an exception should be thrown',
            () async {
              // arrange
              when(
                () => mockHTTPClient.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
                ),
              ).thenAnswer((invocation) async {
                return Response("{}", 500);
              });
              // act
              final user = userRepository.getUser();
              // assert
              expect(user, throwsException);
            },
          );
        },
      );
    },
  );
}
