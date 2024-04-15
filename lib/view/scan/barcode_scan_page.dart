import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class BarCodeScan extends StatefulWidget {
  const BarCodeScan({Key? key}) : super(key: key);

  @override
  State<BarCodeScan> createState() => _BarCodeScanState();
}

class _BarCodeScanState extends State<BarCodeScan> {
  String? scanResult;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFDF1E1),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFFDF9A4F),
                      backgroundColor: Colors.black,
                    ),
                    icon: const Icon(CupertinoIcons.barcode_viewfinder),
                    onPressed:
                        scanBarCode, // Call scanBarCode function when button is pressed
                    label: const Text(
                      "Start Scan ",
                      style: TextStyle(
                        color: Color(0xFF965D1A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    scanResult == null
                        ? "Scan Barcode"
                        : "Scan Result : $scanResult",
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> scanBarCode() async {
    String scanResult;
    try {
      // Use the FlutterBarCodeScanner plugin to scan barcodes
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true, // Display flash
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() => this.scanResult = scanResult);
  }
}
