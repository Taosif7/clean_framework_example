import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_inputs.dart';
import 'package:clean_framework_example/features/counter/presentation/counter_view_model.dart';
import 'package:flutter/material.dart';

import '../domain/counter_ui_output.dart';
import '../domain/counter_usecase.dart';

class CounterPresenter extends Presenter<CounterViewModel, CounterUIOutput, CounterUseCase> {
  CounterPresenter({
    required UseCaseProvider provider,
    required PresenterBuilder<CounterViewModel> builder,
  }) : super(
          provider: provider,
          builder: builder,
        );

  @override
  CounterViewModel createViewModel(CounterUseCase useCase, CounterUIOutput output) {
    return CounterViewModel(
      displayCount: output.count.toString(),
      onIncrement: (count) => _onIncrementCount(useCase, count),
      onDecrement: (count) => _onDecrementCount(useCase, count),
      onReset: () => _onResentCount(useCase),
    );
  }

  _onIncrementCount(UseCase useCase, int count) {
    useCase.setInput(CounterIncreaseCountInput(count: count));
  }

  _onDecrementCount(UseCase useCase, int count) {
    useCase.setInput(CounterDecreaseCountInput(count: count));
  }

  _onResentCount(UseCase useCase) {
    useCase.setInput(CounterRestCountInput());
  }
}
