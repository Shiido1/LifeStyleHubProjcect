import 'pref_manager.dart';
import '../../network/dio_client.dart';
import '../../utils/paths.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();
final DioClient apiBaseHelper = DioClient(Paths.baseUrl);
final PrefManager prefManager = PrefManager();
