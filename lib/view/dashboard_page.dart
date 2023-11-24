import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends StatelessWidget {
  Widget buildInfoCard(String title, String info) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              info,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color.fromARGB(255, 2, 55, 64),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Notifikasi Tersedia'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          
        ],
      ),
      backgroundColor: Color.fromARGB(255, 28, 118, 143),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Pembelian'),
              onTap: () {
                Navigator.pushNamed(context, '/pembelian');
              },
            ),
            ListTile(
              leading: Icon(Icons.confirmation_num),
              title: Text('Voucher'),
              onTap: () {
                Navigator.pushNamed(context, '/voucher');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Histori'),
              onTap: () {
                Navigator.pushNamed(context, '/histori');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.pushNamed(context, '/akun');
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child:Padding(
              padding: const EdgeInsets.all(16.0),
              child:Text('Welcome to Dashboard!',
              style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          // Add the search bar here
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 98, 131),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () { 
                    Navigator.pushNamed(context, '/pembelian');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, size: 50),
                      Text('Pembelian'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 217, 95, 247),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/histori');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history, size: 50),
                      Text('Histori'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 141, 76),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/akun');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 50),
                      Text('Profil'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 182, 237),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/voucher');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.confirmation_num, size: 50),
                      Text('Voucher'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}