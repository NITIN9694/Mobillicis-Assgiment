import 'package:device_info/device_info.dart';

class DevoceInfoAPi {
  static final _deviceInfpPlugin = DeviceInfoPlugin();
  static Future<String> getPhoneInfo() async {
    final info = await _deviceInfpPlugin.androidInfo;
    return '${info.manufacturer}- ${info.model}';
  }
}
