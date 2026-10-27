
import 'dart:async';

import 'package:flutter/material.dart';

class StreamToListenable extends ChangeNotifier {
  final List<StreamSubscription<dynamic>> subscriptions = [];

  StreamToListenable(List<Stream<dynamic>> streams) {
    for (final stream in streams) {
      final subscription = stream.asBroadcastStream().listen(_tt);
      subscriptions.add(subscription);
    }
  }

  @override
  void dispose() {
    for (final subscription in subscriptions) {
      subscription.cancel();
    }

    super.dispose();
  }

  void _tt(dynamic event) {
    notifyListeners();
  }
}
