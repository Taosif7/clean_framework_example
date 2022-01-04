import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_inputs.dart';
import 'package:clean_framework_example/features/counter/domain/counter_outputs.dart';

class CounterRetrieveCountGateway extends Gateway<CounterRetrieveCountOutput, CounterRetrieveCountRequest,
    CounterRetrieveCountResponse, CounterRetrieveCountInput> {
  CounterRetrieveCountGateway(ProvidersContext providersContext, UseCaseProvider useCaseProvider)
      : super(
          context: providersContext,
          provider: useCaseProvider,
        );

  @override
  CounterRetrieveCountRequest buildRequest(CounterRetrieveCountOutput output) {
    return CounterRetrieveCountRequest();
  }

  @override
  FailureInput onFailure(covariant FailureResponse failureResponse) {
    return FailureInput(message: 'Failed to retrieve count');
  }

  @override
  CounterRetrieveCountInput onSuccess(covariant CounterRetrieveCountResponse response) {
    return CounterRetrieveCountInput(count: response.count);
  }
}

class CounterRetrieveCountRequest extends Request {}

class CounterRetrieveCountResponse extends SuccessResponse {
  final int count;

  const CounterRetrieveCountResponse({required this.count});

  @override
  List<Object?> get props => [count];
}
