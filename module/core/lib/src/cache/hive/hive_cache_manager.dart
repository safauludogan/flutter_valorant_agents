import 'package:core/core.dart';
import 'package:core/src/cache/core/cache_register.dart';
import 'package:core/src/cache/hive/hive_adapter_id.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

/// The HiveCacheManager class is an implementation  of the CacheManager class.
final class HiveCacheManager extends CacheManager {
  /// [path] is the path of the directory
  /// where the Hive database files are stored.
  HiveCacheManager({super.path});

  @override
  Future<void> init() async {
    final documentPath =
        path ?? (await getApplicationDocumentsDirectory()).path;

    await Hive.initFlutter(documentPath);
  }

  @override
  Future<void> remove() async {
    final items = <String>[
      /*Order.empty().toString(),
      OrderDetail.empty().toString(),
      Scan.empty().toString(),
      Barcode.empty().toString(), */
    ];

    try {
      for (final item in items) {
        if (Hive.isBoxOpen(item)) {
          final box = Hive.box<dynamic>(item);
          await box.close();
        }
        await Hive.deleteBoxFromDisk(item);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void register<T extends CacheModel<T>>(T model, HiveAdapterId hiveAdapterId) {
    Hive.registerAdapter<T>(
      CacheRegisterAdapter(model.fromJson, hiveAdapterId),
    );
  }
}
