import 'package:flutter/material.dart';
import 'package:fullcourse/pages/city_page.dart';
import 'package:fullcourse/pages/contact_page.dart';
import 'package:fullcourse/pages/timer_names.dart';
import 'package:fullcourse/pages/todo_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  int? get value => state;
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Consumer(builder: (context, ref, child) {
          final count = ref.watch(counterProvider);
          return Text('$count');
        }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: const Text("ADD VALUE")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TodosPage()));
                },
                child: const Text("To do page ->")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CityPage()));
                },
                child: const Text("City page ->")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TimerNames()));
                },
                child: const Text("TimerNames ->")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContactPage()));
                },
                child: const Text("ContactPage ->")),
          ],
        ),
      ),
    );
  }
}
