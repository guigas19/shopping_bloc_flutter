import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_comp/blocs/cart.bloc.dart';
import 'package:shopping_comp/blocs/homo.bloc.dart';
import 'package:shopping_comp/blocs/theme.bloc.dart';
import 'package:shopping_comp/blocs/user.bloc.dart';
import 'package:shopping_comp/ui/android/pages/tabs.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(value: HomeBloc()),
        ChangeNotifierProvider<CartBloc>.value(value: CartBloc()),
        ChangeNotifierProvider<UserBloc>.value(value: UserBloc()),
        ChangeNotifierProvider<ThemeBloc>.value(value: ThemeBloc()),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: bloc.theme,
      // home: TabsPage(),
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}

