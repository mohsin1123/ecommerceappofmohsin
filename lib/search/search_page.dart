import 'package:flutter/material.dart';
import 'package:food_app/constants/color_const.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:food_app/widgets/textwidgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  final List<ProductModel> search;

  const SearchPage({
    Key? key,
    required this.search,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

String query = '';

class _SearchPageState extends State<SearchPage> {
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        title: const NormalText(
          text: 'Search',
          size: 20,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined))
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: NormalText(text: 'Search Items', size: 20),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: 'Search for items in the store.',
                suffixIcon: const Icon(
                  Icons.search_outlined,
                  color: ColorConst.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
              children: _searchItem.map((data) {
            return SingleItem(
                isbool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice);
          }).toList()),
        ],
      ),
    );
  }
}
