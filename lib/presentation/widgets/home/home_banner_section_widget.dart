import 'package:flutter/material.dart';

import '../../models/product_ui_model.dart';
import 'banner_product_section_widget.dart';
import 'banner_slider_header_section_widget.dart';
import 'banner_slider_indicator_section_widget.dart';

class HomeBannerSection extends StatefulWidget {
  final PageController pageController;
  final List<ProductUiModel> bannerProducts;
  final Function(ProductUiModel)? onItemTap;

  const HomeBannerSection({
    super.key,
    required this.pageController,
    required this.bannerProducts,
    required this.onItemTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeBannerSectionState();
  }
}

class _HomeBannerSectionState extends State<HomeBannerSection> {
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        currentPage = widget.pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner slider header
        const BannerSliderHeaderSection(),

        // Slider for hits of the week
        SizedBox(
          height: deviceHeight * 0.32,
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.bannerProducts.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index.toDouble();
              });
            },
            itemBuilder: (context, index) {
              var product = widget.bannerProducts[index];
              return BannerProductSection(
                key: ValueKey(product.id),
                product: product,
                onTap: () => widget.onItemTap?.call(product),
              );
            },
          ),
        ),

        // Slider indicator
        BannerSliderIndicatorSection(
          itemCount: widget.bannerProducts.length,
          currentPage: currentPage,
        ),
      ],
    );
  }
}
