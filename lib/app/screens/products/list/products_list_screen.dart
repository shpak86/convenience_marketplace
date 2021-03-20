import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/screens/products/list/products_list_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/products/products_list_item_widget.dart';
import 'package:convenience_marketplace/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListScreen extends StatelessWidget {
  static const String route = "ProductsListScreen";

  @override
  Widget build(BuildContext context) {
    ScreenArguments<String> arguments = ModalRoute.of(context).settings.arguments;
    String shopId = arguments.value;

    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: BlocProvider(
        create: (context) => ProductsListScreenCubit()..getProducts(shopId),
        child: BlocBuilder<ProductsListScreenCubit, ProductsListScreenState>(
          builder: (context, state) => state.value == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.count(
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    crossAxisCount: 2,
                    childAspectRatio: 18 / 23,
                    children: state.value.map((product) => productItemContainer(context, shopId, product)).toList(),
                  ),
                ),
        ),
      ),
    );
  }

  Widget productItemContainer(BuildContext context, String shopId, ProductEntity item) {
    return ProductsListItemWidget(
      item,
      onDetailsTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.route,
          arguments: ScreenArguments<Map<String, String>>({
            ProductDetailsScreen.keyShopId: shopId,
            ProductDetailsScreen.keyProductId: item.id
          }),
        );
      },
    );
  }
}
