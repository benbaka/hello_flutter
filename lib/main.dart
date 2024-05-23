import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class HomeRoute extends StatelessWidget{
  const HomeRoute({super.key});

  List<String> getListItems(){
    final List<String> items = List<String>.generate(100, (i) => 'Item $i');
    return items;
  }

  //final
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home "),
      ),
      body:  Center(
        child: ListView.builder(
          itemCount: getListItems().length,
          prototypeItem: ListTile(
            title: Text(getListItems().first),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(getListItems()[index]),
            );
          },
        ),
      )
    );
  }
}

class MetersRoute extends StatelessWidget{
  const MetersRoute({super.key});




  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Meters "),
        ),
        body:  Center(
          child: ListView(
            children: [
              Text("Say"),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TransactionsRoute()),
                );

              }, child: Text("Move"),)
            ],
          )
        )
    );
  }
}

class TransactionsRoute extends StatelessWidget{
  const TransactionsRoute({super.key});
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Transactions "),
        ),
        body: const Center(
          child: Text("List all Transactions"),
        )
    );
  }
}

class WalletsRoute extends StatelessWidget{
  const WalletsRoute({super.key});
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Wallets "),
        ),
        body: const Center(
          child: Text("Listing all Wallets"),
        )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _randomNumber = Random() ;
  int _randomState = 0;

  int routeIndex = 0;



  List<String> fortunes = [
    "You will become rich",
    "No head, no headache",
    "Be your own help",
  ];

  void generateRandomNumber(){
    int randomValue = _randomNumber.nextInt(3);
    setState(() {
      _randomState = randomValue;
    });


  }

  void _incrementCounter() {
    int randomValue = _randomNumber.nextInt(3);
    setState(() {
      _randomState = randomValue;
    });
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
   //generateRandomNumber();
  }

  static const List<Widget> frames = <Widget>[
     HomeRoute(),
     MetersRoute(),
     TransactionsRoute(),
     WalletsRoute(),
  ];

  void changeRoute(int index){
    setState(() {
      routeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.amber,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: frames.elementAt(routeIndex),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: ListView(
          children: const<Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                'Welcome to Flutter',
                style: TextStyle(
                                color: Colors.green,
                                fontSize: 30,
                  ),

                )
            ),
            ListTile(
              title: Text('1')
            ),
            ListTile(
              title: Text("All Mail Inboxes"),
              leading: Icon(Icons.mail),
            ),
            Divider(height: 0.2),
            ListTile(
              title: Text("Primary")
            ),
            ListTile(
                title: Text("Social")
            ),
            ListTile(
                title: Text("Promotions"),
            ),
          ],
        )
      ),
      // persistentFooterButtons: <Widget>[
      //   IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      //   IconButton(onPressed: () {}, icon: Icon(Icons.calculate)),
      //   IconButton(onPressed: () {}, icon: Icon(Icons.bar_chart)),
      //   IconButton(onPressed: () {}, icon: Icon(Icons.wallet)),
      //   IconButton(onPressed: () {}, icon: Icon(Icons.shop)),
      //   IconButton(onPressed: () {}, icon: Icon(Icons.pie_chart)),
      //
      // ],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: routeIndex,
      //fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: Colors.blue,
      onTap: changeRoute,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Meters'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Wallets',
        ),

      ],

    ),
    );
  }
}
