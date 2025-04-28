

import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/categories/cateory_repository.dart';
import 'package:grocify/data/repositories.authentication/product/product_repository.dart';
import 'package:grocify/features/shop/models/category_model.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

      final isLoading =false.obs;
      final _categoryRepository = Get.put(CategoryRepository());
      RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
      RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// --- Load Category data
  Future<void> fetchCategories() async{
    try{
      // show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, Api,etc)
      final categories = await _categoryRepository.getAllCategories();


      // Update the categories list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    }catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message:  e.toString());
    }finally{
      // Remove Loader
   isLoading.value = false;
  }
  }
  ///  --- Load selected category data

  ///  --- get Category or Sub-category Products
    Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    // Fetch limited (4) Products against each subcategory;
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
    }




}