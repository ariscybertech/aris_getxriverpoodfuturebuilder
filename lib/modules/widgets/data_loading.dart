import 'package:flutter/material.dart';

class DataLoading extends StatelessWidget {
  const DataLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
