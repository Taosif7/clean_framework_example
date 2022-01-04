import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_entity.dart';
import 'package:clean_framework_example/features/counter/domain/counter_inputs.dart';
import 'package:clean_framework_example/features/counter/domain/counter_ui_output.dart';

class CounterUseCase extends UseCase<CounterEntity> {
  CounterUseCase()
      : super(
          entity: CounterEntity(count: 0),
          outputFilters: {
            CounterUIOutput: (CounterEntity e) {
              return CounterUIOutput(count: e.count);
            },
          },
          inputFilters: {
            CounterIncreaseCountInput: (CounterIncreaseCountInput i, CounterEntity e) {
              return CounterEntity(count: (e.count + i.count));
            },
            CounterDecreaseCountInput: (CounterDecreaseCountInput i, CounterEntity e) {
              return CounterEntity(count: (e.count - i.count));
            },
            CounterRestCountInput: (CounterRestCountInput i, CounterEntity e) {
              return CounterEntity(count: 0);
            }
          },
        );
}
