import 'package:flutter/material.dart';

import '../Screens/orders_screen.dart';
import '../Screens/user_products_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.restaurant,
            ),
            title: Text('food menu'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/product-overview');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
            ),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.edit,
            ),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('signout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.popAndPushNamed(context, '/Login-screen');
            },
          ),
        ],
      ),
    );
  }
}
