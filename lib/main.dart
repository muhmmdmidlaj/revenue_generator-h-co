import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revenue_generator/controller/bottomnavprovider.dart';
import 'package:revenue_generator/view/bottomnav/bottomnavpage.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BottomNavBarProvider(),
          )
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: BottomNavScreen()),
      ),
    );
  }
}
