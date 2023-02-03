import 'package:birinchi/product_model.dart';
import 'package:flutter/material.dart';

import '../like_attributes.dart';

Widget productItem(
    {required BuildContext context,
      required bool isLiked,
      required String image,
      required void Function() onPrassCard,
      required void Function() onPrassLike,
      required void Function() delete,
      required void Function() comment,
      required void Function() onPrassDetail}) {
  return InkWell(
    onTap: onPrassDetail,
    child: Container(
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
              InkWell(
                onTap: onPrassLike,
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: onPrassCard,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                  size: 40,
                ),
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
              SizedBox(height: 10,),
              InkWell(
                onTap: comment,
                child: Icon(
                  Icons.mode_comment_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
            ],
          ),

        ],
      ),
    ),
  );
}


//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Widget productItem(
//     {required BuildContext context,
//       required bool isLiked,
//       required void Function() onPrassLike,
//       required void Function() DoubleLIke}) {
//   return InkWell(
//     onDoubleTap: DoubleLIke,
//     child: Container(
//       padding: EdgeInsets.all(16),
//       margin: EdgeInsets.symmetric(
//         vertical: 15,
//       ),
//       height: MediaQuery.of(context).size.height * 0.30,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage(
//               "assets/applemac.png",
//             ),
//           )),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           InkWell(
//             onTap: onPrassLike,
//             child: Icon(
//               isLiked ? Icons.favorite : Icons.favorite_border,
//               color: isLiked ? Colors.red : Colors.white,
//               size: 40,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }