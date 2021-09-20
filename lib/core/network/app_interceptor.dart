import 'package:dio/dio.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/dashboard.dart';

/// [Interceptor] extension for setting token header
/// and other required properties for all requests
class AppInterceptor extends Interceptor {
  String authToken;
  AppInterceptor(this.authToken);

  /// sets the auth token and Apptoken
  /// Apptoken is an identify for each app
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (authToken.isNotEmpty) {
      options.headers.addAll({
        "Authorization": "Bearer " + authToken,
      });
    }
    return super.onRequest(options, handler);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) async {

    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      response.statusCode = 200;
    } else if (response.statusCode == 401) {
      // logger.d('onResponseCalled => ${response.statusCode!}');
      // eventBus.fire(UserLoggedInEvent(logUserOut: true, message: response.statusMessage));
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
