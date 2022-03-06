import 'package:flutter/material.dart';

class ProductModel {
  String productName;
  String productImage;
  String productDes;
  int productPrice;

  ProductModel(
      {required this.productName,
      required this.productImage,
      required this.productDes,
      required this.productPrice});
}
