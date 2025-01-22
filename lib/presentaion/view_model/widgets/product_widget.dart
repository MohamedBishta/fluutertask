import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../data/model/products_response/ProductsModel.dart';

class ProductWidget extends StatelessWidget {
  ProductsModel productModel;
  ProductWidget({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Container(
        width: 191.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3),width: 2.w)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)
                ),
                child: CachedNetworkImage(imageUrl: productModel.image??"",
                  width: 191.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error,size: 30.sp,),
                ),
              ),
              SvgPicture.asset(AssetsManager.wishListIcon,
                width: 30.w,
                height: 30.h,
              ),
            ],
          ),
            SizedBox(height: 8.h,),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Text("${productModel.title}\n\n "??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
              ),),
            ),
            SizedBox(height: 8.h,),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                Text("EGP ${productModel.price??productModel.price}",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(width: 16.w,),
                Text("${productModel.price != null?productModel.price:""}",
                style: TextStyle(
                decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.lineThrough,
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp),)
              ],),
            ),
            SizedBox(height: 8.h,),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 191.w,
                child: Row(children: [
                  Text("${StringsManager.review} (${productModel.rating?.rate}) ",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                  ),),
                  SvgPicture.asset(AssetsManager.starIcon,
                    width: 15.w,
                    height: 15.h,
                  ),
                  Spacer(),
                  SvgPicture.asset(AssetsManager.plusIcon,
                    width: 30.w,
                    height: 30.h,
                  ),
                ],),
              ),
            )
          ],),
      ),
    );
  }
}
