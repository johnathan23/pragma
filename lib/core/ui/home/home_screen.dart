import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_decorations.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/extension/color_extension.dart';
import 'package:pragma_exam/core/ui/home/provider/home_provider.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pragma_exam/share/helpers/image_helper.dart';
import 'package:pragma_exam/share/widgets/appbars/search_appbar/custom_search_appbar.dart';
import 'package:pragma_exam/share/widgets/images/custom_cache_network_image.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String screenName = 'home';
  static const String path = '/$screenName';

  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController _controllerSearch;
  bool isSearching = false;
  Timer? _debounce;

  @override
  void initState() {
    _controllerSearch = TextEditingController();
    Future.microtask(() {
      ref.read(homeProvider.notifier).getPortfolio(limit: 10, page: 1);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerSearch.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(homeProvider.notifier).searchCat(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cats = ref.watch(homeProvider).catList;
    return SafeArea(
      child: Scaffold(
        appBar:
            kIsWeb
                ? null
                : CustomSearchAppbar(
                  title: Text('Catbreeds', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: kBlack)),
                  bgColor: kGrey03,
                  onPressedSearch: () {},
                ),
        backgroundColor: kGrey02,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kSize16),
          child: CustomScrollView(
            anchor: 0.01,
            slivers: [
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 260,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: cats?.length,
                itemBuilder: (context, index) {
                  return _cardCat(cats?[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCat(CatEntity? catEntity, {EdgeInsetsGeometry? padding, bool isFavorite = false}) {
    return Card(
      shape: AppDecorations.cardRounded,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: AppDecorations.radiusVertical(top: kSize20),
                child: CustomCacheNetworkImage(
                  imageUrl: ImageHelper.getImageUrl(catEntity?.referenceImageId ?? ''),
                  fit: BoxFit.fill,
                  width: 180,
                  height: 180,
                ),
              ),
              Positioned(
                right: kSize10,
                top: kSize10,
                child:
                    !isFavorite
                        ? CircleAvatar(
                          backgroundColor: kBlack.withOpacityValue(0.5),
                          child: Icon(Symbols.favorite_rounded, color: kWhite, size: kSize20),
                        )
                        : CircleAvatar(backgroundColor: kGrey02, child: Icon(Symbols.favorite, color: kRed, size: kSize20, fill: 1)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  catEntity?.name ?? '',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: kBlack),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Symbols.location_on, color: kGrey),
                  title: Text(
                    catEntity?.origin ?? '',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(color: kBlack),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
