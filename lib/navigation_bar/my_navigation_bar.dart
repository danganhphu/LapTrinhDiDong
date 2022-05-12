import 'package:flutter/material.dart';

import 'BatteryInfo.dart';
import 'DeviceInfo.dart';
import 'my_info_widget.dart';

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({Key? key}) : super(key: key);
  @override
  State<BottomNavigationDemo> createState() => _BottomNavigationDemoState();
}
class _BottomNavigationDemoState extends State<BottomNavigationDemo> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
      ),
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          //index = 0
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_android_rounded, color: Colors.black54,),
              label: "System"
          ),
          //index = 1
          BottomNavigationBarItem(
              icon: Icon(Icons.battery_std_sharp, color: Colors.black54,),
              label: "Battery"
          ),
          //index = 2
          BottomNavigationBarItem(
              icon: Icon(Icons.thermostat_outlined, color: Colors.black54,),
              label: "Thermal"
          ),
        ],

        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
  Widget _buildBody(BuildContext context){
    if(index == 0) {
      return _buildSystemPage();
    }
    if(index == 1) {
      return _buildBatteryPage();
    }
    return _buildThermal();
  }
}

//---------------System
class _buildSystemPage extends StatefulWidget {
  const _buildSystemPage({Key? key}) : super(key: key);

  @override
  State<_buildSystemPage> createState() => _buildSystemPageState();
}
class _buildSystemPageState extends State<_buildSystemPage> {
  Map<String, dynamic> system = {};
  @override
  void initState() {
    super.initState();

    init();
  }
  Future init() async {
    final deviceInfo = await DeviceInfo.getInfo();

    if (!mounted) return;
    setState(() => this.system = deviceInfo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfoWidget(map: system),


    );
  }
}

class _buildThermal extends StatefulWidget {
  const _buildThermal({Key? key}) : super(key: key);

  @override
  _buildThermalState createState() => _buildThermalState();
}

class _buildThermalState extends State<_buildThermal> {
  Map<String, dynamic> system = {};
  @override
  void initState() {
    super.initState();

    init();
  }
  Future init() async {
    final deviceInfo = await DeviceInfo.getInfo();

    if (!mounted) return;
    setState(() => this.system = deviceInfo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InfoWidget(map: system)
    );
  }
}
//-------------Battery
class _buildBatteryPage extends StatefulWidget {
  const _buildBatteryPage({Key? key}) : super(key: key);

  @override
  _buildBatteryPageState createState() => _buildBatteryPageState();
}

class _buildBatteryPageState extends State<_buildBatteryPage> {
  Map<String, dynamic> battery = {};
  @override
  void initState() {
    super.initState();

    init();
  }
  Future init() async {
    final deviceInfo = await BatteryInfo.getInfo();

    if (!mounted) return;
    setState(() => this.battery = deviceInfo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InfoWidget(map: battery)
    );
  }
}
