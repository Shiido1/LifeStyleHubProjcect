class TabsData {
  final String? text;
  final int? id;
  final bool? isSelected;

  TabsData({
    this.text,
    this.id,
    this.isSelected,
  });

  static List<TabsData> tabsList() {
    List<TabsData> _data = [];
    TabsData _d = TabsData(text: 'Matrix tree view', id: 0, isSelected: false);
    _data.add(_d);
    _d = TabsData(text: 'My downline', id: 1, isSelected: false);
    _data.add(_d);
    _d = TabsData(text: 'Generation downline', id: 2, isSelected: false);
    _data.add(_d);
    _d = TabsData(text: 'My Lead-wise downline', id: 3, isSelected: false);
    _data.add(_d);
    _d = TabsData(text: 'My VPP Team', id: 4, isSelected: false);
    _data.add(_d);
    return _data;
  }
}
