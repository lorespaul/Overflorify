import 'package:MyFlutterTest/src/http/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackExchangeLoginController extends StatelessWidget {
  StackExchangeLoginController({this.onLogin});

  final Function(bool) onLogin;

  @override
  Widget build(BuildContext context) {
    var client = HttpClient.getClient();

    return Center(
      child: FloatingActionButton(
        onPressed: () async {
          var response =
              await client.get("https://api.stackexchange.com/2.2/answers");
          print(response);
        },
        child: Text("Login"),
      ),
    );
  }

  // https://stackoverflow.com/oauth/dialog?client_id=18524&scope=no_expiry&redirect_uri=https://stackexchange.com/oauth/login_success
  // 59:3:9DD,16:f7d3bc06ab2a99ee,10:1597164423,16:f56ee3d895867c7e,7dfec9c4b4b6deee917d54c113beb262fb23905766fcbaca2fe19ccc22fd16fc
}
