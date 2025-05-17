import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_decorations.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/extension/color_extension.dart';
import 'package:pragma_exam/core/domain/extension/string_extension.dart';
import 'package:pragma_exam/core/ui/detail/detail_screen.dart';
import 'package:pragma_exam/core/ui/home/provider/home_provider.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pragma_exam/share/helpers/image_helper.dart';
import 'package:pragma_exam/share/widgets/appbars/custom_search_appbar.dart';
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
  late final ScrollController _scrollController;
  bool isSearching = false;
  Timer? _debounce;

  @override
  void initState() {
    _controllerSearch = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(() => _onScroll());
    Future.microtask(() {
      ref.read(homeProvider.notifier).getPortfolio(limit: 10, page: 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerSearch.dispose();
    _scrollController.removeListener(() => _onScroll());
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      final homeState = ref.read(homeProvider);
      if (!homeState.isLoadMore && !homeState.isLoading) {
        ref.read(homeProvider.notifier).loadMore(limit: 10, page: homeState.page + 1);
      }
    }
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.isEmpty) {
        ref.read(homeProvider.notifier).getPortfolio(limit: 10, page: 0);
      } else {
        ref.read(homeProvider.notifier).searchCat(value);
      }
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
                  bgColor: kGrey02,
                  onPressedSearch: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                ),
        backgroundColor: kWhite,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kSize16),
          child: Column(
            children: [
              if (isSearching) ...[
                const SizedBox(height: kSize10),
                SearchBar(
                  hintText: 'search cats'.capitalize(),
                  backgroundColor: WidgetStatePropertyAll<Color>(kGrey02),
                  controller: _controllerSearch,
                  onChanged: _onSearchChanged,
                  elevation: WidgetStatePropertyAll<double>(kSize1),
                ),
                const SizedBox(height: kSize10),
              ],
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
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
                        return _cardCat(cats?[index], index: index);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCat(CatEntity? catEntity, {required int index}) {
    return Card(
      shape: AppDecorations.cardRounded,
      child: InkWell(
        borderRadius: AppDecorations.radiusVertical(top: kSize20, bottom: kSize20),
        onTap: () => context.pushNamed(DetailScreen.screenName, extra: catEntity),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: AppDecorations.radiusVertical(top: kSize20),
                  child: Hero(
                    tag: '__${catEntity?.name}__',
                    child: CustomCacheNetworkImage(
                      imageUrl: ImageHelper.getImageUrl(catEntity?.referenceImageId ?? ''),
                      fit: BoxFit.fill,
                      width: 180,
                      height: 180,
                    ),
                  ),
                ),
                Positioned(
                  right: kSize10,
                  top: kSize10,
                  child: Hero(
                    tag: '**${catEntity?.name}**',
                    child: CircleAvatar(
                      backgroundColor: kBlack.withOpacityValue(0.5),
                      child: IconButton(
                        icon:
                            !(ref.read(homeProvider).catList?[index].isFavorite ?? false)
                                ? Icon(Symbols.favorite_rounded, color: kWhite, size: kSize20)
                                : Icon(Symbols.favorite_sharp, color: kRed, size: kSize20, fill: 1),
                        onPressed: () {},
                      ),
                    ),
                  ),
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
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: kNone,
                          leading: const Icon(Symbols.public, color: kGrey),
                          title: Text(
                            catEntity?.origin ?? '',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: kBlack),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          horizontalTitleGap: kNone,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Symbols.network_intelligence),
                          title: Text(catEntity?.intelligence.toString() ?? ''),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
