import 'dart:typed_data';
import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'game/game_page.dart';

///
/// Created by
/// voter lin
/// on 21/11/21
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  runApp(
    const MaterialApp(
      home: Menu(),
    ),
  );
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Image? logo;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  loadImage() async {
    try {
      final image = await Flame.images.load('logo/logo.png');
      final imageByte = await image.toByteData(format: ImageByteFormat.png);
      logo = Image.memory(Uint8List.view(imageByte!.buffer));
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050319),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (logo != null) logo! else const SizedBox(),
            const SizedBox(height: 10),
            const Text(
              'metaverse',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GamePage()),
                  );
                },
                child: const Text('Start Game'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Center(
          child: Text(
            'MXC Foundation',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
