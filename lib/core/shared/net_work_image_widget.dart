import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/class/supabase_connection.dart';
import 'package:se7ety/core/constants/image_app.dart';

class NetWorkImageWidget extends StatelessWidget {
  const NetWorkImageWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
  });

  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width ?? double.infinity,
      errorWidget:
          (context, url, error) => Image.asset(ImageApp.doc, fit: BoxFit.cover),
    );
  }
}

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });
  final String imagePath;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: SupabaseConnection.getImage(imagePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return NetWorkImageWidget(
            image: snapshot.data!,
            height: height ?? 50.0.h,
            width: width ?? 50.0.w,
          );
        }
      },
    );
  }
}
