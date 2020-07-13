import 'package:barcode_scan/barcode_scan.dart';

class QRcodeService {
  ScanOptions _options =
      ScanOptions(restrictFormat: <BarcodeFormat>[BarcodeFormat.qr]);

  String _scanValue;
  String get scanValue => _scanValue;

  Future<bool> startScan() async {
    try {
      ScanResult result = await BarcodeScanner.scan(options: _options);
      if (result.type == ResultType.Barcode) {
        _scanValue = result.rawContent;
        return true;
      } else {
        _scanValue = null;
        return false;
      }
    } catch (e) {
      return e;
    }
  }
}
