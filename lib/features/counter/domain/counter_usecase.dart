import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_entity.dart';
import 'package:clean_framework_example/features/counter/domain/counter_inputs.dart';
import 'package:clean_framework_example/features/counter/domain/counter_outputs.dart';
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
            CounterResetCountInput: (CounterResetCountInput i, CounterEntity e) {
              return CounterEntity(count: 0);
            }
          },
        ) {
    onCreate();
  }

  void saveCount() async {
    await request(
      CounterSaveCountOutput(count: entity.count),
      onSuccess: (CounterSaveCountInput i) {
        return entity;
      },
      onFailure: (_) => entity,
    );
  }

  void onCreate() async {
    await request(
      CounterRetrieveCountOutput(),
      onSuccess: (CounterRetrieveCountInput i) {
        return CounterEntity(count: i.count);
      },
      onFailure: (_) => entity,
    );
  }
}
