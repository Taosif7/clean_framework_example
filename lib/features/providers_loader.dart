import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_entity.dart';
import 'package:clean_framework_example/features/counter/domain/counter_usecase.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final counterUseCaseProvider = UseCaseProvider<CounterEntity, CounterUseCase>(
  (_) => CounterUseCase(),
);

void loadProviders() {
  counterUseCaseProvider.getUseCaseFromContext(providersContext);
}
