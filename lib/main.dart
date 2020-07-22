import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerX/core/services/authentication_service.dart';
import 'package:providerX/locator.dart';
import 'package:providerX/ui/router.dart';

import 'core/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
