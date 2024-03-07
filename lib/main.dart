import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhythm_savaan/app/components/bottom_navbar/bottom_navbar.dart';
import 'package:rhythm_savaan/core/services/audio_service.dart';

late AudioHandler audioHandler;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.neal.rhythm_savaan.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
  await FlutterDisplayMode.setHighRefreshRate();
  runApp(
    const ProviderScope(
      child: RhythmSaavan(),
    ),
  );
}

class RhythmSaavan extends StatelessWidget {
  const RhythmSaavan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rhythm Saavan',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: 'Syne',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ).copyWith(
          background: Colors.black87,
        ),
        useMaterial3: true,
      ),
      theme: ThemeData(
        fontFamily: 'Syne',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
          brightness: Brightness.light,
        ).copyWith(
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const BottomNavBar(),
    );
  }
}
