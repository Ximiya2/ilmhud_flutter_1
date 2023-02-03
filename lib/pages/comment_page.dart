import 'package:birinchi/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
   CommentPage({required this.item, Key? key}) : super(key: key);

  ProductModel item;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  var commentCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Image.asset(widget.item.image!),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: widget.item.commentList!.isEmpty?
                Center(
                  child: Text('No Comment'),
                ) : ListView.builder(
                    itemCount: widget.item.commentList!.length,
                    itemBuilder: (context, index){
                      return Row(
                        mainAxisAlignment: index % 2 == 0 ?
                            MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10,
                                  right : index % 2 == 0 ? 0 : 30,
                              left: index % 2 == 0 ? 30 : 0),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: index % 2 == 0? Colors.blue.shade400  : Colors.green.shade400,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                bottomLeft: index % 2 == 0? Radius.circular(10) : Radius.zero,
                                bottomRight: index % 2 == 0? Radius.zero : Radius.circular(10),
                                  )
                            ),
                              child: Text(widget.item.commentList![index], 
                                style: TextStyle(
                                fontSize: 15,
                              ),),
                            ),
                          ),

                        ],
                      );
                    })),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: commentCtr,
                    decoration: InputDecoration(
                      hintText: 'Enter comment'
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    if(commentCtr.text != ''){
                      widget.item.commentList!.add(commentCtr.text.trim());
                      commentCtr.text = '';
                      setState(() { });
                    }
                  },
                    child: Icon(Icons.send, color: Colors.blue,))
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
