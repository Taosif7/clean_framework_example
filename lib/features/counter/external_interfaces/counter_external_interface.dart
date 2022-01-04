import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_example/features/counter/external_interfaces/counter_retrieve_count_gateway.dart';
import 'package:clean_framework_example/features/counter/external_interfaces/counter_save_count_gateway.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterExternalInterface extends ExternalInterface<Request, SuccessResponse> {
  int _count = 0;
  late SharedPreferences sharedPreferences;

  CounterExternalInterface(List<GatewayConnection> gatewayConnections) : super(gatewayConnections);

  @override
  void handleRequest() {
    on<CounterSaveCountRequest>((request, send) async {
      // Do Job here
      _count = request.count;
      (await SharedPreferences.getInstance()).setInt('count', _count);

      send(CounterSaveCountResponse());
    });

    on<CounterRetrieveCountRequest>((request, send) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      if (sp.containsKey('count')) {
        _count = sp.getInt('count') ?? 0;
      }
      // Do Job here
      send(CounterRetrieveCountResponse(count: _count));
    });
  }

  @override
  FailureResponse onError(Object error) {
    return UnknownFailureResponse();
  }
}
