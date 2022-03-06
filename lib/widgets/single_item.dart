import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/constants/color_const.dart';
import 'package:food_app/widgets/textwidgets.dart';

class SingleItem extends StatefulWidget {
  SingleItem(
      {Key? key,
      required this.isbool,
      required this.productImage,
      required this.productName,
      required this.productPrice})
      : super(key: key);
  bool isbool = false;
  String productImage;
  String productName;
  int productPrice;

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isbool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          NormalText(text: widget.productName, size: 15),
                          NormalText(
                              text: '${widget.productPrice}\$/50 Gram  ',
                              size: 15),
                        ],
                      ),
                      widget.isbool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                              ),
                              height: 35,
                              child: Row(
                                children: const [
                                  Expanded(
                                      child: NormalText(
                                          text: '50 Gram', size: 14)),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorConst.primary,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const NormalText(text: '50 Gram', size: 14),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isbool == false
                      ? const EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : const EdgeInsets.only(left: 15, right: 15),
                  child: widget.isbool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        )
                      : Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
            ],
          ),
        ),
        widget.isbool == false
            ? Container()
            : const Divider(
                height: 1,
                thickness: 1,
              )
      ],
    );
  }
}
