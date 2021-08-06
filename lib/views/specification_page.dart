import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SpecificationPage extends StatefulWidget {
  const SpecificationPage({Key? key}): super(key: key);
  
  @override
  _SpecificationPageState createState() => _SpecificationPageState();
}

class _SpecificationPageState extends State<SpecificationPage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('牌号设置')
      )
    );
  }
}