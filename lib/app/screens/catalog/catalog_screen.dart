import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/screens/catalog/catalog_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/shop_product/shop_product_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatelessWidget {
  var _searchConttoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatalogScreenCubit(),
      child: BlocBuilder<CatalogScreenCubit, CatalogScreenState>(
        builder: (context, state) => _mainContainer(context, state),
      ),
    );
  }

  Widget _mainContainer(BuildContext context, CatalogScreenState state) {
    return SafeArea(
      child: Column(
        children: [
          _searchContainer(context, state),
          Expanded(
            child: _resultsContainer(context, state),
          ),
        ],
      ),
    );
  }

  Widget _searchContainer(BuildContext context, CatalogScreenState state) {
    if (state is CatalogScreenStateInitial) {
      _searchConttoller.clear();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextField(
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  hintText: "Search for product",
                  focusColor: Colors.amber,
                  fillColor: Colors.amber,
                  hoverColor: Colors.amber,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                maxLines: 1,
                controller: _searchConttoller,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.amber,
            ),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                var pattern = _searchConttoller.value.text.trim();
                context.read<CatalogScreenCubit>().findProducts(pattern);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _resultsContainer(BuildContext context, CatalogScreenState state) {
    if (state is CatalogScreenStateProgress) {
      return _progressContainer(context, state);
    } else if (state.result == null) {
      return blankResultsContainer(context, state);
    } else {
      return _resultsListContainer(context, state);
    }
  }

  Widget _progressContainer(BuildContext context, CatalogScreenState state) => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
      ));

  Widget blankResultsContainer(BuildContext context, CatalogScreenState state) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Colors.amber,
              size: 100,
            ),
            Text(
              "Search",
              style: TextStyle(fontSize: 30, color: Colors.black54),
            )
          ],
        ),
      );

  Widget _resultsListContainer(BuildContext context, CatalogScreenState state) => Center(
        child: ListView.builder(
          itemCount: state.result.length,
          itemBuilder: (context, index) {
            var item = state.result[index];
            return ShopProductListItemWidget(
              item,
              splashColor: Colors.amber,
              onTap: () {
                Navigator.pushNamed(context, ProductDetailsScreen.route,
                    arguments: ScreenArguments<Map<String, String>>({ProductDetailsScreen.keyShopId: item.shop.id, ProductDetailsScreen.keyProductId: item.product.id}));
              },
              onCartButtonTap: () {
                context.read<CatalogScreenCubit>().addProduct(item.shop.id, item.product.id);
              },
            );
          },
        ),
      );
}
