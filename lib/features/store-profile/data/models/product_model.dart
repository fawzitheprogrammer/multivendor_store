class Product {
  final String productId;
  final Map<String, dynamic>? productName;
  final String? productCategory;
  final String? productSubCategory;
  final List<String>? productImages;
  final String productPrice;
  final String productQuantity;
  final Map<String, dynamic>? productShortDescription;
  final String? offerPrice;
  final String? rating;
  final String? brandName;
  final String vendorName;
  final List<String>? tags;
  final List<String>? clothingSize;
  final List<String>? shoeSize;

  Product(
      {required this.productId,
      this.productName,
      required this.productCategory,
      this.productImages,
      required this.productPrice,
      required this.productQuantity,
      this.productShortDescription,
      this.offerPrice,
      this.rating,
      this.brandName,
      required this.vendorName,
      this.tags,
      this.clothingSize,
      this.shoeSize,
      this.productSubCategory});
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productCategory': productCategory,
      'productImages': productImages,
      'productPrice': productPrice,
      'productQuantity': productQuantity,
      'productShortDescription': productShortDescription,
      'offerPrice': offerPrice,
      'rating': rating,
      'brandName': brandName,
      'vendorName': vendorName,
      'tags': tags,
      'clothingSize': clothingSize,
      'shoeSize': shoeSize,
      'productSubCategory': productSubCategory
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] ?? '',
      productName: json['productName'],
      productCategory: json['productCategory'] ?? '',
      productImages: json['productImages'] != null
          ? List<String>.from(json['productImages'])
          : null,
      productPrice: json['productPrice'] ?? '',
      productQuantity: json['productQuantity'] ?? '',
      productShortDescription: json['productShortDescription'],
      offerPrice: json['offerPrice'],
      rating: json['rating'],
      brandName: json['brandName'],
      vendorName: json['vendorName'] ?? '',
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      shoeSize:
          json['shoeSize'] != null ? List<String>.from(json['shoeSize']) : null,
      clothingSize: json['clothingSize'] != null
          ? List<String>.from(json['clothingSize'])
          : null,
      productSubCategory: json['productSubCategory'],
    );
  }
}
