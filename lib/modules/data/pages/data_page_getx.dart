import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/modules/data/controllers/data_controller.dart';
import 'package:getx_example/modules/widgets/data_error.dart';
import 'package:getx_example/modules/widgets/data_list.dart';
import 'package:getx_example/modules/widgets/data_loading.dart';

class DataPage extends GetView<DataController> {
  const DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data - Getx'),
      ),
      body: Obx(() {
        if (controller.dataError.isNotEmpty) {
          return DataError(
            message: controller.dataError,
            onRetry: controller.getData,
          );
        }

        if (controller.data.isEmpty) {
          return DataLoading();
        }

        return DataList(data: controller.data);
      }),
    );
  }
}
