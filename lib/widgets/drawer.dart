import 'package:flutter/material.dart';
import 'package:food_app/constants/color_const.dart';
import 'package:food_app/pages/cart_page/cart_page.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/profile/profile_page.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/widgets/textwidgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  _DrawerContentState createState() => _DrawerContentState();
}

Widget Listtile({
  required IconData icon,
  required String title,
  final VoidCallback? onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(
      icon,
      color: Colors.black54,
    ),
    title: Text(title, style: GoogleFonts.poppins(color: Colors.black54)),
  );
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConst.primary,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 43,
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NormalText(text: 'Welcome Guest', size: 15),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 30,
                      child: OutlineButton(
                        onPressed: () {},
                        child: const NormalText(
                          text: 'Login',
                          size: 12,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Listtile(
              icon: Icons.home_outlined,
              title: 'Home',
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()))),
          Listtile(
              icon: Icons.shopping_bag_outlined,
              title: 'Shop',
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()))),
          Listtile(
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ProfilePage())),
            icon: Icons.person,
            title: 'Profile',
          ),
          Listtile(icon: Icons.notifications, title: 'Notification'),
          Listtile(
              icon: Icons.rate_review_outlined, title: 'Ratings & Reviews'),
          Listtile(icon: Icons.favorite_outline, title: 'Wishlist'),
          Listtile(
              icon: Icons.document_scanner_outlined,
              title: 'Raise a complaint'),
          Listtile(icon: Icons.question_answer_outlined, title: 'Faqs'),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NormalText(
                  text: 'Contact Support',
                  size: 15,
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    NormalText(
                      text: 'Call Us: ',
                      size: 14,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    NormalText(
                      text: '+923322226725',
                      size: 14,
                    ),
                  ],
                ),
                Row(
                  children: const [
                    NormalText(
                      text: 'Mail Us: ',
                      size: 14,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    NormalText(
                      text: 'memonmohsin916@gmail.com',
                      size: 13,
                    ),
                  ],
                ),
                const Divider(),
                const Center(
                  child: NormalText(
                    text: 'V1.0(4)',
                    size: 15,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
