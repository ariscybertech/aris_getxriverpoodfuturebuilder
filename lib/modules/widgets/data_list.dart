import 'package:flutter/material.dart';

class DataList extends StatelessWidget {
  final List<int> data;

  const DataList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(data[index].toString()),
      ),
    );
  }
}
