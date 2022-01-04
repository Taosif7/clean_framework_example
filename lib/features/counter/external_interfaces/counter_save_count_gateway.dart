import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/domain/counter_inputs.dart';
import 'package:clean_framework_example/features/counter/domain/counter_outputs.dart';

class CounterSaveCountGateway
    extends Gateway<CounterSaveCountOutput, CounterSaveCountRequest, CounterSaveCountResponse, CounterSaveCountInput> {
  CounterSaveCountGateway(ProvidersContext providersContext, UseCaseProvider useCaseProvider)
      : super(
          context: providersContext,
          provider: useCaseProvider,
        );

  @override
  CounterSaveCountRequest buildRequest(CounterSaveCountOutput output) {
    return CounterSaveCountRequest(count: output.count);
  }

  @override
  FailureInput onFailure(covariant FailureResponse failureResponse) {
    return FailureInput(message: 'Failed to save count');
  }

  @override
  CounterSaveCountInput onSuccess(covariant CounterSaveCountResponse response) {
    return CounterSaveCountInput();
  }
}

class CounterSaveCountRequest extends Request {
  final int count;

  const CounterSaveCountRequest({required this.count});
}

class CounterSaveCountResponse extends SuccessResponse {
  @override
  List<Object?> get props => [];
}
