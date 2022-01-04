import 'package:clean_framework/clean_framework_providers.dart';

class CounterUIOutput extends Output {
  final int count;

  CounterUIOutput({required this.count});

  @override
  List<Object?> get props => [count];

  @override
  String toString() {
    return 'CounterUIOutput{count: $count}';
  }
}
