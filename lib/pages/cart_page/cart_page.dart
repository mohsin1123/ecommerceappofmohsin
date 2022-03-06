import 'package:flutter/material.dart';
import 'package:food_app/constants/color_const.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:food_app/widgets/textwidgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: NormalText(
            text: 'Total:',
            size: 25,
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: NormalText(text: '\$170', size: 20),
        ),
        trailing: Container(
          height: 40,
          width: 160,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: ColorConst.primary,
            onPressed: () {},
            child: const NormalText(
              text: 'Checkout',
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        title: const NormalText(
          text: 'Cart',
          size: 20,
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          // SingleItem(
          //   isbool: true,
          // ),
          // SingleItem(
          //   isbool: true,
          // ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
