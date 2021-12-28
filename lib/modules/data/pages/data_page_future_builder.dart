import 'package:flutter/material.dart';
import 'package:getx_example/modules/data/commands/get_data_command.dart';
import 'package:getx_example/modules/widgets/data_error.dart';
import 'package:getx_example/modules/widgets/data_list.dart';
import 'package:getx_example/modules/widgets/data_loading.dart';

class DataPageFutureBuilder extends StatefulWidget {
  const DataPageFutureBuilder({Key? key}) : super(key: key);

  @override
  _DataPageFutureBuilderState createState() => _DataPageFutureBuilderState();
}

class _DataPageFutureBuilderState extends State<DataPageFutureBuilder> {
  late Future<List<int>> _future;

  @override
  void initState() {
    super.initState();

    _future = GetDataCommand()();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data - FutureBuilder'),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
          if (snapshot.hasError) {
            return DataError(
              message: snapshot.error.toString(),
              onRetry: () {},
            );
          }

          if (snapshot.hasData) {
            return DataList(data: snapshot.data!);
          }

          return DataLoading();
        },
      ),
    );
  }
}
