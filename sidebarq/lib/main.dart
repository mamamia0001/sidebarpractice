import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web App Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Menentukan apakah layar lebar atau sempit
            bool isWideScreen = constraints.maxWidth > 800;
            return Row(
              children: [
                // Sidebar hanya tampil jika layar cukup lebar
                if (isWideScreen)
                  Expanded(
                    flex: 1,
                    child: Sidebar(),
                  ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Header(),
                      Expanded(
                        child: Content(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Widget Sidebar
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Sidebar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// Widget Header
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Header',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Icon(Icons.notifications, color: Colors.white),
        ],
      ),
    );
  }
}

// Widget Content
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Content Area',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
