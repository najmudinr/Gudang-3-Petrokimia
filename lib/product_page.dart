import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 3;
  late TabController _tabController;
  String? _selectedWarehouse;
  DateTimeRange _selectedDateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 7)),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: _selectedDateRange,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
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
      body: Column(
        children: [
          Text(
            _getTitle(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          TabBar(
            controller: _tabController,
            labelStyle: TextStyle(fontSize: 12.0),
            tabs: [
              Tab(text: 'Shipping In/Out'),
              Tab(text: 'Performa Produk'),
              Tab(text: 'Booked Area'),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              _buildShippingInOutTab(),
              _buildPerformaProdukTab(),
              _buildBookedAreaTab(),
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildShippingInOutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Pilih Gudang',
              border: OutlineInputBorder(),
            ),
            value: _selectedWarehouse,
            onChanged: (String? newValue) {
              setState(() {
                _selectedWarehouse = newValue;
              });
            },
            items: <String>[
              'Gudang Multiguna 1',
              'Gudang Multiguna 2',
              'Gudang KIG Q',
              'Gudang KIG FB',
              'Gudang KIG Beton'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          InkWell(
            onTap: () => _selectDateRange(context),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Pilih Tanggal',
                border: OutlineInputBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${DateFormat('dd-MM-yyyy').format(_selectedDateRange.start)} '
                    '-> ${DateFormat('dd-MM-yyyy').format(_selectedDateRange.end)}',
                  ),
                  Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: Text('Tampilkan', style: TextStyle(color: Colors.white))),
          SizedBox(height: 16.0),
          _buildDataTable(),
        ],
      ),
    );
  }

  Widget _buildPerformaProdukTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Pilih Gudang',
              border: OutlineInputBorder(),
            ),
            value: _selectedWarehouse,
            onChanged: (String? newValue) {
              setState(() {
                _selectedWarehouse = newValue;
              });
            },
            items: <String>[
              'Gudang Multiguna 1',
              'Gudang Multiguna 2',
              'Gudang KIG Q',
              'Gudang KIG FB',
              'Gudang KIG Beton'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          InkWell(
            onTap: () => _selectDateRange(context),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Pilih Tanggal',
                border: OutlineInputBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${DateFormat('dd-MM-yyyy').format(_selectedDateRange.start)} '
                    '-> ${DateFormat('dd-MM-yyyy').format(_selectedDateRange.end)}',
                  ),
                  Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {},
            child: Text(
              'Tampilkan',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16.0),
          _buildDataTablePerform(),
        ],
      ),
    );
  }

  Widget _buildBookedAreaTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildBookedAreaTable(),
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
            WidgetStateColor.resolveWith((states) => Colors.amber),
        columns: [
          DataColumn(label: Text('Produk')),
          DataColumn(label: Text('Stock Awal')),
          DataColumn(label: Text('Produksi')),
          DataColumn(label: Text('Gudang Penyangga')),
          DataColumn(label: Text('Ex Impor')),
          DataColumn(label: Text('Gudang Internal')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('NPK PHONSKA PLUS @25KG')),
            DataCell(Text('6,986.375')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
          ]),
          DataRow(cells: [
            DataCell(Text('NPK 15-10-12 Sub @50KG')),
            DataCell(Text('13,086.700')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
          ]),
          DataRow(cells: [
            DataCell(Text('Urea SUB @50 KG')),
            DataCell(Text('11,208.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
          ]),
          DataRow(cells: [
            DataCell(Text('SP 26 NS @25KG')),
            DataCell(Text('16,370.200')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
          ]),
          DataRow(cells: [
            DataCell(Text('Nitralite NS @25KG')),
            DataCell(Text('1,527.875')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
          ]),
          DataRow(cells: [
            DataCell(Text('UREA PRL NS @5KG')),
            DataCell(Text('602.675')),
            DataCell(Text('37.000')),
            DataCell(Text('37.000')),
            DataCell(Text('37.000')),
            DataCell(Text('37.000')),
          ]),
          DataRow(cells: [
            DataCell(Text('Nitralite NS @25KG')),
            DataCell(Text('64.400')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
          ]),
          DataRow(cells: [
            DataCell(Text('UREA PRL NS @5KG')),
            DataCell(Text('774.450')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
            DataCell(Text('0.000')),
          ]),
        ],
      ),
    );
  }

  Widget _buildDataTablePerform() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
            WidgetStateColor.resolveWith((states) => Colors.amber),
        columns: [
          DataColumn(label: Text('No')),
          DataColumn(label: Text('Produk')),
          DataColumn(label: Text('Rusak')),
          DataColumn(label: Text('Stok Akhir')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('NPK 15-10-12 SUB @ 50KG')),
            DataCell(Text('0')),
            DataCell(Text('21,003,800')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('NPK 15-10-12 SUB @ 50KG')),
            DataCell(Text('0')),
            DataCell(Text('21,003,800')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('NPK 15-10-12 SUB @ 50KG')),
            DataCell(Text('0')),
            DataCell(Text('21,003,800')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('NPK 15-10-12 SUB @ 50KG')),
            DataCell(Text('0')),
            DataCell(Text('21,003,800')),
          ]),
        ],
      ),
    );
  }

  Widget _buildBookedAreaTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) => Colors.amber),
        columns: [
          DataColumn(label: Text('No')),
          DataColumn(label: Text('Tanggal')),
          DataColumn(label: Text('Tujuan')),
          DataColumn(label: Text('Produk')),
          DataColumn(label: Text('Kuantum')),
          DataColumn(label: Text('Status')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('1 Juli 2024')),
            DataCell(Text('GMG')),
            DataCell(Text('Npk 15-15-15 Sub')),
            DataCell(Text('135 Ton')),
            DataCell(Text('Booked', style: TextStyle(color: Colors.amber))),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('1 Juli 2024')),
            DataCell(Text('GMG')),
            DataCell(Text('Npk 15-15-15 Sub')),
            DataCell(Text('135 Ton')),
            DataCell(Text('Booked', style: TextStyle(color: Colors.amber))),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('1 Juli 2024')),
            DataCell(Text('GMG')),
            DataCell(Text('Npk 15-15-15 Sub')),
            DataCell(Text('135 Ton')),
            DataCell(Text('Booked', style: TextStyle(color: Colors.amber))),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('1 Juli 2024')),
            DataCell(Text('GMG')),
            DataCell(Text('Npk 15-15-15 Sub')),
            DataCell(Text('135 Ton')),
            DataCell(Text('Booked', style: TextStyle(color: Colors.amber))),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('1 Juli 2024')),
            DataCell(Text('GMG')),
            DataCell(Text('Npk 15-15-15 Sub')),
            DataCell(Text('135 Ton')),
            DataCell(Text('Booked', style: TextStyle(color: Colors.amber))),
          ]),
        ],
      ),
    );
  }
}
