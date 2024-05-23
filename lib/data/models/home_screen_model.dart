import '../../domain/entities/home_screen_entity.dart';

class HomeScreenModel extends HomeScreenEntity {
  HomeScreenModel({
    required super.restaurantId,
    required super.tableMenuList,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) => HomeScreenModel(
        restaurantId: json["restaurant_id"],
        tableMenuList: List<TableMenuListModel>.from(
            json["table_menu_list"].map((x) => TableMenuListModel.fromJson(x))),
      );
}

class TableMenuListModel extends TableMenuList {
  TableMenuListModel({
    required super.menuCategory,
    required super.menuCategoryId,
    required super.categoryDishes,
  });

  factory TableMenuListModel.fromJson(Map<String, dynamic> json) => TableMenuListModel(
    menuCategory: json["menu_category"],
    menuCategoryId: json["menu_category_id"],
    categoryDishes: List<CategoryDishModel>.from(json["category_dishes"].map((x) => CategoryDishModel.fromJson(x))),
  );
}

class CategoryDishModel extends CategoryDish {
  CategoryDishModel({
    required super.dishId,
    required super.dishName,
    required super.dishImage,
    required super.dishDescription,
    required super.nexturl,
    required super.dishType,
    required super.dishCalories,
    required super.dishPrice,
    required super.addonCat,
  });

  factory CategoryDishModel.fromJson(Map<String, dynamic> json) => CategoryDishModel(
    dishId: json["dish_id"],
    dishName: json["dish_name"],
    dishImage: json["dish_image"],
    dishDescription: json["dish_description"],
    nexturl: json["nexturl"],
    dishType: json["dish_Type"],
    dishCalories: json["dish_calories"],
    dishPrice: json["dish_price"],
    addonCat: List<AddonCatModel>.from(json["addonCat"].map((x) => AddonCatModel.fromJson(x))),
  );
}

class AddonCatModel extends AddonCat {
  AddonCatModel({
    required super.addonCategory,
  });

  factory AddonCatModel.fromJson(Map<String, dynamic> json) => AddonCatModel(
    addonCategory: json["addon_category"],
  );
}
