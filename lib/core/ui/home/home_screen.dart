import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String screenName = 'home';
  static const String path = '/$screenName';

  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGrey02,
        body: Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kSize16),
            child: CustomScrollView(
              anchor: 0.01,
              slivers: [
                SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 170,
                    mainAxisExtent: 310,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return Container(color: kGrey, child: Center(child: Text('Item $index', style: TextStyle(color: kWhite))));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
