import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:super_terminal_app/app/app_theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}): super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _version = "";
  
  late PackageInfo _packageInfo;
  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((value) => {
      setState(() {
        _packageInfo = value;
        _version = "Ver " + _packageInfo.version;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置")
      ),
      body: ListView(
        children: <Widget>[
          Material(
            color: Theme.of(context).cardColor,
            child: ListTile(
              title: const Text("夜间模式"),
              leading: const Icon(Icons.brightness_4),
              trailing: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  Provider.of<AppTheme>(context).themeModeName,
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ),
              onTap: () => Provider.of<AppTheme>(context, listen: false).showThemeModeDialog(context),
            )
          ),
          Material(
            color: Theme.of(context).cardColor,
            child: ListTile(
              title: const Text("主题切换"),
              leading: const Icon(Icons.color_lens),
              trailing: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  Provider.of<AppTheme>(context).themeColorName,
                  style: TextStyle(
                    color: Provider.of<AppTheme>(context).themeColor,
                    fontSize: 14.0
                  )
                )
              ),
              onTap: () => Provider.of<AppTheme>(context, listen: false).showThemeDialog(context)
            )
          ),
          const SizedBox(
            height: 12
          ),
          Material(
            color: Theme.of(context).cardColor,
            child: const ListTile(
              title: Text("关于"),
              leading: Icon(Icons.info_outline),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            )
          )
        ],
      )
    );
  }
}