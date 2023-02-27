import 'package:bloc_trial/screens/recycle_bin.dart';
import 'package:bloc_trial/screens/tabs_screen.dart';
import 'package:bloc_trial/screens/pending_tasks_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
        case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      default:
        return null;
    }
  }
}