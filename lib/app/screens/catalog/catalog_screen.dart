import 'package:convenience_marketplace/app/screens/catalog/catalog_screen_cubit.dart';
import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/categories/category_card.dart';
import 'package:convenience_marketplace/app/widgets/products/product_card.dart';
import 'package:convenience_marketplace/app/widgets/shop_product/shop_product_list_item_widget.dart';
import 'package:convenience_marketplace/di/storage.dart';
import 'package:convenience_marketplace/domain/entities/shop_product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatelessWidget {
  var _searchController = TextEditingController();

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
      _searchController.clear();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(child: _searchInput(context, state)),
          _searcgButton(context, state),
        ],
      ),
    );
  }

  Widget _searchInput(BuildContext context, CatalogScreenState state) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          children: [
            TextField(
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
              controller: _searchController,
              keyboardType: TextInputType.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    onPressed: () {
                      _searchController.clear();
                      context.read<CatalogScreenCubit>().init();
                    },
                    splashRadius: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      );

  Widget _searcgButton(BuildContext context, CatalogScreenState state) => Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: Colors.amber,
        ),
        child: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            var pattern = _searchController.value.text.trim();
            if (pattern.isNotEmpty) {
              context.read<CatalogScreenCubit>().findProducts(pattern);
            }
            FocusScope.of(context).requestFocus(FocusNode());
          },
          color: Colors.white,
        ),
      );

  Widget _resultsContainer(BuildContext context, CatalogScreenState state) {
    if (state is CatalogScreenStateProgress) {
      return _progressContainer(context, state);
    } else if (state.result == null) {
      return _cardsContainer(context, state);
    } else {
      if (state.result.isEmpty) {
        return _notFoundContainer(context, state);
      } else {
        return _resultsListContainer(context, state);
      }
    }
  }

  Widget _cardsContainer(BuildContext context, CatalogScreenState state) {
    return ListView(
      children: [
        _horizontalScrollContainer(context, "Products categories", _productsCategoriesCards()),
        _horizontalScrollContainer(context, "Shops categories", _shopsCategoriesCards()),
        _horizontalScrollContainer(context, "Recommended for you", _productRecommendations()),
        _horizontalScrollContainer(context, "Popular products", _popularRecommendations()),
      ],
    );
  }

  Widget _progressContainer(BuildContext context, CatalogScreenState state) => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
      ));

  Widget _notFoundContainer(BuildContext context, CatalogScreenState state) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              color: Colors.amber,
              size: 100,
            ),
            Text(
              "Nothing found",
              style: TextStyle(fontSize: 30, color: Colors.black54),
            ),
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
                    arguments: ScreenArguments<Map<String, String>>({
                      ProductDetailsScreen.keyShopId: item.shop.id,
                      ProductDetailsScreen.keyProductId: item.product.id
                    }));
              },
              onCartButtonTap: () {
                context.read<CatalogScreenCubit>().addProduct(item.shop.id, item.product.id);
              },
            );
          },
        ),
      );

  Widget _horizontalScrollContainer(BuildContext context, String label, List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 18.0),
            ),
          ),
          Container(
            height: 170,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              scrollDirection: Axis.horizontal,
              children: items,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _productsCategoriesCards() => [
        CategoryCard(
          "Vegetables and fruits",
          color: Colors.lightGreen.shade50,
        ),
        CategoryCard(
          "Sweets and desserts",
          color: Colors.amber.shade50,
        ),
        CategoryCard(
          "Meat and poultry",
          color: Colors.red.shade50,
        ),
        CategoryCard(
          "Milk and eggs",
          color: Colors.grey.shade50,
        ),
        CategoryCard(
          "Fish and shellfish",
          color: Colors.blue.shade50,
        ),
        CategoryCard(
          "Coffee",
          color: Colors.brown.shade50,
        ),
      ];

  List<Widget> _shopsCategoriesCards() => [
        CategoryCard(
          "Malls",
          color: Colors.red.shade50,
        ),
        CategoryCard(
          "24-hour shops",
          color: Colors.blue.shade50,
        ),
        CategoryCard(
          "Tools",
          color: Colors.green.shade50,
        ),
        CategoryCard(
          "Groceries",
          color: Colors.amber.shade50,
        ),
        CategoryCard(
          "Coffee shops",
          color: Colors.yellow.shade50,
        ),
        CategoryCard(
          "Delivery services",
          color: Colors.indigo.shade50,
        ),
      ];

  List<Widget> _productRecommendations() => Storage.products["1"].map((e) => ProductCard(ShopProductEntity(Storage.shops.first, e, 0))).toList();

  List<Widget> _popularRecommendations() => Storage.products["5"].map((e) => ProductCard(ShopProductEntity(Storage.shops.first, e, 0))).toList();
}
