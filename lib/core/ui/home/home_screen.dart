import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/domain/extension/string_extension.dart';
import 'package:pragma_exam/core/ui/home/provider/home_provider.dart';
import 'package:pragma_exam/share/widgets/appbars/custom_search_appbar.dart';
import 'package:pragma_exam/share/widgets/cards/custom_card.dart';
import 'package:pragma_exam/share/widgets/scaffold/custom_scaffold.dart';
import 'package:pragma_exam/share/widgets/searchBar/custom_search_bar.dart';

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
      child: CustomScaffold(
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
              if (isSearching || kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux) ...[
                CustomSearchBar(
                  hintText: 'search cats'.capitalize(),
                  backgroundColor: WidgetStatePropertyAll<Color>(kGrey02),
                  controllerSearch: _controllerSearch,
                  onSearchChanged: _onSearchChanged,
                  elevation: WidgetStatePropertyAll<double>(kSize1),
                ),
              ],
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  anchor: 0.01,
                  slivers: [
                    SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux ? 380 : 200,
                        mainAxisExtent: kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux ? 472 : 260,
                        crossAxisSpacing: kSize16,
                        mainAxisSpacing: kSize16,
                      ),
                      itemCount: cats?.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          catEntity: cats?[index],
                          index: index,
                          isFavorite: ref.read(homeProvider).catList?[index].isFavorite ?? false,
                        );
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
}
