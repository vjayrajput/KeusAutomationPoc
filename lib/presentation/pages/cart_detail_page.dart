import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../widgets/bottomsheet/custom_bottom_sheet_layout_widget.dart';
import '../widgets/cart/cart_body_content_widget.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<StatefulWidget> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  late CartBloc cartBloc;

  @override
  void initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc.add(FetchCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const CustomBottomSheetLayout(child: CartBodyContent());
  }
}
