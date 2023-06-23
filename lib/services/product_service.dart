import 'package:my_phones_store/models/product.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    // simulate API request delay
    //await Future.delayed(Duration(seconds: 2));

    return [
      Product(
          id: 1,
          price: 499,
          title: 'iPhone 8',
          company: 'Apple',
          image: 'assets/iphone8.png',
          description:
              'The iPhone 8 features a 4.7-inch display with a resolution of 1334 by 750 with 326 pixels per inch and a 1400:1 contrast ratio.'),
      Product(
          id: 2,
          price: 899,
          title: 'Samsung Galaxy S21',
          company: 'Samsung',
          image: 'assets/samsung21.png',
          description:
              'The Galaxy S21 has a screen size of 6.2 inches and has a charge of up to 5-6 hours*, whereas the S21 Ultra measures in at 6.8 inches and can last for up to 8 hours after a full charge.'),
      Product(
          id: 3,
          price: 899,
          title: 'iPhone 12',
          company: 'Apple',
          image: 'assets/iphone12.png',
          description:
              'The iPhone 12 Mini features a 5.4-inch (137 mm) display with the same technology at a resolution of 2340 × 1080 pixels, and a pixel density of about 476 ppi.'),
      Product(
          id: 4,
          price: 799,
          title: 'iPhone 13',
          company: 'Apple',
          image: 'assets/iphone13.png',
          description:
              'The iPhone 13 mini display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle.'),
      Product(
          id: 5,
          price: 699,
          title: 'iPhone X',
          company: 'Apple',
          image: 'assets/iphonex.png',
          description:
              'The iPhone X display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle.'),
      Product(
          id: 6,
          price: 999,
          title: 'Samsung Galaxy S20',
          company: 'Samsung',
          image: 'assets/samsung20.png',
          description:
              'The Galaxy S20 has a screen size of 6.2 inches and has a charge of up to 5-6 hours*, whereas the S21 Ultra measures in at 6.8 inches and can last for up to 8 hours after a full charge.'),
      Product(
          id: 7,
          price: 799,
          title: 'iPhone 11',
          company: 'Apple',
          image: 'assets/iphone11.png',
          description:
              'The iPhone 11 has a 6.1-inch (15 cm) IPS LCD with a resolution is 1792 × 828 pixels (1.4 megapixels) at a pixel density of 326 PPI with a maximum brightness of 625 nits and a 1400:1.'),
      Product(
          id: 8,
          price: 999,
          title: 'Samsung Galaxy Note 20 Ultra',
          company: 'Samsung',
          image: 'assets/samsungnote.png',
          description:
              'The Note 20 and Note 20 Ultra feature a 6.7-inch 1080p and 6.9-inch 1440p display, respectively.'),
    ];
  }
}
