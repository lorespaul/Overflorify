import 'package:MyFlutterTest/src/controllers/search_controller.dart';
import 'package:MyFlutterTest/src/controllers/stack_exchange_login_controller.dart';
import 'package:flutter/cupertino.dart';

class ControllerManager extends StatefulWidget {
  ControllerManager({Key key, this.onStateChange}) : super(key: key);

  final Function(bool) onStateChange;

  @override
  _ControllerManager createState() => _ControllerManager(onStateChange);
}

class _ControllerManager extends State<ControllerManager> {
  _ControllerManager(this.onStateChange);

  final Function(bool) onStateChange;

  bool _logged = true;

  @override
  Widget build(BuildContext context) {
    if (_logged) return SearchController();

    return StackExchangeLoginController(
      onLogin: (logged) {
        if (logged) {
          onStateChange(true);
          setState(() => _logged = true);
        }
      },
    );
  }
}
