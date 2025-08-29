import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MapPlaceholderWidget extends StatelessWidget {
  final Function(dynamic)? onTap;

  const MapPlaceholderWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(null);
        }
      },
      child: Container(
        color: const Color(0xFFE0E0E0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.map_outlined,
                size: 15.w,
                color: Colors.grey[600],
              ),
              SizedBox(height: 2.h),
              Text(
                'Mapa desativado\n(Modo de desenvolvimento)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
