import 'package:flutter/material.dart';

class MachineSettingPage extends StatefulWidget {
  const MachineSettingPage({ Key? key}): super(key: key);
  @override
  _MachineSettingPageState createState() => _MachineSettingPageState();
}

class _MachineSettingPageState extends State<MachineSettingPage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试台设置"),
      ),
    );
  }
}