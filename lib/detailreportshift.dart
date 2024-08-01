import 'package:flutter/material.dart';
/* import 'package:gudanng3/dashboard_page.dart'; */


class DetailReportShiftPage extends StatefulWidget {
  @override
  State<DetailReportShiftPage> createState() => _DetailReportShiftPageState();
}


class _DetailReportShiftPageState extends State<DetailReportShiftPage> {
/*   int _selectedIndex = 4; // Index tab Report

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Implement navigation logic based on index
      // Example:
      // if (index == 0) {
      //   Navigator.pushReplacementNamed(context, '/absensi');
      // } else if (index == 1) {
      //   Navigator.pushReplacementNamed(context, '/news_event');
      // }
      // Add your navigation logic here
    });
  } */

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Detail Report'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Report Akhir Shift'),
              Tab(text: 'Report Antrian Truk'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildReportAkhirShift(),
            buildReportAntrianTruk(),
          ],
        ),
            /*   bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped
          ), */
      ),
    );
  }

  Widget buildReportAkhirShift() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                    SizedBox(height: 8),
          Text('Berikut kami sampaikan laporan akhir shift 1 pada tanggal 19 Mei 2024'),
          SizedBox(height: 8),
          Row(
            children: [
              Text('Jam mulai - Jam Selesai: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('07:00 - 15:00'),
            ],
          ),
          Row(
            children: [
              Text('Gudang: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Gudang Multi Guna'),
            ],
          ),
          Row(
            children: [
              Text('Kepala Regu: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Rifky Isyarah'),
            ],
          ),
          SizedBox(height: 16),
          Text('Detail Rincian Personel :', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Operator Alat Berat', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('1. Arbain Nawawi'),
                    Text('2. M. Nurul Yakin'),
                    Text('3. Ardiansyah'),
                    Text('4. M. Thfian Hamid'),
                    Text('5. Endik Fradana'),
                    Text('6. Sukur'),
                    Text('7. Achmad Jainuri'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Admin Loket', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Nizar Fanani'),
                    Text('Admin Loket Gudang Multi Guna'),
                    SizedBox(height: 16),
                    Text('Checker', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('1. M.firhad Ali'),
                    Text('2. Sutoyo'),
                    Text('3. Khusnul Arif'),
                    Text('4. Akhmad Faisal Aziz'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Housekeeper', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Lukman Arif Basuki'),
                    SizedBox(height: 16),                   
          Text('Jumlah Buruh: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('16 Orang'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Alat Berat', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('1. 022 - FORKLIFT'),
                    Text('2. 024 - FORKLIFT'),
                    Text('3. 025 - FORKLIFT'),
                    Text('4. 026 - FORKLIFT'),
                    Text('5. 017 - FORKLIFT'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Rekap Pengeluaran :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('Produk', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Stock Awal', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Pemasukan', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Produksi', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Total Pemasukan', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Pengeluaran', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('POSTO', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('SO', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Total Pengeluaran', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Stock Akhir', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Rusak', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Siap Jual', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: const <DataRow>[
                DataRow(cells: [
                  DataCell(Text('NPK PHONSKA PLUS @25KG')),
                  DataCell(Text('6,986.375')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('7.000')),
                  DataCell(Text('7.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('7.000')),
                  DataCell(Text('6,979.375')),
                  DataCell(Text('0.350')),
                  DataCell(Text('6,979.025')),
                ]),
                DataRow(cells: [
                  DataCell(Text('NPK 15-10-12 Sub @50KG')),
                  DataCell(Text('13,086.700')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('227.250')),
                  DataCell(Text('87.300')),
                  DataCell(Text('314.550')),
                  DataCell(Text('12,772.150')),
                  DataCell(Text('3.800')),
                  DataCell(Text('12,768.350')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Urea SUB @50 KG')),
                  DataCell(Text('11,208.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('395.000')),
                  DataCell(Text('42.400')),
                  DataCell(Text('437.400')),
                  DataCell(Text('10,770.600')),
                  DataCell(Text('8.000')),
                  DataCell(Text('10,762.600')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('NPK 15-10-12 Sri @50KG')),
                  DataCell(Text('2,000.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('2,000.000')),
                  DataCell(Text('2.000')),
                  DataCell(Text('1,998.000')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('UREA PRL NS @5KG')),
                  DataCell(Text('602.675')),
                  DataCell(Text('37.000')),
                  DataCell(Text('37.000')),
                  DataCell(Text('37.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('10.000')),
                  DataCell(Text('10.000')),
                  DataCell(Text('629.675')),
                  DataCell(Text('9.800')),
                  DataCell(Text('619.875')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Nitralite NS @25KG')),
                  DataCell(Text('64.400')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('2.000')),
                  DataCell(Text('2.000')),
                  DataCell(Text('62.400')),
                  DataCell(Text('53.400')),
                  DataCell(Text('9.000')),
                  DataCell(Text('')),
                ]),
                DataRow(cells: [
                  DataCell(Text('UREA PRL NS @5KG')),
                  DataCell(Text('774.450')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('0.000')),
                  DataCell(Text('9.000')),
                  DataCell(Text('9.000')),
                  DataCell(Text('765.450')),
                  DataCell(Text('56.450')),
                  DataCell(Text('709.000')),
                  DataCell(Text('')),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReportAntrianTruk() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                            SizedBox(height: 8),
              Text(
                'Berikut kami sampaikan laporan akhir shift 1 pada tanggal 19 Mei 2024\nJam mulai - Jam Selesai       Gudang\n07:00 - 15:00                         Gudang Multi Guna',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 16),
              Text(
                'Antrian Truk Muat Akhir Shift :',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  _buildTableHeaderRow(['Produk', 'Awal', 'Masuk', 'Terlayani', 'Sisa']),
                  _buildTableRow(['NPK KEBOMAS', '2', '0', '2', '0']),
                  _buildTableRow(['Phonska+Zn', '3', '0', '3', '0']),
                  _buildTableRow(['Urea NS 5 KG', '0', '0', '0', '0']),
                  _buildTableRow(['Phonska SUB', '8', '5', '12', '1']),
                  _buildTableRow(['SP 36 @25KG NONSUB', '1', '0', '1', '0']),
                  _buildTableRow(['PHOSGREEN', '0', '0', '0', '0']),
                  _buildTableRow(['NITREA', '2', '0', '2', '0']),
                  _buildTableRow(['UREA SUB', '7', '7', '14', '0']),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Performa Buruh:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                },
                children: [
                  _buildTableHeaderRow(['Performa Buruh Grup C', '']),
                  _buildTableRow(['Target Kehadiran Buruh', '18']),
                  _buildTableRow(['Realisasi Kehadiran Buruh', '11']),
                  _buildTableRow(['Kemampuan Muat', '630']),
                  _buildTableRow(['Realisasi Muat', '800,95']),
                  _buildTableRow(['Persentase', '127,134%']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableHeaderRow(List<String> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.orange,
          child: Text(
            cell,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }

  TableRow _buildTableRow(List<String> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(cell),
        );
      }).toList(),
    );
  }
}
