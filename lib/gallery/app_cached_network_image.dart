import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double radius;
  final String imageUrl;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.loadingWidget,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: FutureBuilder(
        future: _loadImage(imageUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingWidget ?? const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return errorWidget ?? const Icon(Icons.error);
          } else {
            return Image.network(
              imageUrl,
              height: height,
              width: width,
              fit: fit,
            );
          }
        },
      ),
    );
  }

  Future<bool> _loadImage(String url) async {
    try {
      final response = await NetworkAssetBundle(Uri.parse(url)).load(url);
      return response != null;
    } catch (e) {
      return false;
    }
  }
}
