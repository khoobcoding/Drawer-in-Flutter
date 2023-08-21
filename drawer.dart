import 'package:example/Navigation_Screens.dart';
import 'package:flutter/material.dart';

class MyDrawerApp extends StatefulWidget {
  const MyDrawerApp({super.key});

  @override
  State<MyDrawerApp> createState() => _MyDrawerAppState();
}

class _MyDrawerAppState extends State<MyDrawerApp> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  bool isdetails = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700,
        title: const Text(
          'Home',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple.shade600, Colors.purple])),
        ),
      ),
      drawerScrimColor: Colors.purple.shade100.withOpacity(0.5),
      drawer:
          // endDrawer:
          Drawer(
        width: 200,
        backgroundColor: Colors.purple,
        elevation: 20,
        shadowColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text('Khoob Coding'),
                accountEmail: const Text('khoobcoding@gmail.com'),
                currentAccountPicture: Image.asset('assets/logo.png'),
                otherAccountsPictures: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/logo.png',
                      color: Colors.indigo,
                      colorBlendMode: BlendMode.color,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/logo.png',
                      color: Colors.teal,
                      colorBlendMode: BlendMode.color,
                    ),
                  )
                ],
                decoration: BoxDecoration(
                    color: Colors.purple.shade700,
                    image: const DecorationImage(
                        image: AssetImage('assets/img1.png'),
                        fit: BoxFit.cover)),
                onDetailsPressed: () {
                  setState(() {
                    isdetails = !isdetails;
                  });
                },
              ),
              isdetails
                  ? const ListTile(
                      title: Text(
                        'Abcd@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  : const SizedBox(),
              isdetails
                  ? const ListTile(
                      title: Text(
                        'Efgh@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  : const SizedBox(),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: const Text('Home'),
                titleTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Home_Screen();
                    },
                  ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                title: const Text('Search'),
                titleTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Search_Screen();
                    },
                  ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: const Text('About'),
                titleTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const About_Screen();
                    },
                  ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: const Text('Settings'),
                titleTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Settings_Screen();
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.purple),
                fixedSize: const MaterialStatePropertyAll(Size(260, 45)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            child: const Text(
              'Open Drawer',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
