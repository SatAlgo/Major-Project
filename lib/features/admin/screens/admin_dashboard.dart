import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  // Mock data for reported issues
  final List<Map<String, String>> _reports = [
    {'id': '1', 'issue': 'Pothole', 'location': 'Dighi, Pune', 'status': 'Pending'},
    {'id': '2', 'issue': 'Garbage', 'location': 'Alandi Road', 'status': 'In Progress'},
    {'id': '3', 'issue': 'Streetlight', 'location': 'MIT Campus', 'status': 'Resolved'},
  ];

  void _updateStatus(int index) {
    setState(() {
      if (_reports[index]['status'] == 'Pending') {
        _reports[index]['status'] = 'In Progress';
      } else {
        _reports[index]['status'] = 'Resolved';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Official Dashboard"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'), // Logic to go back to login
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.teal.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard("Total", "${_reports.length}"),
                _buildStatCard("Pending", "${_reports.where((r) => r['status'] == 'Pending').length}"),
                _buildStatCard("Resolved", "${_reports.where((r) => r['status'] == 'Resolved').length}"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _reports.length,
              itemBuilder: (context, index) {
                final report = _reports[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getStatusColor(report['status']!),
                      child: const Icon(Icons.report_problem, color: Colors.white),
                    ),
                    title: Text("${report['issue']} - ${report['id']}"),
                    subtitle: Text("Location: ${report['location']}\nStatus: ${report['status']}"),
                    isThreeLine: true,
                    trailing: ElevatedButton(
                      onPressed: () => _updateStatus(index),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade100),
                      child: const Text("Update"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending': return Colors.orange;
      case 'In Progress': return Colors.blue;
      case 'Resolved': return Colors.green;
      default: return Colors.grey;
    }
  }
}