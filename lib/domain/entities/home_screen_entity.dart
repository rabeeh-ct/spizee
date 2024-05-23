
class HomeScreenEntity {
  final String restaurantId;
  final List<TableMenuList> tableMenuList;

  HomeScreenEntity({
    required this.restaurantId,
    required this.tableMenuList,
  });
}

class TableMenuList {
  final String menuCategory;
  final String menuCategoryId;
  final List<CategoryDish> categoryDishes;

  TableMenuList({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.categoryDishes,
  });
}

class CategoryDish {
  final String dishId;
  final String dishName;
  final String dishImage;
  final String dishDescription;
  final String nexturl;
  final int dishType;
  final double dishCalories;
  final double dishPrice;
  final List<AddonCat> addonCat;
  int cartCount;

  CategoryDish({
    required this.dishId,
    required this.dishName,
    required this.dishImage,
    required this.dishDescription,
    required this.nexturl,
    required this.dishType,
    required this.dishCalories,
    required this.dishPrice,
    required this.addonCat,
    this.cartCount=0,
  });
}

class AddonCat {
  final String addonCategory;

  AddonCat({
    required this.addonCategory,
  });
}
