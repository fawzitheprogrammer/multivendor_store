import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multivendor_store/core/constants.dart';
import 'package:multivendor_store/core/firebase/collections.dart';
import 'package:multivendor_store/core/firebase/logged_user.dart';
import 'package:multivendor_store/core/firebase_package_helper.dart';
import 'package:multivendor_store/features/store-profile/data/models/product_model.dart';

class GetProductsFromFirebase {
  static Future<List<Product>> getAllProduct(String? searchTerm) async {
    // The list to hold all categories
    List<Product> allProduct = [];

    /// Getting data from the firebase
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore
        .collection(FirebaseCollection.stores)
        .doc(firebaseUser!.uid)
        .collection(FirebaseCollection.storeProductCollection)
        .get();

    for (var element in querySnapshot.docs) {
      print(element.get('tags'));
    }

    // Looping through all categories
    for (var category in querySnapshot.docs) {
      // Decoding fetched json categories into a model
      Product categoryObject = Product.fromJson(category.data());

      if (searchTerm != null) {
        // Checking if the searchTerm is contained in the categoryName
        if (categoryObject.productName![sharedPreferences!.getString('lang')!]
            .toString()
            .toLowerCase()
            .contains(searchTerm)) {
          // Adding categories into allProduct list
          allProduct.add(categoryObject);
        }
      } else {
        allProduct.add(categoryObject);
      }
    }

    // Returning the complete list of product after the loop
    return allProduct;
  }
}
