import 'package:clean_framework/clean_framework_providers.dart';

class CounterEntity extends Entity {
  final int count;

  CounterEntity({required this.count});

  @override
  List<Object?> get props => [count];

  @override
  String toString() {
    return 'CounterEntity{count: $count}';
  }
}
