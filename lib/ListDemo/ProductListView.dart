import 'package:flutter/material.dart';
import 'package:flutter_widget1/ListDemo/Product.dart';
import 'package:flutter_widget1/ListDemo/ProductCell.dart';
import 'package:flutter_widget1/ListDemo/ProductManager.dart';

Widget listView(List<Data> response) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: response.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCell(
            response[index],
          );
        },
      ));
}

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  Future<Product> productInfo;

  @override
  void initState() {
    productInfo = ProductManager.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FutureBuilder<Product>(
              future: productInfo,
              builder: (BuildContext context, snapshot) {
                if ((snapshot.hasData)) {
                  return listView(snapshot.data.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
