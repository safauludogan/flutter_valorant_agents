import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_valorant_agents/app/app.bottomsheets.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/ui/common/app_strings.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

class MockBuildContext extends Mock implements BuildContext {}

late final MockBuildContext _mockContext;

void main() {
  HomeViewModel getModel() => HomeViewModel(
        productNetworkErrorManager:
            ProductNetworkErrorManager(context: _mockContext),
      );

  group('HomeViewmodelTest -', () {
    setUp(() {
      _mockContext = MockBuildContext();
      return registerServices();
    });
    tearDown(() => locator.reset());

    group('incrementCounter -', () {
      test('When called once should return  Counter is: 1', () {
        final model = getModel();
        model.incrementCounter();
        expect(model.counterLabel, 'Counter is: 1');
      });
    });

    group('showBottomSheet -', () {
      test(
        'When called, should show custom bottom sheet using notice variant',
        () {
          final bottomSheetService = getAndRegisterBottomSheetService();

          final model = getModel();
          model.showBottomSheet();
          verify(
            bottomSheetService.showCustomSheet(
              variant: BottomSheetType.notice,
              title: ksHomeBottomSheetTitle,
              description: ksHomeBottomSheetDescription,
            ),
          );
        },
      );
    });
  });
}
