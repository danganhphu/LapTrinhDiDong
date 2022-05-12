import 'dart:io';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/enums/charging_status.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_info/model/iso_battery_info.dart';
import 'package:flutter/services.dart';

class BatteryInfo {
  static final _battery = BatteryInfoPlugin();
  static Future<Map<String, dynamic>> getInfo() async {
    try {
      if (Platform.isAndroid) {
        final info = await _battery.androidBatteryInfo;
        return _readAndroidBatteryData(info!);
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      return <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
  }

  static Map<String, dynamic> _readAndroidBatteryData(AndroidBatteryInfo info) =>
      <String, dynamic>{
        'Health':info.health,
        'Level': info.batteryLevel,
        'Battery capacity': info.batteryCapacity,
        'Battery temperature': info.temperature,
        'Voltage':info.voltage,
        'Status':info.pluggedStatus,
        'Technology':info.technology,
      };
}