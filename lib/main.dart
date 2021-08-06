import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_terminal_app/app/config_helper.dart';
import 'package:super_terminal_app/tcp_bloc/tcp_bloc.dart';
import 'package:super_terminal_app/views/machine_setting.dart';
import 'package:super_terminal_app/views/moniter_setting_page.dart';
import 'package:super_terminal_app/views/real_time_info_page.dart';
import 'package:super_terminal_app/views/setting_page.dart';
import 'package:super_terminal_app/views/specification_page.dart';

import 'app/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  ConfigHelper.prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(providers: [
    BlocProvider<TcpBloc>(create: (context) => TcpBloc()),
    ChangeNotifierProvider<AppTheme>(create: (_) => AppTheme(), lazy: false)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Terminal App',
      theme: ThemeData(
        primarySwatch: Provider.of<AppTheme>(context).themeColor,
        appBarTheme: const AppBarTheme(brightness: Brightness.dark),
      ),
      themeMode: Provider.of<AppTheme>(context).themeMode,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Provider.of<AppTheme>(context).themeColor,
          accentColor: Provider.of<AppTheme>(context).themeColor),
      home: const MyHomePage(title: 'Super Terminal Home Page'),
      initialRoute: "/",
      routes: {
        "/Setting": (_) => const SettingPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  List<Widget> pages = [
    const SpecificationPage(),
    const MoniterSettingPage(),
    const RealTimeInfoPage(),
    const MachineSettingPage(),
    const SettingPage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: "牌号设置", icon: Icon(Icons.bookmark)),
            BottomNavigationBarItem(label: "监控设置", icon: Icon(Icons.monitor_rounded)),
            BottomNavigationBarItem(label: "实时信息", icon: Icon(Icons.broken_image_rounded)),
            BottomNavigationBarItem(label: "测试台设置", icon: Icon(Icons.desktop_windows_rounded)),
            BottomNavigationBarItem(label: "设置", icon: Icon(Icons.settings))
          ],
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              child: IndexedStack(children: pages, index: _index),
            )
          ],
        ));
  }
}
