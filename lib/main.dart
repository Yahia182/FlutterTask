import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Entry point of the application
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState(); 
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 2; // Default selected index for the bottom navigation bar

 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 211, 218, 222), // AppBar background color

          title: const Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Check in",
                    style: TextStyle(
                      color: Color.fromARGB(255, 140, 166, 179),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "09:00 AM",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ), // Title in the center of the AppBar
          
          actions: const [
            Icon(Icons.search_rounded), 
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image(
                  image: NetworkImage(
                    "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
                  ),
                  fit: BoxFit.contain,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ], // Actions in the right side of the AppBar
          
          iconTheme: IconThemeData(color: Color.fromARGB(255, 137, 150, 193)), // Icon theme color
          toolbarHeight: 70, // Height of the AppBar
        ),
        
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'HR App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ), // Navigation drawer
        
        body: Center(
          child: Container(
            width: 350,
            height: 550,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ), // Container styling
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Attendance Log",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Apr 2024",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ), // Row for attendance log and date
                SizedBox(height: 20), 
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "images/SharedScreenshot.jpg",
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ), // Image with rounded corners
                
                const Text(
                  "NO Records Found!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Message when no records are found
              ],
            ),
          ),
        ), // Main body content
        
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.interests_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist_sharp),
                label: 'Request',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_rounded,
                    size: 40, color: Color.fromARGB(255, 19, 82, 209)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.percent_rounded),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
            ], // Bottom navigation items
            
            currentIndex: _selectedIndex, // Current selected index
            selectedItemColor: Colors.blue, // Selected item color
            unselectedItemColor: Colors.grey, // Unselected item color
            onTap: _onItemTapped, // Tap handler for items
            selectedIconTheme: IconThemeData(color: Colors.blue), // Selected icon theme
            unselectedIconTheme: IconThemeData(color: Colors.grey), // Unselected icon theme
            showUnselectedLabels: true, // Show labels for unselected items
          ),
        ),
        backgroundColor: Color.fromARGB(255, 211, 218, 222), // Scaffold background color
      ),
    );
  }
}
