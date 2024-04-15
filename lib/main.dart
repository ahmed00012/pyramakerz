
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pyramakers/splash_screen.dart';

import 'base_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        useInheritedMediaQuery:true,
        child: MaterialApp(
          title: 'pyramakers',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  SplashScreen(),
        ),
      ),
    );
  }
}
