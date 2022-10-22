import 'package:project/constants/models_constants.dart';
import 'package:project/utils/bools.dart';

class StoreTabModel {
  final String title;
  final List<String> productsIds;
  final bool allProducts;

  const StoreTabModel({
    required this.productsIds,
    required this.title,
    this.allProducts = false,
  });

  Map<String, dynamic> toJSON() {
    return {
      titleString: title,
      productIdString: productsIds,
      allProductsString: allProducts,
    };
  }

  static StoreTabModel fromJSON(Map<String, dynamic> tabJSON) {
    String title = tabJSON[titleString];

    List<dynamic> productsIds = tabJSON[productIdString];
    bool? allProducts = tabJSON[allProductsString];

    return StoreTabModel(
      productsIds: [...productsIds],
      title: title,
      allProducts: boolifyNull(allProducts),
    );
  }
}
