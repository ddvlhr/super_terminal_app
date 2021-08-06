import 'package:flutter/material.dart';

class RealTimeInfoPage extends StatefulWidget {
  const RealTimeInfoPage({Key? key}): super(key: key);
  @override
  _RealTimeInfoPageState createState() => _RealTimeInfoPageState();
}

class _RealTimeInfoPageState extends State<RealTimeInfoPage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("实时信息"),
      ),
    );
  }
}