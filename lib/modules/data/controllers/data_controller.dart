import 'package:get/get.dart';
import 'package:getx_example/modules/data/commands/get_data_command.dart';

class DataController extends GetxController {
  RxList<int> _data = <int>[].obs;
  RxString _dataError = ''.obs;

  List<int> get data => _data;
  String get dataError => _dataError.value;

  @override
  void onInit() {
    super.onInit();

    getData();
  }

  Future<void> getData() async {
    try {
      _dataError.value = '';
      _data.value = await GetDataCommand()();
    } catch (e) {
      print(e);
      _dataError.value = e.toString();
    }
  }
}
