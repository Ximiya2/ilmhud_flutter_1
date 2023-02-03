class ProductModel {
  String? image;
  bool isLike;
  bool isKorzinka;
  List<String>? commentList;

  ProductModel(this.image,  {this.isLike = false, this.isKorzinka = false,this.commentList});
}


