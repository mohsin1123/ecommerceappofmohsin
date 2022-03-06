import 'package:flutter/material.dart';
import 'package:food_app/constants/color_const.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/widgets/textwidgets.dart';

enum SigninCharacter { fill, outline }

class ProductOverviewPage extends StatefulWidget {
  final String? productTitle;
  final String? productImage;
  final String productDes;
  final int? productPrice;
  const ProductOverviewPage(
      {Key? key,
      required this.productDes,
      required this.productTitle,
      required this.productImage,
      this.productPrice})
      : super(key: key);

  @override
  _ProductOverviewPageState createState() => _ProductOverviewPageState();
}

SigninCharacter _character = SigninCharacter.fill;
Widget bottomNavigation({
  required Color iconColor,
  required Color backgroundColor,
  required Color color,
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: iconColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: color,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigation(
              onTap: () {},
              iconColor: Colors.white,
              backgroundColor: Colors.black,
              color: Colors.white,
              title: 'Add to wishlist',
              icon: Icons.favorite_border_outlined),
          bottomNavigation(
              onTap: () {},
              iconColor: Colors.black,
              backgroundColor: ColorConst.primary,
              color: Colors.black,
              title: 'Go to Cart',
              icon: Icons.shopping_bag_outlined),
        ],
      ),
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        title: const NormalText(
          text: 'Product Details',
          size: 20,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: NormalText(text: widget.productTitle!, size: 25),
                    subtitle:
                        NormalText(text: "\$${widget.productPrice}", size: 18),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(40),
                    child: Image.network(widget.productImage!),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: const NormalText(
                      text: 'Available Options',
                      size: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.black,
                            ),
                            Radio(
                                value: SigninCharacter.fill,
                                groupValue: _character,
                                activeColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {
                                    _character = value as SigninCharacter;
                                  });
                                })
                          ],
                        ),
                        NormalText(text: "\$${widget.productPrice}", size: 17),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add,
                                color: ColorConst.primary,
                              ),
                              NormalText(
                                text: 'Add',
                                size: 15,
                                color: ColorConst.primary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NormalText(
                    text: 'About this product',
                    size: 20,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NormalText(text: widget.productDes, size: 15)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
