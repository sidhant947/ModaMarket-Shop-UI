import 'package:flutter/material.dart';
import 'package:moda/constant.dart';
import 'package:provider/provider.dart';
import '../services/provider_helper.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("ModaMarket"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.search)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailScreen(
                            name: item['name']!,
                            price: '\$${item['price']}',
                            imageUrl: item['image']!,
                            description: item['description']!,
                            item: item,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  item['image']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: appProvider.isInFavorites(item)
                                      ? Colors.red
                                      : Colors.red[100],
                                  size: 30,
                                ),
                                onPressed: () {
                                  if (appProvider.isInFavorites(item)) {
                                    appProvider.removeFromFavorites(item);
                                  } else {
                                    appProvider.addToFavorites(item);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '\$${item['price']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item['name']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: appProvider.isInCart(item)
                                      ? Colors.pink
                                      : Colors.white,
                                ),
                                onPressed: () {
                                  if (appProvider.isInCart(item)) {
                                    appProvider.removeFromCart(item);
                                  } else {
                                    appProvider.addToCart(item);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String description;
  final Map<String, dynamic> item;

  const ItemDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.network(
                imageUrl,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: appProvider.isInFavorites(item)
                      ? Colors.red
                      : Colors.grey,
                ),
                onPressed: () {
                  if (appProvider.isInFavorites(item)) {
                    appProvider.removeFromFavorites(item);
                  } else {
                    appProvider.addToFavorites(item);
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: appProvider.isInCart(item) ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  if (appProvider.isInCart(item)) {
                    appProvider.removeFromCart(item);
                  } else {
                    appProvider.addToCart(item);
                  }
                },
              ),
            ],
          ),
          GestureDetector(
            onTap: null,
            child: Container(
              margin: EdgeInsets.all(5),
              color: Colors.black,
              height: 50,
              child: Center(
                  child: Text(
                "Add to Bag",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
