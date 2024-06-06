import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AppImage extends StatelessWidget {
  final String url;
  final double? height,width;
  final Color? color;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;
  const AppImage(this.url,{super.key,this.height, this.width, this.color,  this.fit=BoxFit.scaleDown,this.borderRadius=BorderRadius.zero});
  @override
  Widget build(BuildContext context) {
    if(url.endsWith('svg')){
      return ClipRRect(
        borderRadius:borderRadius ,
        child: SvgPicture.asset("assets/svg/$url",
          height: height,
          width: width,
          fit: fit,
          color: color,
        ),
      );
    }else if(url.startsWith('http')){
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.network(
          url,
          height: height,
          width: width,
          fit: fit,
          color: color,
        ),
      );
    }else{
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
            "assets/images/$url",
            height: height,
            width: width,
            fit: fit,
            color: color,
          errorBuilder: (context, error, stackTrace) => const AppImage(''),
        ),
      );
      
    }
    
   
  }
}
