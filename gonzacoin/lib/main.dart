import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gonzacoin/configure.dart';
import 'package:gonzacoin/src/modules/cripto/presenter/pages/cripto_page.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await configure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CriptoPage(),
    );
  }
}

