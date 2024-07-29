import 'package:flutter/material.dart';

class DetailReportShiftPage extends StatefulWidget {
  @override
  State<DetailReportShiftPage> createState() => _DetailReportShiftPageState();
}

class _DetailReportShiftPageState extends State<DetailReportShiftPage> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.png'), // Replace with your avatar image
          ),
        ),
        title: Text(
          'Detail Report',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailReportPage()),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Report Akhir Shift'),
            Tab(text: 'Report Antrian Truk'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildReportAkhirShift(),
          buildReportAntrianTruk(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Absensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'News & Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
        ],
      ),
    );
  }

  Widget buildReportAkhirShift() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Report Akhir Shift',
            style: TextStyle(fontSize: 24, color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Report Antrian Truk',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Text(
            'Berikut kami sampaikan laporan akhir shift 1 pada tanggal 19 Mei 2024',
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jam mulai - Jam Selesai', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('07:00 - 15:00'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gudang', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Gudang Multi Guna'),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Kepala Regu', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Rifky Isyarah'),
          SizedBox(height: 16),
          Text(
            'Detail Rincian Personel :',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          ),
          buildPersonelDetail(),
          SizedBox(height: 16),
          Text(
            'Rekap Pengeluaran :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          buildDataTable(),
        ],
      ),
    );
  }

  Widget buildReportAntrianTruk() {
    return Center(
      child: Text('Report Antrian Truk'),
    );
  }

  Widget buildPersonelDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPersonelSection('Operator Alat Berat', [
          '1. Arbain Nawawi',
          '2. M. Nurul Yakin',
          '3. Ardiansyah',
          '4. M. Thifan Hamid',
          '5. Endik Fradana',
          '6. Sukur',
          '7. Achmad Jainuri',
        ]),
        buildPersonelSection('Admin Loket', [
          'Nizar Fanani',
          'Admin Loket Gudang Multi Guna',
        ]),
        buildPersonelSection('Checker', [
          '1. M.firhad Ali',
          '2. Sutoyo',
          '3. Khusnul Arif',
          '4. Akhmad Faisal Aziz',
        ]),
        buildPersonelSection('Housekeeper', [
          'Lukman Arif Basuki',
        ]),
        buildPersonelSection('Jumlah Buruh', [
          '16 Orang',
        ]),
        buildPersonelSection('Alat Berat', [
          '1. 022 - FORKLIFT',
          '2. 024 - FORKLIFT',
          '3. 025 - FORKLIFT',
          '4. 026 - FORKLIFT',
          '5. 017 - FORKLIFT',
        ]),
      ],
    );
  }

  Widget buildPersonelSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...items.map((item) => Text(item)).toList(),
        SizedBox(height: 8),
      ],
    );
  }

  Widget buildDataTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(
          children: [
            buildTableCell('Produk', isHeader: true),
            buildTableCell('Stock Awal', isHeader: true),
            buildTableCell('Pemasukan', isHeader: true),
            buildTableCell('', isHeader: true), // Placeholder to maintain row length
            buildTableCell('Pengeluaran', isHeader: true),
            buildTableCell('', isHeader: true), // Placeholder to maintain row length
            buildTableCell('Stock Akhir', isHeader: true),
          ],
        ),
        TableRow(
          children: [
            buildTableCell(''),
            buildTableCell(''),
            buildTableCell('Produksi', isHeader: true),
            buildTableCell('Total Pemasukan', isHeader: true),
            buildTableCell('POSTO', isHeader: true),
            buildTableCell('SO', isHeader: true),
            buildTableCell(''),
          ],
        ),
        buildDataRow('NPK PHONSKA PLUS @25KG', '6,986.375', '0.000', '0.000', '0.000', '0.000', '7.000'),
        buildDataRow('NPK 15-10-12 Sub @50KG', '13,086.700', '0.000', '0.000', '0.000', '227.250', '87.300'),
        buildDataRow('Urea SUB @50 KG', '11,208.000', '0.000', '0.000', '0.000', '395.000', '42.400'),
        buildDataRow('SP 26 NS @25KG', '16,370.200', '0.000', '0.000', '0.000', '0.000', '19.000'),
        buildDataRow('Nitralite NS @25KG', '1,527.875', '0.000', '0.000', '0.000', '2.000', '2.000'),
        buildDataRow('UREA PRL NS @5KG', '602.675', '37.000', '37.000', '0.000', '10.000', '10.000'),
        buildDataRow('Nitralite NS @25KG', '64.400', '0.000', '0.000', '0.000', '0.000', '2.000'),
        buildDataRow('UREA PRL NS @5KG', '774.450', '0.000', '0.000', '0.000', '34.000', '5.000'),
      ],
    );
  }

  TableRow buildDataRow(
      String produk, String stockAwal, String pemasukan1, String pemasukan2, String pengeluaran1, String pengeluaran2, String stockAkhir) {
    return TableRow(
      children: [
        buildTableCell(produk),
        buildTableCell(stockAwal),
        buildTableCell(pemasukan1),
        buildTableCell(pemasukan2),
        buildTableCell(pengeluaran1),
        buildTableCell(pengeluaran2),
        buildTableCell(stockAkhir),
      ],
    );
  }

  Widget buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

class DetailReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Report Akhir Shift'),
      ),
      body: Center(
        child: Text('Ini adalah halaman detail report akhir shift'),
      ),
    );
  }
}