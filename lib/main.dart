import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhythm_savaan/app/screens/pages/home.dart';
import 'package:rhythm_savaan/core/services/audio_service.dart';
import 'package:rhythm_savaan/core/services/isar_services.dart';

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
  IsarServices();
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ).copyWith(background: Colors.black),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
