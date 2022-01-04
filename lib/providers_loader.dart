import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_entity.dart';
import 'package:clean_framework_example/features/counter/domain/counter_usecase.dart';
import 'package:clean_framework_example/features/counter/external_interfaces/counter_external_interface.dart';
import 'package:clean_framework_example/features/counter/external_interfaces/counter_retrieve_count_gateway.dart';
import 'package:clean_framework_example/features/counter/external_interfaces/counter_save_count_gateway.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final counterUseCaseProvider = UseCaseProvider<CounterEntity, CounterUseCase>(
  (_) => CounterUseCase(),
);

final counterSaveCountGateway =
    GatewayProvider((_) => CounterSaveCountGateway(providersContext, counterUseCaseProvider));
final counterRetrieveCountGateway =
    GatewayProvider((_) => CounterRetrieveCountGateway(providersContext, counterUseCaseProvider));

final counterExternalInterface = ExternalInterfaceProvider((_) => CounterExternalInterface([
      () => counterSaveCountGateway.getGateway(providersContext),
      () => counterRetrieveCountGateway.getGateway(providersContext),
    ]));

void loadProviders() {
  counterUseCaseProvider.getUseCaseFromContext(providersContext);
  counterSaveCountGateway.getGateway(providersContext);
  counterRetrieveCountGateway.getGateway(providersContext);
  counterExternalInterface.getExternalInterface(providersContext);
}
