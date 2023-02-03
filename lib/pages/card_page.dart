import 'package:birinchi/items/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../like_attributes.dart';

class CardPage extends StatefulWidget {
  const CardPage({ Key? key}) : super(key: key);


  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('You cart'),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: cartList.length,
            itemBuilder: (context,index){
              return cartItem(
                  context: context,
                  delete: () {
                cartList.removeAt(index);
                setState(() {});
              },
               image: cartList[index].image!);
              }),
      ),
    );
  }
}
