import 'package:flutter/material.dart';
import 'package:providerX/core/enums/viewstate.dart';
import 'package:providerX/core/viewmodels/login_model.dart';
import 'package:providerX/ui/shared/app_colors.dart';
import 'package:providerX/ui/widgets/login_header.dart';

import 'base_view.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
                validationMessage: model.errorMessage, controller: _controller),
            model.state == ViewState.Busy
                ? Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: CircularProgressIndicator())
                : FlatButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
