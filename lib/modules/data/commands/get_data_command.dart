import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetDataCommand {
  static final provider = FutureProvider<List<int>>(
    (ref) => GetDataCommand()(),
  );

  Future<List<int>> call() {
    return Future.delayed(
      Duration(seconds: 2),
      () => Random().nextBool() ? throw Exception('Something went wrong.') : List.generate(10, (i) => i),
    );
  }
}
