import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gudanng3/absensi_page.dart';
import 'package:gudanng3/newsevent_page.dart';
import 'package:gudanng3/product_page.dart';
import 'package:gudanng3/reportshiftpage.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 2; // Mengelola indeks item yang dipilih

  /*  void _showPetugasHariIni(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                controller: controller,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Petugas Hari Ini (20 Maret 2024 Shift 1)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildSectionTitle('Bagian Gudang III, Seksi GMG I dan II'),
                  _buildInfoRow('Supervisor', 'Eduardus Adi Prayoga'),
                  _buildInfoRow('Foreman', 'Lendy Tri P.'),
                  _buildInfoRow('Staff Bagian', '1. Riko Andriono\n2. M. Daffa Izzuddin'),
                  _buildInfoRow('Administrasi', '1. Burhan Alib\n2. M. Ferdiansyah\n3. Chasbi Asshidiqi\n4. Najmudin Rajan'),
                  _buildInfoRow('Loket', 'Faisol Yunaedi'),
                  _buildInfoRow('Checker', '1. Dedit Nuryanda\n2. Nur Syahid\n3. Ihza Rizki AF'),
                  _buildInfoRow('Housekeeping', '1. Ulul Isbakhi\n2. M. Ropi\'i\n3. Faizan\n4. Jamil\n5. Nur Hadi Asfiyai\n6. Saiful Anam\n7. Moch. Tohir\n8. Hudi Mulyono'),
                  _buildInfoRow('Cleaning Service', '1. Moch. Shokib\n2. Nanang Fauzi\n3. Nur Qomari'),
                  _buildInfoRow('Sweeper', 'Suwarno'),
                  SizedBox(height: 16),
                  _buildSectionTitle('Jembatan Timbang'),
                  _buildInfoRow('Koordinator JT', 'M. Daffa Izzuddin'),
                  _buildInfoRow('Operator Timbangan III ND', 'Andi Albrianto H'),
                  _buildInfoRow('Timbangan I', 'Choirul Anwar'),
                  _buildInfoRow('Timbangan II', 'Pratama Ridzky M'),
                  _buildInfoRow('Timbangan III', 'Amin Prasetyo'),
                  _buildInfoRow('Timbangan IV', 'Deddy Damhudi'),
                  _buildInfoRow('Timbangan V', 'M. Wasiul Arif'),
                  _buildInfoRow('Cleaning Service', 'Anip Maulana'),
                ],
              ),
            );
          },
        );
      },
    );
  }


Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.teal,
    ),
  );
}

Widget _buildInfoRow(String title, String content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(content),
        )
      ],
    ),
  );
} */

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

  // Daftar halaman yang ditampilkan berdasarkan item yang dipilih
  List<Widget> _pages(BuildContext context) {
    return [
      AbsensiPage(),
      NewsAndEventPage(),
      SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _getTitle(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            // Card untuk Agenda Bagian III
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Agenda Bagian III Hari Ini',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        Text(
                          'Rabu, 20 Maret 2024',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Table(
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(children: [
                          Center(
                              child: Text('Waktu',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                          Center(
                              child: Text('Agenda',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                          Center(
                              child: Text('Personel',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                          Center(
                              child: Text('Tempat',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Text('08:00 - 09:00',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Daily Meeting\nPergudangan',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Aminudin',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Zoom Meetings',
                                  style: TextStyle(fontSize: 10))),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Text('08:00 - 09:00',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Daily Meeting\nPergudangan',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Aminudin',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Zoom Meetings',
                                  style: TextStyle(fontSize: 10))),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Text('08:00 - 09:00',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Daily Meeting\nPergudangan',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Aminudin',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Zoom Meetings',
                                  style: TextStyle(fontSize: 10))),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Text('08:00 - 09:00',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Daily Meeting\nPergudangan',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Aminudin',
                                  style: TextStyle(fontSize: 10))),
                          Center(
                              child: Text('Zoom Meetings',
                                  style: TextStyle(fontSize: 10))),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            /* GestureDetector(
                    onTap: () {
                      _showPetugasHariIni(context);
                    },
                  ), */
            // Card untuk Petugas Hari Ini
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Petugas Hari Ini',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            Text(
                              '20 Maret 2024 (Shift 1)',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Grup D',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Foreman',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Lendy Tri',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Loket',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Faisol Yunaedi',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Checker',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'M. Hidayat Fanani\nM. Ustanul Arifin\nDavid Ardiansyah\nSimon M. K. W',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Card untuk Grafik (Placeholder)
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Utilisasi Kapasitas Gudang Internal Area 3',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 55000,
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 7976, color: Colors.orange),
                                BarChartRodData(
                                    toY: 42024, color: Colors.green),
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 26951, color: Colors.orange),
                                BarChartRodData(
                                    toY: 23049, color: Colors.green),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 4898, color: Colors.orange),
                                BarChartRodData(
                                    toY: 45102, color: Colors.green),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 26648, color: Colors.orange),
                                BarChartRodData(
                                    toY: 23352, color: Colors.green),
                              ],
                            ),
                            BarChartGroupData(
                              x: 4,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 12620, color: Colors.orange),
                                BarChartRodData(
                                    toY: 37380, color: Colors.green),
                              ],
                            ),
                          ],
                          titlesData: FlTitlesData(
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  String text = '';
                                  switch (value.toInt()) {
                                    case 0:
                                      text = 'GBB A';
                                    case 1:
                                      text = 'GBB B';
                                    case 2:
                                      text = 'GBB C';
                                    case 3:
                                      text = 'GMG I';
                                    case 4:
                                      text = 'GMG II';
                                  }
                                  return Text(text);
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Card Gudang Eksternal
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Utilisasi Kapasitas Gudang External Area 3',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 55000,
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 7976, color: Colors.orange),
                                BarChartRodData(
                                    toY: 42024, color: Colors.green),
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 26951, color: Colors.orange),
                                BarChartRodData(
                                    toY: 23049, color: Colors.green),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(toY: 50000, color: Colors.blue),
                                BarChartRodData(
                                    toY: 4898, color: Colors.orange),
                                BarChartRodData(
                                    toY: 45102, color: Colors.green),
                              ],
                            ),
                          ],
                          titlesData: FlTitlesData(
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  String text = '';
                                  switch (value.toInt()) {
                                    case 0:
                                      text = 'KIG Beton';
                                    case 1:
                                      text = 'KIG FB';
                                    case 2:
                                      text = 'KIG Q';
                                  }
                                  return Text(text);
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Card Shipping In/Out
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping In and Shipping Out',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 300,
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 22,
                                interval: 1,
                                getTitlesWidget: (value, meta) {
                                  const style = TextStyle(
                                    color: Color(0xff68737d),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  );
                                  switch (value.toInt()) {
                                    case 0:
                                      return Text('20/03', style: style);
                                    case 1:
                                      return Text('21/03', style: style);
                                    case 2:
                                      return Text('22/03', style: style);
                                    case 3:
                                      return Text('23/03', style: style);
                                    case 4:
                                      return Text('24/03', style: style);
                                    default:
                                      return Container();
                                  }
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                interval: 250,
                                showTitles: false,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(
                                      color: Color(0xff68737d),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  );
                                },
                                reservedSize: 28,
                              ),
                            ),
                          ),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                                color: const Color(0xff68737d), width: 1),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 750),
                                FlSpot(1, 848.9),
                                FlSpot(2, 250),
                                FlSpot(3, 498),
                                FlSpot(4, 320),
                              ],
                              isCurved: true,
                              color: Colors.teal,
                              barWidth: 4,
                              belowBarData: BarAreaData(show: false),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 739.9),
                                FlSpot(1, 575.3),
                                FlSpot(2, 804),
                                FlSpot(3, 570),
                                FlSpot(4, 420),
                              ],
                              isCurved: true,
                              color: Colors.orange,
                              barWidth: 4,
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Indicator(
                            color: Colors.teal, text: 'Shipping In (Ton)'),
                        SizedBox(width: 10),
                        Indicator(
                            color: Colors.orange, text: 'Shipping Out (Ton)')
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Stok Seluruh Produk',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 300,
                      child: PieChart(
                        PieChartData(
                          sections: showingSections(),
                          sectionsSpace: 2,
                          centerSpaceRadius: 40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Indicator(color: Colors.blue, text: 'Phonska Oca'),
                        SizedBox(width: 10),
                        Indicator(color: Colors.red, text: 'NPK'),
                        SizedBox(width: 10),
                        Indicator(color: Colors.green, text: 'UREA'),
                        SizedBox(width: 10),
                        Indicator(color: Colors.yellow, text: 'SP'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ProductPage(),
      ReportShiftPage(),
    ];
  }

  // Fungsi untuk menangani perubahan item yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.person), onPressed: () {}),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages(context),
      ), // Menampilkan halaman berdasarkan item yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'Absensi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.event), label: 'News & Event'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

// Fungsi untuk menampilkan bagian pie chart
List<PieChartSectionData> showingSections() {
  return List.generate(4, (i) {
    const fontSize = 16.0;
    const radius = 100.0;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: Colors.blue,
          value: 40,
          title: 'Phonska Oca',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 1:
        return PieChartSectionData(
          color: Colors.red,
          value: 30,
          title: 'NPK',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 2:
        return PieChartSectionData(
          color: Colors.green,
          value: 20,
          title: 'SP',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 3:
        return PieChartSectionData(
          color: Colors.yellow,
          value: 10,
          title: 'UREA',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      default:
        throw Error();
    }
  });
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  Indicator({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
