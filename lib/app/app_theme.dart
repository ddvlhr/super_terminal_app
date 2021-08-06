import 'package:flutter/material.dart';
import 'package:super_terminal_app/app/config_helper.dart';

class AppTheme with ChangeNotifier {
  AppTheme() {
    changeThemeMode(ConfigHelper.getThemeMode());
    changeThemeColor(ConfigHelper.getAppTheme());
  }

  static Map<String, ThemeMode> themeModes = {
    "跟随系统": ThemeMode.system,
    "开启": ThemeMode.dark,
    "关闭": ThemeMode.light
  };

  static Map<String, Color> themeColors = {
    "蓝色": Colors.blue,
    "红色": Colors.red,
    "黄色": Colors.yellow,
    "绿色": Colors.green,
    "粉色": Colors.pink,
    "紫色": Colors.purple,
    "灰色": Colors.blueGrey
  };

  late ThemeMode _themeMode;
  late String _themeModeName;
  get themeMode => _themeMode;
  get themeModeName => _themeModeName;
  void changeThemeMode(int index) {
    _themeMode = AppTheme.themeModes.values.toList()[index];
    _themeModeName = AppTheme.themeModes.keys.toList()[index];
    notifyListeners();
    ConfigHelper.setAppTheme(index);
  }

  void showThemeModeDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('夜间模式'),
            children: _createThemeModeWidget(context),
          );
        });
  }

  List<Widget> _createThemeModeWidget(BuildContext context) {
    List<Widget> widgets = [];
    for (var item in AppTheme.themeModes.keys) {
      widgets.add(RadioListTile(
          value: _themeModeName,
          groupValue: item,
          title: Text(item),
          onChanged: (value) {
            changeThemeMode(AppTheme.themeModes.keys.toList().indexOf(item));
            Navigator.of(context).pop();
          }));
    }
    return widgets;
  }

  late Color _themeColor;
  late String _themeColorName;
  get themeColor => _themeColor;
  get themeColorName => _themeColorName;
  void changeThemeColor(int index) {
    _themeColor = AppTheme.themeColors.values.toList()[index];
    _themeColorName = AppTheme.themeColors.keys.toList()[index];
    notifyListeners();
    ConfigHelper.setAppTheme(index);
  }

  void showThemeDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('切换主题'),
            children: _createThemeWidget(context),
          );
        });
  }

  List<Widget> _createThemeWidget(BuildContext context) {
    List<Widget> widgets = [];
    for (var item in AppTheme.themeColors.keys) {
      widgets.add(RadioListTile(
          value: _themeColorName,
          groupValue: item,
          title:
              Text(item, style: TextStyle(color: AppTheme.themeColors[item])),
          onChanged: (value) {
            changeThemeColor(AppTheme.themeColors.keys.toList().indexOf(item));
            Navigator.of(context).pop();
          }));
    }
    return widgets;
  }
}
