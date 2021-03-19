import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/list/shops_list_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/shops/shops_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopsListScreen extends StatelessWidget {
  static const String route = "ShopsListScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shops")),
      body: BlocProvider(
        create: (context) => ShopsListScreenCubit()..getShopsList(),
        child: BlocBuilder<ShopsListScreenCubit, ShopsListScreenState>(
          builder: (context, state) => Container(
            child: ListView.builder(
                itemCount: state.value == null ? 0 : state.value.length,
                itemBuilder: (context, index) {
                  var item = state.value[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ShopDetailsScreen.route, arguments: ScreenArguments<String>(item.id));
                      },
                      child: ShopsListItemWidget(item.name, item.category, rating: item.rating),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
