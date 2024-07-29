import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AbsensiPage extends StatefulWidget {
  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  int _selectedIndex = 0;

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
        body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
              _getTitle(), 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pilih Tanggal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  title: 'Pegawai ',
                  value: '110 Orang',
                  icon: Icons.person,
                  color: Colors.teal,
                  valueFontSize: 10,
                  subtitleFontSize: 8,
                ),
                InfoCard(
                  title: 'Cuti',
                  value: '2 Orang',
                  subtitle: '+50% dari bulan lalu',
                  icon: Icons.luggage,
                  color: Colors.teal,
                  valueFontSize: 10,
                  subtitleFontSize: 8,
                ),
                InfoCard(
                  title: 'Sakit',
                  value: '2 Orang',
                  subtitle: '+10% dari bulan lalu',
                  icon: Icons.medical_services,
                  color: Colors.teal,
                  valueFontSize: 10,
                  subtitleFontSize: 8,
                ),
                InfoCard(
                  title: 'Izin',
                  value: '2 Orang',
                  subtitle: '+10% dari bulan lalu',
                  icon: Icons.book,
                  color: Colors.teal,
                  valueFontSize: 10,
                  subtitleFontSize: 8,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Kehadiran'),
            SizedBox(height: 10),
            LineChartSample1(),
            SizedBox(height: 20),
            Text('Jumlah Lembur'),
            SizedBox(height: 10),
            PieChartSample1(),
          ],
        ),
      ),
         );
  }
}



class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final double valueFontSize;
  final double subtitleFontSize;

  const InfoCard({
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    required this.color,
    this.valueFontSize = 12,
    this.subtitleFontSize = 10
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Container(
        width: 85,
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 10),
            Icon(icon, color: color, size: 20),
            SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 5),
            if (subtitle != null)
              Text(subtitle!, style: TextStyle(fontSize: 8, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class LineChartSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            minX: 22,
            maxX: 25,
            minY: 0,
            maxY: 80,
            lineBarsData: [
              LineChartBarData(
                spots: [FlSpot(22, 60), FlSpot(23, 60), FlSpot(24, 50), FlSpot(25, 70)],
                isCurved: true,
                color: Colors.blue,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
              LineChartBarData(
                spots: [FlSpot(22, 0), FlSpot(23, 0), FlSpot(24, 0), FlSpot(25, 0)],
                isCurved: true,
                color: Colors.red,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
              LineChartBarData(
                spots: [FlSpot(22, 0), FlSpot(23, 0), FlSpot(24, 0), FlSpot(25, 0)],
                isCurved: true,
                color: Colors.yellow,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PieChartSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(color: Colors.blue, value: 18, title: '18', radius: 50),
            PieChartSectionData(color: Colors.orange, value: 14, title: '14', radius: 50),
            PieChartSectionData(color: Colors.yellow, value: 14, title: '14', radius: 50),
            PieChartSectionData(color: Colors.green, value: 14, title: '14', radius: 50),
            PieChartSectionData(color: Colors.red, value: 14, title: '14', radius: 50),
            PieChartSectionData(color: Colors.purple, value: 14, title: '14', radius: 50),
            PieChartSectionData(color: Colors.teal, value: 12, title: '12', radius: 50),
            PieChartSectionData(color: Colors.pink, value: 11, title: '11', radius: 50),
            PieChartSectionData(color: Colors.brown, value: 10, title: '10', radius: 50),
            PieChartSectionData(color: Colors.cyan, value: 6, title: '6', radius: 50),
          ],
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}