import 'package:flutter/material.dart';

Widget cartItem({
  required BuildContext context,
  required String image,
  required void Function() delete,
}) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(
      vertical: 15,
    ),
    height: MediaQuery.of(context).size.height * 0.30,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              Icons.shopping_cart,
              color: Colors.green,
              size: 40,
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: delete,
              child: Icon(
                Icons.delete,
                color: Colors.grey,
                size: 40,
              ),
            ),
          ],
        )

      ],
    ),
  );
}

