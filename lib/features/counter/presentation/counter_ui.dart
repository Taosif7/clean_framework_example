import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_ui_output.dart';
import 'package:clean_framework_example/features/counter/domain/counter_usecase.dart';
import 'package:clean_framework_example/features/counter/presentation/counter_presenter.dart';
import 'package:clean_framework_example/features/counter/presentation/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CounterUI extends UI<CounterViewModel> {
  final UseCaseProvider provider;

  CounterUI({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context, CounterViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clean Framework Counter"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        viewModel.onDecrement(1);
                      },
                      icon: const Icon(Icons.exposure_minus_1),
                    ),
                    const SizedBox(height: 30),
                    IconButton(
                      onPressed: () {
                        viewModel.onDecrement(2);
                      },
                      icon: const Icon(Icons.exposure_minus_2),
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Text(
                  viewModel.displayCount,
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        viewModel.onIncrement(1);
                      },
                      icon: const Icon(Icons.exposure_plus_1),
                    ),
                    const SizedBox(height: 30),
                    IconButton(
                      onPressed: () {
                        viewModel.onIncrement(2);
                      },
                      icon: const Icon(Icons.exposure_plus_2),
                    ),
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  viewModel.onSave();
                },
                child: const Text("Save"),
              ),
              TextButton(
                onPressed: () {
                  viewModel.onReset();
                },
                child: const Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Presenter<CounterViewModel, CounterUIOutput, CounterUseCase> create(PresenterBuilder<CounterViewModel> builder) {
    return CounterPresenter(provider: provider, builder: builder);
  }
}
