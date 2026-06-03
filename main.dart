import 'dart:math';
class UserBasic {
  String name;

  UserBasic(this.name);

  UserBasic.guest() : this('Guest');
}

void demoBasic() {
  var user1 = UserBasic('Azhar');
  var user2 = UserBasic.guest();

  print(user1.name);
  print(user2.name);
}
class UserWithoutRedirect {
  String name;

  UserWithoutRedirect(this.name);

  UserWithoutRedirect.guest() : name = 'Guest';

  UserWithoutRedirect.admin() : name = 'Admin';
}

void demoWithoutRedirect() {
  var guest = UserWithoutRedirect.guest();
  var admin = UserWithoutRedirect.admin();

  print(guest.name);
  print(admin.name);
}
class UserRedirect {
  String name;

  UserRedirect(this.name);

  UserRedirect.guest() : this('Guest');

  UserRedirect.admin() : this('Admin');
}

void demoRedirect() {
  var guest = UserRedirect.guest();
  var admin = UserRedirect.admin();

  print(guest.name);
  print(admin.name);
}
class UserNamed {
  String name;
  int age;

  UserNamed({
    required this.name,
    required this.age,
  });

  UserNamed.guest()
      : this(
          name: 'Guest',
          age: 0,
        );
}

void demoNamed() {
  var user1 = UserNamed(
    name: 'Azhar',
    age: 20,
  );

  var user2 = UserNamed.guest();

  print('${user1.name} - ${user1.age}');
  print('${user2.name} - ${user2.age}');
}
class Configuration {
  String environment;
  String apiUrl;

  Configuration(this.environment, this.apiUrl);

  Configuration.development()
      : this(
          'Development',
          'https://dev-api.example.com',
        );

  Configuration.production()
      : this(
          'Production',
          'https://api.example.com',
        );

  void showConfig() {
    print('Environment : $environment');
    print('API URL     : $apiUrl');
  }
}

void demoConfiguration() {
  var dev = Configuration.development();
  var prod = Configuration.production();

  dev.showConfig();

  print('---');

  prod.showConfig();
}
class UserValidation {
  String name;

  UserValidation(this.name) {
    if (name.isEmpty) {
      throw Exception('Nama tidak boleh kosong');
    }
  }

  UserValidation.guest() : this('Guest');

  UserValidation.admin() : this('Admin');
}

void demoValidation() {
  var user1 = UserValidation.guest();
  var user2 = UserValidation.admin();

  print(user1.name);
  print(user2.name);
}
class UserMultiple {
  String name;

  UserMultiple(this.name);

  UserMultiple.named(String name) : this(name);

  UserMultiple.guest() : this.named('Guest');

  UserMultiple.defaultUser() : this.guest();
}

void demoMultiple() {
  var user = UserMultiple.defaultUser();

  print(user.name);
}
class ApiResponse {
  int statusCode;
  String message;

  ApiResponse(this.statusCode, this.message);

  ApiResponse.success()
      : this(
          200,
          'Request berhasil',
        );

  ApiResponse.notFound()
      : this(
          404,
          'Data tidak ditemukan',
        );

  ApiResponse.serverError()
      : this(
          500,
          'Terjadi kesalahan server',
        );

  void showResponse() {
    print('Status Code : $statusCode');
    print('Message     : $message');
  }
}

void demoApiResponse() {
  var success = ApiResponse.success();
  var notFound = ApiResponse.notFound();
  var serverError = ApiResponse.serverError();

  success.showResponse();

  print('---');

  notFound.showResponse();

  print('---');

  serverError.showResponse();
}
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);

  Product.free(String name)
      : this(
          name,
          0,
        );
}

void demoProduct() {
  var product1 = Product('Laptop', 7500000);
  var product2 = Product.free('Mouse');

  print('${product1.name} - Rp${product1.price}');
  print('${product2.name} - Rp${product2.price}');
}
class Circle {
  final double radius;

  Circle(this.radius);

  Circle.fromDiameter(double diameter)
      : this(diameter / 2);

  Circle.fromCircumference(double circumference)
      : this(circumference / (2 * pi));

  Circle.fromArea(double area)
      : this(sqrt(area / pi));

  double get diameter => radius * 2;

  double get circumference => 2 * pi * radius;

  double get area => pi * radius * radius;

  void showInfo() {
    print('Radius       : ${radius.toStringAsFixed(2)}');
    print('Diameter     : ${diameter.toStringAsFixed(2)}');
    print('Keliling     : ${circumference.toStringAsFixed(2)}');
    print('Luas         : ${area.toStringAsFixed(2)}');
  }
}

void demoCircle() {
  var c1 = Circle(7);
  var c2 = Circle.fromDiameter(14);
  var c3 = Circle.fromCircumference(43.98);
  var c4 = Circle.fromArea(153.94);

  c1.showInfo();

  print('---');

  c2.showInfo();

  print('---');

  c3.showInfo();

  print('---');

  c4.showInfo();
}
void main() {
  print('=== Sintaks Dasar ===');
  demoBasic();

  print('\n=== Masalah Tanpa Redirecting ===');
  demoWithoutRedirect();

  print('\n=== Solusi Redirecting ===');
  demoRedirect();

  print('\n=== Named Parameters ===');
  demoNamed();

  print('\n=== Praktik 1 Configuration ===');
  demoConfiguration();

  print('\n=== Redirecting dengan Validasi ===');
  demoValidation();

  print('\n=== Multiple Redirecting Levels ===');
  demoMultiple();

  print('\n=== Praktik 2 API Response ===');
  demoApiResponse();

  print('\n=== Initializer List ===');
  demoProduct();

  print('\n=== Latihan Circle ===');
  demoCircle();
}
