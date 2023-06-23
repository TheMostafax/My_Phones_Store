import 'package:flutter/material.dart';
import 'package:my_phones_store/main.dart';
import 'package:my_phones_store/models/product.dart';
import 'package:my_phones_store/pages/product_detail_screen.dart';
import 'package:my_phones_store/services/product_service.dart';
import 'package:my_phones_store/screens/products.dart';
import 'package:my_phones_store/screens/about.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> imageListt = [
    'assets/apple.png',
    'assets/samsung.png',
    'assets/oppo.png',
    'assets/xiaomi.png',
  ];
  final List<String> texxt = [
    'Apple',
    'Samsung',
    'Oppo',
    'Xiaomi',
  ];
  final ProductService productService = ProductService();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchFocused = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isSearchFocused) {
          setState(() {
            _isSearchFocused = false;
          });
          _searchController.clear();
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
          toolbarHeight: 60,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: _isSearchFocused
              ? Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for products',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.mobile_friendly_sharp,
                          color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _isSearchFocused = false;
                          });
                          _searchController.clear();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    autofocus: true,
                    onChanged: (value) {
                      setState(
                          () {}); // Trigger rebuild to update the filtered list
                    },
                  ),
                )
              : Text(
                  'My Phones Store',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                setState(() {
                  _isSearchFocused = true;
                });
              },
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 0, 0, 0),
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/back.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'My Phones Store',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'times new roman',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(Icons.home, color: Colors.white),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              ListTile(
                title: Text(
                  'Products',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(Icons.shopping_cart, color: Colors.white),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Productss()));
                },
              ),
              ListTile(
                title: Text(
                  'About us',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(Icons.info, color: Colors.white),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 240,
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/mobile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 220,
                child: FutureBuilder<List<Product>>(
                  future: productService.getProducts(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Product>> snapshot) {
                    if (snapshot.hasData) {
                      List<Product> products = snapshot.data!;
                      if (_searchController.text.isNotEmpty) {
                        products = products
                            .where((product) => product.title
                                .toLowerCase()
                                .contains(_searchController.text.toLowerCase()))
                            .toList();
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: Container(
                              width: 200,
                              margin: EdgeInsets.only(right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        product.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '\$${product.price.toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Color.fromARGB(255, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'All Our Available Brands',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 251, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageListt.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(14),
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      imageListt[index],
                                      fit: BoxFit.cover,
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    texxt[index % texxt.length],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'times new roman',
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
