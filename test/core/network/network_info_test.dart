import 'package:clean_architecture_1/core/network/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  MockConnectivity mockConnectivity = MockConnectivity();
  NetworkInfoImpl networkInfoImpl = NetworkInfoImpl(mockConnectivity);

  group('isConnected', () {
    test(
      'should return true when connected with wifi',
      () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.wifi);

        // act
        final result = await networkInfoImpl.isConnected;

        // assert
        verify(mockConnectivity.checkConnectivity());
        verifyNoMoreInteractions(mockConnectivity);
        expect(result, true);
      },
    );
  });
}
