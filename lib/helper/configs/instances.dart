import 'package:event_bus/event_bus.dart';
import 'package:lifestyle_hub/core/network/app_config.dart';
import 'package:lifestyle_hub/core/network/network_service.dart';
import 'package:logger/logger.dart';

import 'pref_manager.dart';

final Logger logger = Logger();
final NetworkService apiBaseHelper =
    NetworkService(baseUrl: AppConfig.coreBaseUrl);
final PrefManager prefManager = PrefManager();
final EventBus eventBus = EventBus();
