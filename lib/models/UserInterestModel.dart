class UserInterestModel {
  final String thumbnailUrl;
  final String title;

  UserInterestModel({required this.thumbnailUrl, required this.title});
}

List<UserInterestModel> demoList = [
  UserInterestModel(
      thumbnailUrl: 'assets/images/demo/phones.png', title: 'Phones'),
  UserInterestModel(
      thumbnailUrl: 'assets/images/demo/laptops.png', title: 'Laptops'),
  UserInterestModel(
      thumbnailUrl: 'assets/images/demo/smart_watches.png', title: 'Smart Watches'),
  UserInterestModel(
      thumbnailUrl: 'assets/images/demo/headphones.png', title: 'Headphones'),
  UserInterestModel(
      thumbnailUrl: 'assets/images/demo/bagpacks.png', title: 'Bagpacks'),
  UserInterestModel(
      thumbnailUrl: 'assets/images/demo/tablets.png', title: 'Tablets'),
];
