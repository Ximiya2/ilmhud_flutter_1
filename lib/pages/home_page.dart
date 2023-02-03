import 'package:birinchi/pages/comment_page.dart';
import 'package:birinchi/product_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'datail_page.dart';
import '../items/item_product.dart';
import '../like_attributes.dart';
import 'like_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Center(
            child: Text(
              'Apple Product',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          actions: [],
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return productItem(
                                context: context,
                                isLiked: list[index].isLike,
                                image: list[index].image!,
                                onPrassLike: () {
                                  list[index].isLike = !list[index].isLike;
                                  if (list[index].isLike) {
                                    counter++;
                                    likedList.add(list[index]);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text("Like",),
                                      duration: const Duration(seconds: 1),
                                    ),
                                    );
                                  } else {
                                    counter--;
                                    likedList.remove(list[index]);
                                  }
                                  setState(() {});
                                },
                                onPrassCard: () {
                                  cartList.add(list[index]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                    backgroundColor: Colors.green,
                                      content: Text("Siz bu mahsulotni savatga qo\`shdiz",),
                                    duration: const Duration(seconds: 1),
                                  ),
                                  );
                                  // Fluttertoast.showToast(
                                  //     msg: "Siz bu mahsulotni savatga qo\`shdiz",
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     timeInSecForIosWeb: 1,
                                  //     backgroundColor: Colors.green,
                                  //     textColor: Colors.white,
                                  //     fontSize: 16.0
                                  // );
                                  setState(() {
                                  });
                                },
                                onPrassDetail: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(item: list[index],),
                                        maintainState: false),
                                  );
                                  setState(() {});
                                },
                                delete: (){
                                  list.remove(list[index]);
                                  setState(() {});
                                },
                                comment: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CommentPage(item: list[index],),),
                                  );
                                }
                              );
                            },
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ],
        ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:homew/product_model.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Product> products = [
//     Product('assets/img.png'),
//     Product("assets/img_1.png"),
//     Product("assets/img_2.png"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepOrangeAccent,
//       drawer: Drawer(),
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrangeAccent,
//         title: Center(
//           child: const Text(
//             'Apple Products',
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//         actions: [
//           Container(
//             height: 10,
//             width: 10,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.amberAccent,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height*0.30,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/img_2.png'),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Lifestyle sale',
//                       style: TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                     SizedBox(height: 30,),
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                         onPressed: (){},
//                         child: const Padding(
//                           padding: const EdgeInsets.only(top: 15, bottom: 15, left: 80, right: 80),
//                           child: Text(
//                             'Shop Now', style: TextStyle(color: Colors.black87),
//                           ),
//                         )),
//                   ],
//                 ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
