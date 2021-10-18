import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import '../../core/network/app_interceptor.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/url_config.dart';
import 'package:logger/logger.dart';

import 'pref_manager.dart';

final Logger logger = Logger();
final DioClient apiBaseHelper = DioClient(UrlConfig.coreBaseUrl, interceptors: [
  AppInterceptor(""),
  LogInterceptor(requestBody: true, logPrint: printDioLogs)
]);
final PrefManager prefManager = PrefManager();
final EventBus eventBus = EventBus();
