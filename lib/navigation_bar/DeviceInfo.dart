import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class DeviceInfo {
  static final _device = DeviceInfoPlugin();
  static Future<Map<String, dynamic>> getInfo() async {
    if (Platform.isAndroid) {
      final info = await _device.androidInfo;
      return _readAndroidBuildData(info);
    } else {
      throw UnimplementedError();
    }
  }
  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo info) =>
      <String, dynamic>{
        'host': info.host,
        'id': info.id,
        'product': info.product,
        'Device': info.device,
        'Model': info.model,
        'Brand': info.brand,
        'Broad': info.board,
        'Manufacturer':info.manufacturer,
        'Hardware': info.hardware,
        'Android Version':info.version,
        'Manufacturer': info.manufacturer,
        // 'System Features': info.systemFeatures,
        // 'version.securityPatch': info.version.securityPatch,
        // 'version.release': info.version.release,
        // 'version.previewSdkInt': info.version.previewSdkInt,
        // 'version.incremental': info.version.incremental,
        // 'version.codename': info.version.codename,
        // 'version.baseOS': info.version.baseOS,
        // 'board': info.board,
        // 'bootloader': info.bootloader,
        // 'display': info.display,
        // 'fingerprint': info.fingerprint,
        // 'supported32BitAbis': info.supported32BitAbis,
        // 'supported64BitAbis': info.supported64BitAbis,
        // 'supportedAbis': info.supportedAbis,
        'tags': info.tags,
        'type': info.type,
        'androidId': info.androidId,

      };
}
