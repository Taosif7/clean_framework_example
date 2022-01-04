import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example/features/counter/presentation/counter_ui.dart';
import 'package:clean_framework_example/providers_loader.dart';
import 'package:flutter/material.dart';

void main() {
  // Touch providers
  loadProviders();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProvidersContainer(
      providersContext: providersContext,
      onBuild: (_, __) {},
      child: MaterialApp(
        title: 'Clean Framework Counter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: CounterUI(provider: counterUseCaseProvider),
      ),
    );
  }
}
