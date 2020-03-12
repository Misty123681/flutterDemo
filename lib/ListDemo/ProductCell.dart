


import 'package:flutter/material.dart';
import 'package:flutter_widget1/ListDemo/Product.dart';

class ProductCell extends StatelessWidget {

  final Data product;
  ProductCell(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 1.0,
      child:  Container(

        padding: EdgeInsets.only(left: 8,right: 8,bottom: 8,top: 8),

        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(

                  padding:EdgeInsets.only(bottom: 8) ,
                  width: 90,
                  child: Text('name:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text('${product.id}',),
              ],
            ),
            Row(
              children: <Widget>[
               Container(
                 width: 90,
                 child:  Text('Discription:',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               Expanded(
                 child: Text(
                   '${product.description}',
                 //maxLines: 2,
                 ),

               )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.only(top: 8),
                  width: 90,
                  child:  Text('Id:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text('${product.id}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
