import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),

      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<Orders>(
              builder: (context, orders, child) {
                return ListView.builder(
                  itemCount: orders.ordersCount,
                  itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
                );
              },
            );
          }
        },
      ),
      drawer: AppDrawer(Provider.of<Auth>(context, listen: false).emailUser),
      // body: _isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemCount: orders.ordersCount,
      //         itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
      //       ),
    );
  }
}
