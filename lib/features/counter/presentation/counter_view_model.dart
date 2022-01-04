import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class CounterViewModel extends ViewModel {
  final String displayCount;
  final ValueChanged<int> onIncrement;
  final ValueChanged<int> onDecrement;
  final Function() onReset;

  CounterViewModel({
    required this.displayCount,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
  });

  @override
  List<Object?> get props => [displayCount];
}
