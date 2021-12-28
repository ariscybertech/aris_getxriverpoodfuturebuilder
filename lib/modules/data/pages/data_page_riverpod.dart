import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_example/modules/data/commands/get_data_command.dart';
import 'package:getx_example/modules/widgets/data_error.dart';
import 'package:getx_example/modules/widgets/data_list.dart';
import 'package:getx_example/modules/widgets/data_loading.dart';

class DataPageRiverpod extends StatelessWidget {
  const DataPageRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data - Riverpod'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final maybeData = watch(GetDataCommand.provider);

          return maybeData.when(
            data: (data) => DataList(data: data),
            loading: () => DataLoading(),
            error: (e, s) => DataError(
              message: e.toString(),
              onRetry: () => context.refresh(GetDataCommand.provider),
            ),
          );
        },
        child: Container(),
      ),
    );
  }
}
