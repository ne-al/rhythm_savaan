//! streaming the buffered position of the playing song
import 'package:audio_service/audio_service.dart';
import 'package:rhythm_savaan/app/screens/player/music_player.dart';
import 'package:rhythm_savaan/main.dart';
import 'package:rxdart/rxdart.dart';

Stream<Duration> get _bufferedPositionStream => audioHandler.playbackState
    .map((state) => state.bufferedPosition)
    .distinct();

//! streaming the duration of the playing song
Stream<Duration?> get _durationStream =>
    audioHandler.mediaItem.map((item) => item?.duration).distinct();

//! streaming the position data of all combine things of the playing song
Stream<PositionData> get positionDataStream =>
    Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        AudioService.position,
        _bufferedPositionStream,
        _durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position, bufferedPosition, duration ?? Duration.zero));
