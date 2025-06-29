import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class QrCodeScannerPage extends TbContextWidget {
  QrCodeScannerPage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends TbContextState<QrCodeScannerPage> {
  Timer? simulatedQrTimer;

  @override
  void dispose() {
    if (simulatedQrTimer != null) {
      simulatedQrTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show "not supported" message on web
    if (kIsWeb) {
      return Scaffold(
        appBar: AppBar(title: const Text('QR Code Scanner')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'QR code scanning is not supported on web.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Please use the mobile app for QR code scanning.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    // For mobile/desktop, show a placeholder with simulated QR code
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, size: 100, color: Colors.white),
              SizedBox(height: 24),
              Text(
                'Camera access required for QR scanning',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'QR code scanner package is not available',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
