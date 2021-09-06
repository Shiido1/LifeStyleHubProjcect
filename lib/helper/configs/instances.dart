import 'package:lifestyle_hub/helper/configs/pref_manager.dart';
import 'package:lifestyle_hub/network/dio_client.dart';
import 'package:lifestyle_hub/utils/paths.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();
final DioClient apiBaseHelper = DioClient(Paths.baseUrl);
final PrefManager prefManager = PrefManager();
