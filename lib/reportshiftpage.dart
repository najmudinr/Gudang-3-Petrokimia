import 'package:flutter/material.dart';
import 'package:gudanng3/detailreportshift.dart';

class ReportShiftPage extends StatefulWidget {
  @override
  State<ReportShiftPage> createState() => _ReportShiftPageState();
}

class _ReportShiftPageState extends State<ReportShiftPage> {
  int entriesPerPage = 10;

  String _getTitle() {
    return 'Report Shift';
  }

  void _navigateToDetailReportPage(BuildContext context) {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => DetailReportShiftPage()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _getTitle(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Show',
                style: TextStyle(fontSize: 12)),
                SizedBox(width: 10),
                DropdownButton<int>(
                  value: entriesPerPage,
                  onChanged: (int? newValue) {
                    setState(() {
                      entriesPerPage = newValue!;
                    });
                  },
                  items: <int>[10, 25, 50, 100]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                SizedBox(width: 10),
                Text('entries',
                style: TextStyle(fontSize: 12)
                ),
                Spacer(),
                Text('Search:' ,
                style: TextStyle(fontSize: 12)),
                SizedBox(width: 10),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Tanggal')),
                    DataColumn(label: Text('Shift')),
                    DataColumn(label: Text('Nama Karu')),
                    DataColumn(label: Text('Nama Gudang')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: List<DataRow>.generate(
                    10,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text('${index + 1}')),
                        DataCell(Text('1 Juli 2024')),
                        DataCell(Text('Shift 1')),
                        DataCell(Text('Rifky Isyarah')),
                        DataCell(Text('Gudang Multiguna 1')),
                        DataCell(IconButton(
                          icon: Icon(Icons.visibility),
                          color: Colors.orange,
                          onPressed: () {
                            _navigateToDetailReportPage(context);
                          },
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Showing 1 to 10 of 121 entries'),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.first_page),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    Text('1'),
                    IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.last_page),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}