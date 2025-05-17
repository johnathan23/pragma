import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux ? 380 : 200,
        mainAxisExtent: kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux ? 472 : 260,
        crossAxisSpacing: kSize16,
        mainAxisSpacing: kSize16,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(12))),
                ),
                const SizedBox(height: 10),
                Container(height: 15, margin: const EdgeInsets.symmetric(horizontal: 8), color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 15, margin: const EdgeInsets.symmetric(horizontal: 8), width: 80, color: Colors.white),
              ],
            ),
          ),
        );
      },
    );
  }
}
