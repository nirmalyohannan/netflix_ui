import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void fetchFromYoutube(
    {final int bufferSize = 1024 * 1024 * 10,
    required final String url,
    ValueChanged<String>? onThumbnailLoaded,
    FutureOr<void> Function(File video)? onVideoAvailable,
    ValueChanged<File>? onVideoBufferFinished,
    VoidCallback? onEachBufferAdded,
    bool skipFetchIfExistsInCache = false}) async {
  final YoutubeExplode yt = YoutubeExplode();
  var video = await yt.videos.get(url); //Get Video Details

  //Setting video Cache File for saving the video Stream
  var cacheDirectory = await getApplicationCacheDirectory();
  String videoFileName = "${video.id}_video.mp4";
  File videoFile = File("${cacheDirectory.path}/$videoFileName");
  bool isVideoFileExists = await videoFile.exists();

  if (skipFetchIfExistsInCache && isVideoFileExists) {
    await onVideoAvailable?.call(videoFile);
    onVideoBufferFinished?.call(videoFile);
    return;
  }
  if (isVideoFileExists == false) {
    await videoFile.create();
  }

  //On Thumbnail Loaded
  onThumbnailLoaded?.call(video.thumbnails.highResUrl);

  var manifest = await yt.videos.streams.getManifest(video.id);
  var streamClient = yt.videos.streams;

  //Get Video Stream
  var videoStream = streamClient.get(manifest.videoOnly.bestQuality);
  var videoStreamConsumer = videoFile.openWrite(); //Stream Consumer
  // var videoStreamObject = videoStream
  //     .pipe(videoStreamConsumer); //Passing Steam Consumer to video Stream

  List<int> buffer = []; //Buffer: Temporary Storage for Stream
  bool isOnAvailableCalled = false;

  videoStream.listen((event) async {
    buffer.addAll(event);
    //if buffer length is greater than buffer size
    if (buffer.length > bufferSize) {
      videoStreamConsumer.add(buffer);
      buffer = []; //Clear Buffer
      if (onVideoAvailable != null && !isOnAvailableCalled) {
        await onVideoAvailable(videoFile);
        isOnAvailableCalled = true;
      }
      onEachBufferAdded?.call();
    }
  }, onDone: () async {
    videoStreamConsumer.add(buffer);
    buffer = [];
    if (onVideoAvailable != null && !isOnAvailableCalled) {
      onVideoAvailable(videoFile);
      isOnAvailableCalled = true;
    }
    onEachBufferAdded?.call();

    await videoStreamConsumer.flush();
    await videoStreamConsumer.close();
    onVideoBufferFinished?.call(videoFile);
  });
}
