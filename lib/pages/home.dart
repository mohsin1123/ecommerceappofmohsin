import 'package:flutter/material.dart';
import 'package:food_app/constants/color_const.dart';
import 'package:food_app/pages/product_overview.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/search/search_page.dart';
import 'package:food_app/widgets/drawer.dart';
import 'package:food_app/widgets/singleproducts.dart';
import 'package:food_app/widgets/textwidgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;

  Widget _buildherbsProducts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Herbs & Seasoning',
                  style: GoogleFonts.poppins(),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchPage(
                          search: productProvider.getHerbsProducts,
                        ))),
                child: Text(
                  'View all',
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children:
                  productProvider.getHerbsProducts.map((herbsProductData) {
            return SingleProduct(
              productPrice: herbsProductData.productPrice,
              productImage: herbsProductData.productImage,
              productname: herbsProductData.productName,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductOverviewPage(
                    productImage: herbsProductData.productImage,
                    productTitle: herbsProductData.productName,
                    productPrice: herbsProductData.productPrice,
                    productDes: herbsProductData.productDes,
                  ),
                ),
              ),
            );
          }).toList()),
        )
      ],
    );
  }

  Widget _buildFruitProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Fresh Fruits',
                  style: GoogleFonts.poppins(),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchPage(
                          search: productProvider.getFruitProducts,
                        ))),
                child: Text(
                  'View all',
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children:
                  productProvider.getFruitProducts.map((getFruitProducts) {
            return SingleProduct(
              productPrice: getFruitProducts.productPrice,
              productImage: getFruitProducts.productImage,
              productname: getFruitProducts.productName,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductOverviewPage(
                    productImage: getFruitProducts.productImage,
                    productTitle: getFruitProducts.productName,
                    productPrice: getFruitProducts.productPrice,
                    productDes: getFruitProducts.productDes,
                  ),
                ),
              ),
            );
          }).toList()),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProducts();

    productProvider.fetchfruitProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        title: Text(
          'Home',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchPage(
                        search: productProvider.getSearchedProducts,
                      )));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shop))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1579751626657-72bc17010498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80'),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 140),
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: const BoxDecoration(
                                  color: ColorConst.primary,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: const Center(
                                    child: NormalText(
                                  text: 'Food',
                                  size: 13,
                                  weight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Text(
                              '30% OFF',
                              style: GoogleFonts.poppins(
                                fontSize: 40,
                                color: ColorConst.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'On all vegetable products',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
            ),
            _buildherbsProducts(context),
            _buildFruitProducts(),
          ],
        ),
      ),
    );
  }
}
