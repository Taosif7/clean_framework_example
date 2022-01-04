import 'package:clean_framework/clean_framework_providers.dart';

class CounterSaveCountOutput extends Output {
  final int count;

  CounterSaveCountOutput({required this.count});

  @override
  List<Object?> get props => [count];
}

class CounterRetrieveCountOutput extends Output {
  CounterRetrieveCountOutput();

  @override
  List<Object?> get props => [];
}
