import 'package:bottomnavigation/page1.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _page = 0;
  final pages = [Page1(),Page1(),Page1()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        bottomNavigationBar: Container(
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
            child: GNav(
              backgroundColor: Colors.blueAccent,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blue.shade800,
              gap: 8,
              onTabChange: (index){
                setState(() {
                  _page=index;
                });
              },
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(icon: LineAwesomeIcons.border_all,text: 'Dashboard',),
                GButton(icon: LineAwesomeIcons.bar_chart_1,text: 'Stock Management',),
                GButton(icon: LineAwesomeIcons.shopping_cart,text: 'Add / Sell Product',),
              ],
            ),
          ),
        ),
        body: pages[_page],

      ),
    );
  }
}

