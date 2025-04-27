

import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/banners/banner_repository.dart';
import 'package:grocify/features/shop/models/banner_model.dart';
import 'package:grocify/utils/popups/loaders.dart';

class BannerController extends GetxController{


  final isLoading =false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update page Navigational Dots
  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }



  /// --- Fetch Banners
  Future<void> fetchBanners() async{
    try{
      // show loader while loading categories
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);


    }catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message:  e.toString());
    }finally{
      // Remove Loader
      isLoading.value = false;
    }
  }
}