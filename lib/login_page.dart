import 'package:flutter/material.dart';
import 'package:gudanng3/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/logopg.png', height: 50),
                    Image.asset('assets/logogd.png', height: 50),
                  ],
                ),
                SizedBox(height: 50),

                
                // Title
                Text(
                  'MONITORING GUDANG & PENGANTONGAN AREA III',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize:  14, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 50),
                
                Image.asset(
                  'assets/bgdb.jpeg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),

                // Form
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: UnderlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 50),
                
                // Login Button
                SizedBox(
                width: 320,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                  // logic here
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(239, 175, 12, 100),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  ),
                  child: Text('Login',
                  style: TextStyle(color: Colors.white),
                  ),
                  
                  ),
                ),
                SizedBox(height: 50,),
                
                // Footer
                Text(
                  '@2024. Gudang & Pengantongan III. Petrokimia Gresik',
                  style: TextStyle(fontSize: 10 ,fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
      );
  }
}