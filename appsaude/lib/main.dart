// import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:appsaude/providers/auth.dart';
import 'package:appsaude/providers/consultas.dart';
import 'package:appsaude/providers/users.dart';
import 'package:appsaude/screens/login_screen.dart';
import 'package:appsaude/screens/main_screen.dart';
import 'package:provider/provider.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    final fontLoader = FontLoader('Montserrat');
    fontLoader.addFont(
        rootBundle.load('fonts/Montserrat-Italic-VariableFont_wght.ttf'));
    fontLoader
        .addFont(rootBundle.load('fonts/Montserrat-VariableFont_wght.ttf'));
    fontLoader.load();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Users>(
          create: (ctx) => Users('', '', []),
          update: (ctx, auth, previousLeagueData) => Users(
            auth.token!,
            auth.userId!,
            previousLeagueData == null ? [] : previousLeagueData.users,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Consultas>(
          create: (ctx) => Consultas('', '', []),
          update: (ctx, auth, previousLeagueData) => Consultas(
            auth.token!,
            auth.userId!,
            previousLeagueData == null ? [] : previousLeagueData.consultas,
          ),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, authData, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [routeObserver],
          title: 'App Saude',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Arial'),
          home: authData.isAuth
              ? MainScreen()
              : FutureBuilder(
                  future: authData.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? CircularProgressIndicator()
                          : AuthScreen(),
                ),
        ),
      ),
    );
  }
}
