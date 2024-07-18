import 'package:counter_app/counter.dart';
import 'package:flutter_test/flutter_test.dart';

// unit tests should independent of each other

void main() {
  // // Pretest
  // // setup is called before every test
  // // Setup -> test -> setup -> test -> setup -> test
  // setUp(() => null);

  // // setupall is called before all the tests
  // // Setup -> test -> setup -> test -> setup -> test
  // setUpAll(() => null);

  late Counter counter;

  setUp(
    () {
      counter = Counter();
    },
  );

  // Testing
  group(
    'Counter Class -',
    () {
      // given when then
      test(
        'given counter class when it is instantiated then value of count should be 0',
        () {
          // // Arrange
          // final Counter counter = Counter();

          // Act
          final val = counter.count;

          //Assert
          expect(val, 0);
        },
      );

      test(
        'given counter class when it is incremented then the value of counter should be 1',
        () {
          // // Arrange
          // final Counter counter = Counter();
          // Act
          counter.incrementCounter();
          final val = counter.count;
          // Assert
          expect(val, 1);
        },
      );

      test(
        'given counter class when it is decremented then the value of count should be -1',
        () {
          // final Counter counter = Counter();
          counter.decrementCounter();
          final val = counter.count;
          expect(val, -1);
        },
      );

      test(
        'given counter class when it is reset then value of counter should be 0',
        () {
          counter.resetCounter();
          final val = counter.count;
          expect(val, 0);
        },
      );
    },
  );

  // // Post Test
  // tearDown(() => null);
  // //  test -> tearDown -> test -> tearDown

  // tearDownAll(() => null);
  // //  test -> test -> tearDownAll
}
