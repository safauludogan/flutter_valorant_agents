import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddFavoriteSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
