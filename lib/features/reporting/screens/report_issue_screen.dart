import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  File? _image;
  Position? _currentPosition;
  bool _isLoading = false;
  final _picker = ImagePicker();

  // Function to get Location and Capture Image
  Future<void> _captureIssue() async {
    setState(() => _isLoading = true);

    try {
      // 1. Check/Request Location Permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      // 2. Get Current GPS Coordinates
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );

      // 3. Capture Image from Camera
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

      if (photo != null) {
        setState(() {
          _image = File(photo.path);
          _currentPosition = position;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report Issue")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _captureIssue,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.file(_image!, fit: BoxFit.cover),
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_enhance, size: 50, color: Colors.teal),
                          Text("Tap to capture geo-tagged photo"),
                        ],
                      ),
              ),
            ),
            if (_currentPosition != null) ...[
              const SizedBox(height: 10),
              Text(
                "Lat: ${_currentPosition!.latitude}, Long: ${_currentPosition!.longitude}",
                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
            if (_isLoading) const CircularProgressIndicator(),
            // ... (Your existing dropdown and description fields)
          ],
        ),
      ),
    );
  }
}