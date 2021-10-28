enum PopMenuOptions { viewProfile, setCommission, deactivateVPP }

class PostsMenuModel {
  String? title;
  PopMenuOptions? options;
  bool? showdivider;

  PostsMenuModel({this.title, this.options, this.showdivider});

  static List<PostsMenuModel> postMenu() {
    List<PostsMenuModel> _itemModels = [];
    PostsMenuModel _item = PostsMenuModel(
        title: 'View Profile',
        showdivider: true,
        options: PopMenuOptions.viewProfile);
    _itemModels.add(_item);
    _item = PostsMenuModel(
        title: 'Set Commission',
        options: PopMenuOptions.setCommission,
        showdivider: true);
    _itemModels.add(_item);
    _item = PostsMenuModel(
        title: 'Deactivate VPP',
        options: PopMenuOptions.deactivateVPP,
        showdivider: true);
    _itemModels.add(_item);
    return _itemModels;
  }
}
