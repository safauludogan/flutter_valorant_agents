// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_favorite/add_favorite_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  addFavorite,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.addFavorite: (context, request, completer) =>
        AddFavoriteSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
