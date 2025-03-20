import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Stateful widget mixin to handle loading state
mixin MountedMixin<T extends StatefulWidget> on State<T> {
  /// manager your mounted state
  Future<void> safeOperationAsync(AsyncCallback callback) async {
    if (!mounted) return;
    await callback.call();
  }

  /// manager your mounted state without async
  void safeOperation(VoidCallback callback) {
    if (!mounted) return;
    callback.call();
  }
}
