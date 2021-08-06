import 'package:flutter/material.dart';

class MoniterSettingPage extends StatefulWidget {
  const MoniterSettingPage({Key? key}): super(key: key);

  @override
  _MoniterSettingPageState createState() => _MoniterSettingPageState();
}

class _MoniterSettingPageState extends State<MoniterSettingPage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("监控设置"),
      )
    );
  }
}