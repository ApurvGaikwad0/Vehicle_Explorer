import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'provider/vehicle_provider.dart';
import 'pages/make_detail_page.dart';
import 'pages/favorite_make_page.dart';

void main() {
  runApp(const VehiclesApp());
}

class VehiclesApp extends StatelessWidget {
  const VehiclesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VehicleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VehiclesApp',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => const HomePage(),
          MakeDetailPage.routeName: (_) => const MakeDetailPage(),
          FavoriteMakePage.routeName: (_) => const FavoriteMakePage(),
        },
      ),
    );
  }
}
