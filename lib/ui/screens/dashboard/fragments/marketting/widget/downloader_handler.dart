import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadHandler {
  // isolates
  static ReceivePort _port = ReceivePort();

  static initializeDownload() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await Permission.storage.request();
    await FlutterDownloader.initialize(debug: true);
    setUpIsolates();
  }

  /// handle download isolates
  static setUpIsolates() async {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  /// register callbacks
  static void _downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
    logger.d(progress);
  }

  /// perform download operation
  static void downloadFile(BuildContext context, Uri? url) async {
    String path = url!.path;
    String fileName = path.substring(path.lastIndexOf('/') + 1);

    final status = await Permission.storage.request();

    if (status.isGranted) {
      await FlutterDownloader.enqueue(
        url: url.toString(),
        fileName: fileName,
        savedDir: (await findLocalPath())!.path,
        showNotification: true,
        openFileFromNotification: true,
      );
      showsnackBarInfo(context, message: 'Your download has started');
    } else {
      showsnackBarInfo(context,
          message: 'you need to grant this application permission');
    }
  }

  /// opens and already downloaded file or content
  static openFile(DownloadTask downloadTask) {
    try {
      FlutterDownloader.open(taskId: downloadTask.taskId);
    } catch (e) {
      logger.e('can\'t open this file => $e');
    }
  }

  /// returns a list of all downloads been performed by the user
  static Future<List<DownloadTask>?> loadAllUsersDownloads() async {
    return FlutterDownloader.loadTasks();
  }

  /// cancel users download
  static void cancelDownload(DownloadTask downloadTask) {
    FlutterDownloader.cancel(taskId: downloadTask.taskId);
  }

  /// retry users download
  static void retryDownload(DownloadTask downloadTask) {
    FlutterDownloader.retry(taskId: downloadTask.taskId);
  }

  /// delete users download
  static void deleteDownload(DownloadTask downloadTask) {
    FlutterDownloader.remove(taskId: downloadTask.taskId);
  }

  /// resume users download
  static void resumeDownload(DownloadTask downloadTask) {
    FlutterDownloader.resume(taskId: downloadTask.taskId);
  }

  /// pause users download
  static void pauseDownload(DownloadTask downloadTask) {
    FlutterDownloader.pause(taskId: downloadTask.taskId);
  }

  /// cancel all users download
  static void cancelAllDownload() {
    FlutterDownloader.cancelAll();
  }

  /// handle clicks
  static handleClicks(DownloadTask downloadTask) {}
}
