import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keus_automation_poc/core/extensions/toast_extension.dart';

import '../../core/constants/strings.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../bloc/cart/cart_state.dart';
import '../bloc/product/product_bloc.dart';
import '../bloc/product/product_event.dart';
import '../bloc/product/product_state.dart';
import '../models/product_ui_model.dart';
import '../widgets/home/dummy_drawer_items.dart';
import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_banner_section_widget.dart';
import '../widgets/home/home_cart_section_widget.dart';
import '../widgets/home/home_category_section_widget.dart';
import '../widgets/home/home_products_section_widget.dart';
import 'product_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late final CartBloc cartBloc;
  late final ProductBloc productBloc;
  List<String> categories = [];
  List<ProductUiModel> hitOfWeekProducts = [];
  List<ProductUiModel> categoryProducts = [];
  bool isCartVisible = false;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
    productBloc = BlocProvider.of<ProductBloc>(context);

    _fetchInitialData();
  }

  void _fetchInitialData() {
    productBloc.add(FetchCategoriesEvent());
    productBloc.add(FetchHitOfWeekProductsEvent());
    cartBloc.add(FetchCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return MultiBlocListener(
      listeners: [
        BlocListener<CartBloc, CartState>(
          listener: _cartBlocListener,
        ),
        BlocListener<ProductBloc, ProductState>(
          listener: _productBlocListener,
        ),
      ],
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(child: DummyDrawerItems()),
        onDrawerChanged: (isOpened) {
          if (!isOpened) setState(() {});
        },
        appBar: HomeAppBar(
          title: Strings.dummyTitle,
          onLeftIconTap: () => scaffoldKey.currentState?.openDrawer(),
          onRightIconTap: () => context.showToast(Strings.searchIconPressed),
          onTitleTap: () => context.showToast(Strings.addressTitlePressed),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  _buildCustomScrollView(),
                  if (isCartVisible) _buildCartSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCustomScrollView() {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        if (hitOfWeekProducts.isNotEmpty)
          SliverToBoxAdapter(
            child: HomeBannerSection(
              pageController: PageController(),
              bannerProducts: hitOfWeekProducts,
              onItemTap: _openProductDetails,
            ),
          ),
        SliverToBoxAdapter(
          child: HomeCategorySection(
            categories: categories,
            onFilterTap: () => context.showToast(Strings.filterIconPressed),
            onItemTap: _fetchProductsByCategory,
          ),
        ),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, productState) {
            if (productState is ProductsByCategoryLoaded) {
              categoryProducts = productState.categoryProducts;
            }
            return HomeProductsSection(
              products: categoryProducts,
              onItemTap: _openProductDetails,
            );
          },
        ),
      ],
    );
  }

  Positioned _buildCartSection() {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: InkWell(
        onTap: () => _openCartDetails(),
        child: HomeCartSection(totalPrice: totalPrice),
      ),
    );
  }

  void _openProductDetails(ProductUiModel product) {
    openBottomSheet(
      context: context,
      child: BlocProvider.value(
        value: cartBloc,
        child: ProductDetails(product: product),
      ),
    );
  }

  void _fetchProductsByCategory(String category) {
    print("_fetchProductsByCategory category : $category");
    productBloc.add(FetchProductsByCategoryEvent(category));
  }

  void _openCartDetails() {}

  void _cartBlocListener(BuildContext context, CartState state) {
    if (state is CartSuccess) {
      isCartVisible = state.cartItems.isNotEmpty;
      totalPrice = state.total;
    } else if (state is CartError) {
      _showSnackBar("Cart error: ${state.errorMessage}");
    }
  }

  void _productBlocListener(BuildContext context, ProductState state) {
    if (state is HitOfWeekProductsLoaded) {
      hitOfWeekProducts = state.hitOfWeekProducts;
    } else if (state is CategoriesLoaded) {
      categories = state.categories;
    } else if (state is ProductsByCategoryLoaded) {
      categoryProducts = state.categoryProducts;
    } else if (state is ProductError) {
      _showSnackBar("Product error: ${state.errorMessage}");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void openBottomSheet({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    bool isTransparentBackground = true,
  }) {
    showModalBottomSheet(
      backgroundColor:
          isTransparentBackground ? Colors.transparent : Colors.white,
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) => child,
    );
  }
}
