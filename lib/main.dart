import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/transaction.dart';
import 'page/transaction_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static const String title = 'Hive Expense App';
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const TransactionPage(),
    );
  }
}
