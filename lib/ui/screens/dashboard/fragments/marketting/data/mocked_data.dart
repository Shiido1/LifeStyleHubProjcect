import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';

class MockedData {
  String? header;
  String? title;
  List<String>? images;
  List<GetResourcesModel>? getResourceModel;

  MockedData({this.header, this.title, this.images, this.getResourceModel});

  static List<MockedData> getMockedData() {
    List<MockedData> _data = [];

    MockedData _mocked = MockedData(
        header: 'Videos',
        title: 'Marketting 101',
        images: [
          'assets/images/marketting_one.png',
          'assets/images/marketting_two.png'
        ]);
    _data.add(_mocked);

    _mocked = MockedData(
        header: 'Social media barners',
        title: 'Marketting 102',
        images: [
          'assets/images/marketting_one.png',
          'assets/images/marketting_two.png'
        ]);
    _data.add(_mocked);
    return _data;
  }
}
