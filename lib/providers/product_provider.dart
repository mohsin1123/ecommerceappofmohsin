import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> HerbsProductsList = [];
  List<ProductModel> FruitProductsList = [];

  late ProductModel productModel;

  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
        productDes: element.get("productDes"));
    search.add(productModel);
  }

  ///Herbs Products
  fetchHerbsProducts() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("herbsProducts").get();

    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });

    HerbsProductsList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProducts {
    return HerbsProductsList;
  }

//FruitProducts////////////////////
  fetchfruitProducts() async {
    List<ProductModel> newFruitList = [];

    QuerySnapshot value2 =
        await FirebaseFirestore.instance.collection("fruitProducts").get();

    value2.docs.forEach((element) {
      productModels(element);

      newFruitList.add(productModel);
    });

    FruitProductsList = newFruitList;
    notifyListeners();
  }

  List<ProductModel> get getFruitProducts {
    return FruitProductsList;
  }

  ///search////
  List<ProductModel> get getSearchedProducts {
    return search;
  }
}
