// lib/screens/generator_screen.dart
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey _qrKey = GlobalKey();
  bool _hasData = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _shareQrCode() async {
    try {
      final boundary = _qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;

      final bytes = byteData.buffer.asUint8List();

      // Create temporary file
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/qrcode.png').create();
      await file.writeAsBytes(bytes);

      // Share the file
      await Share.shareXFiles([XFile(file.path)], text: 'QR Code for: ${_controller.text}');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text or URL',
                border: OutlineInputBorder(),
                hintText: 'Enter the content for QR code',
              ),
              minLines: 1,
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  _hasData = value.trim().isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 30),
            if (_hasData)
              Column(
                children: [
                  RepaintBoundary(
                    key: _qrKey,
                    child: QrImageView(
                      data: _controller.text,
                      version: QrVersions.auto,
                      size: 220.0,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.share),
                    label: const Text('Share QR Code'),
                    onPressed: _shareQrCode,
                  ),
                ],
              )
            else
              Container(
                height: 220,
                alignment: Alignment.center,
                child: const Text(
                  'Enter some text to generate a QR code',
                  style: TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
