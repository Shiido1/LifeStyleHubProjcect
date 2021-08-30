class Me {
  String? myName;
  List<MyChildren>? myChildrenList = [];

  Me({required this.myName, required this.myChildrenList});

  static Me getMyDescendants() {
    Me _me = Me(myName: 'Jaycee', myChildrenList: [
      MyChildren(name: 'First', iHaveAYoungerSibling: true, myGrandChildren: [
        MyGrandChildren(name: 'N', isChildAvailable: true),
        MyGrandChildren(name: 'C', isChildAvailable: true),
        MyGrandChildren(name: 'O', isChildAvailable: true),
        MyGrandChildren(name: 'Y', isChildAvailable: true),
      ]),
      MyChildren(name: 'Second', iHaveAYoungerSibling: true, myGrandChildren: [
        MyGrandChildren(name: 'N', isChildAvailable: true),
        MyGrandChildren(name: 'C', isChildAvailable: true),
        MyGrandChildren(name: 'O', isChildAvailable: true),
        MyGrandChildren(name: 'Y', isChildAvailable: true),
      ]),
      MyChildren(name: 'Third', iHaveAYoungerSibling: true, myGrandChildren: [
        MyGrandChildren(name: 'N', isChildAvailable: false),
        MyGrandChildren(name: 'C', isChildAvailable: false),
        MyGrandChildren(name: 'O', isChildAvailable: false),
        MyGrandChildren(name: 'Y', isChildAvailable: false),
      ]),
      MyChildren(name: 'Fourth', iHaveAYoungerSibling: true, myGrandChildren: [
        MyGrandChildren(name: 'N', isChildAvailable: false),
        MyGrandChildren(name: 'C', isChildAvailable: false),
        MyGrandChildren(name: 'O', isChildAvailable: false),
        MyGrandChildren(name: 'Y', isChildAvailable: false),
      ]),
      MyChildren(name: 'Fifth', iHaveAYoungerSibling: false, myGrandChildren: [
        MyGrandChildren(name: 'N', isChildAvailable: true),
        MyGrandChildren(name: 'C', isChildAvailable: true),
        MyGrandChildren(name: 'O', isChildAvailable: true),
        MyGrandChildren(name: 'Y', isChildAvailable: true),
      ]),
    ]);
    return _me;
  }
}

class MyChildren {
  String? name;
  bool? iHaveAYoungerSibling;
  List<MyGrandChildren>? myGrandChildren = [];

  MyChildren(
      {required this.name,
      required this.myGrandChildren,
      required this.iHaveAYoungerSibling});
}

class MyGrandChildren {
  String? name;
  bool? isChildAvailable;

  MyGrandChildren({required this.name, required this.isChildAvailable});
}
