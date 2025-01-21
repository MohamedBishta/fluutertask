import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../domain/entities/product_entity/ProductEntity.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity productEntity;
  ProductWidget({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: CachedNetworkImage(imageUrl: productEntity.image??"",
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
            child: Text("${productEntity.title}\n\n "??"",
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
              Text("EGP ${productEntity.price??productEntity.price}",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400
              ),),
              SizedBox(width: 16.w,),
              Text("${productEntity.price != null?productEntity.price:""}",
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
                Text("${StringsManager.review} (${productEntity.rating}) ",
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
    );
  }
}
