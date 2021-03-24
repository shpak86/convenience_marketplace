import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/screens/seach/search_screen_cubit.dart';
import 'package:convenience_marketplace/app/utils/screen_arguments.dart';
import 'package:convenience_marketplace/app/widgets/search/search_results_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var _searchConttoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScreenCubit(),
      child: BlocBuilder<SearchScreenCubit, SearchScreenState>(
        builder: (context, state) => _mainContainer(context, state),
      ),
    );
  }

  Widget _mainContainer(BuildContext context, SearchScreenState state) {
    return SafeArea(
      child: Column(
        children: [
          searchContainer(context, state),
          Expanded(
            child: resultsContainer(context, state),
          ),
        ],
      ),
    );
  }

  Widget searchContainer(BuildContext context, SearchScreenState state) {
    if (state is SearchScreenStateInitial) {
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
                context.read<SearchScreenCubit>().findProducts(pattern);
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget resultsContainer(BuildContext context, SearchScreenState state) {
    if (state is SearchScreenStateProgress) {
      return progressContainer(context, state);
    } else if (state.result == null) {
      return blankResultsContainer(context, state);
    } else {
      return resultsListContainer(context, state);
    }
  }

  Widget progressContainer(BuildContext context, SearchScreenState state) => Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
      ));

  Widget blankResultsContainer(BuildContext context, SearchScreenState state) => Center(
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

  Widget resultsListContainer(BuildContext context, SearchScreenState state) => Center(
        child: ListView.builder(
          itemCount: state.result.length,
          itemBuilder: (context, index) {
            var item = state.result[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchResultsListItemWidget(item, onTap: (){
                Navigator.pushNamed(context, ProductDetailsScreen.route, arguments: ScreenArguments<Map<String, String>>({
                  ProductDetailsScreen.keyShopId: item.shop.id,
                  ProductDetailsScreen.keyProductId: item.product.id
                }));
              },
              onCartButtonTap: (){
                context.read<SearchScreenCubit>().addProduct(item.shop.id, item.product.id);
              },),
            );
          },
        ),
      );
}
