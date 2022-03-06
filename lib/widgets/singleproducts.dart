import 'package:flutter/material.dart';
import 'package:food_app/constants/color_const.dart';
import 'package:food_app/widgets/count.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleProduct extends StatefulWidget {
  final String? productname;
  final String? productImage;
  final VoidCallback onTap;
  final int? productPrice;
  const SingleProduct(
      {Key? key,
      this.productImage,
      this.productname,
      required this.onTap,
      this.productPrice})
      : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 270,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      child: Image.network(widget.productImage!),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            widget.productname!,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "\$${widget.productPrice}",
                            style: GoogleFonts.poppins(),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorConst.primary),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: const [
                                        Text(
                                          '50gm',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Expanded(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: ColorConst.primary,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Expanded(
                                child: Count(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
