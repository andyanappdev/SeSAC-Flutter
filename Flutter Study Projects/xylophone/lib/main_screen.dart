import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Soundpool pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
  final List<int> _soundIds = []; // sound id들을 담아 두는 list
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initSoundPool();
  }

  Future<void> initSoundPool() async {
    int soundId =
        await rootBundle.load('sounds/do1.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);

    soundId = await rootBundle.load('sounds/re.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);
    soundId = await rootBundle.load('sounds/mi.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);
    soundId = await rootBundle.load('sounds/fa.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);
    soundId =
        await rootBundle.load('sounds/sol.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);
    soundId = await rootBundle.load('sounds/la.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);
    soundId = await rootBundle.load('sounds/si.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);
    soundId =
        await rootBundle.load('sounds/do2.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    _soundIds.add(soundId);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 가로 모드 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Xylophone'),
      ),
      body: _isLoading // 만약 로딩중이라면 indicator 표시하고 아니면 건반 표시시
          ? const Center(
              child: CircularProgressIndicator(), // loading indicator 생성
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: gunban('도', Colors.red, _soundIds[0]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: gunban('레', Colors.orange, _soundIds[1]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: gunban('미', Colors.indigo, _soundIds[2]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: gunban('파', Colors.yellow, _soundIds[3]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: gunban('솔', Colors.cyan, _soundIds[4]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 56.0),
                  child: gunban('라', Colors.blue, _soundIds[5]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: gunban('시', Colors.green, _soundIds[6]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 72.0),
                  child: gunban('도', Colors.purple, _soundIds[7]),
                ),
              ],
            ),
    );
  }

  Widget gunban(String text, Color color, int soundId) {
    return GestureDetector(
      onTap: () {
        pool.play(soundId);
      },
      child: Container(
          width: 50,
          height: double.infinity,
          color: color,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
