import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/list/shops_list_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/shops/shops_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopsListScreen extends StatelessWidget {
  static const String route = "ShopsListScreen";
  static final String heroTag = "shops_list_to_details_tag";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopsListScreenCubit()..getShopsList(),
      child: BlocBuilder<ShopsListScreenCubit, ShopsListScreenState>(
        builder: (context, state) => mainContainer(context, state),
      ),
      // ),
    );
  }

  Widget mainContainer(BuildContext context, ShopsListScreenState state) {
    if (state.value == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
        child: ListView.builder(
            itemCount: state.value == null ? 0 : state.value.length,
            itemBuilder: (context, index) {
              var item = state.value[index];
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ShopsListItemWidget(
                  item,
                  onTap: () {
                    Navigator.pushNamed(context, ShopDetailsScreen.route, arguments: ScreenArguments<String>(item.id)).then((value) => context.read<ShopsListScreenCubit>().getShopsList());
                  },
                ),
              );
            }),
      );
    }
  }
}
