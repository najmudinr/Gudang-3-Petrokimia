import 'package:flutter/material.dart';

class NewsAndEventPage extends StatefulWidget {
  @override
  State<NewsAndEventPage> createState() => _NewsAndEventPageState();
}

class _NewsAndEventPageState extends State<NewsAndEventPage>
  with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Absensi';
      case 1:
        return 'News & Event';
      case 2:
        return 'Dashboard';
      case 3:
        return 'Produk';
      case 4:
        return 'Report';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(
          _getTitle(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        TabBar(
          controller: _tabController,
          labelStyle: TextStyle(fontSize: 12.0),
          tabs: [
            Tab(text: 'Berita dan Pengumuman'),
            Tab(text: 'Tanya Komunitas'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              NewsTab(),
              EventTab(),
            ],
          ),
        ),
      ]),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        NewsCard(),
        SizedBox(height: 10),
        NewsCard(),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anjung Indrawan',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Housekeeping · Berita dan Pengumuman',
                        style: TextStyle(color: Colors.grey)),
                  ],
                )
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('What is Lorem Ipsum?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 5),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.black),
                    SizedBox(width: 5),
                    Text('5', style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Icon(Icons.comment, color: Colors.black),
                    SizedBox(width: 5),
                    Text('5', style: TextStyle(color: Colors.black)),
                  ],
                ),
                Spacer(),
                Text('9 jam yang lalu', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        EventCard(),
        SizedBox(height: 10),
        EventCard(),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anjung Indrawan',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Housekeeping · Tanya Komunitas',
                        style: TextStyle(color: Colors.grey)),
                  ],
                )
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('What is Lorem Ipsum?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 5),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.black),
                    SizedBox(width: 5),
                    Text('5', style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Icon(Icons.comment, color: Colors.black),
                    SizedBox(width: 5),
                    Text('5', style: TextStyle(color: Colors.black)),
                  ],
                ),
                Spacer(),
                Text('9 jam yang lalu', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
