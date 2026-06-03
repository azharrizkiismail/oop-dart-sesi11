# Resume Materi Sesi 11
## Redirecting Constructors dalam Pemrograman Berorientasi Objek

**Nama :** Azhar Rizki Ismail 
**NIM :** 23141005P
**Kelas :** SI6KR
**Mata Kuliah :** Pemrograman Berorientasi Objek  

---

# Pendahuluan


Dalam pemrograman berorientasi objek, constructor digunakan untuk menginisialisasi objek ketika objek tersebut dibuat. Seiring berkembangnya kebutuhan aplikasi, sebuah class sering kali memerlukan lebih dari satu constructor untuk menyediakan berbagai cara dalam membuat objek. Namun, penggunaan banyak constructor dapat menyebabkan duplikasi kode karena proses inisialisasi yang sama ditulis berulang kali pada setiap constructor.

Dart menyediakan fitur Redirecting Constructor untuk mengatasi permasalahan tersebut. Redirecting Constructor memungkinkan sebuah constructor mengalihkan proses pembuatan objek ke constructor lain yang berada dalam class yang sama. Dengan pendekatan ini, logika inisialisasi cukup ditulis pada satu constructor utama sehingga kode menjadi lebih ringkas, konsisten, dan mudah dipelihara.

Pada sesi ini akan dipelajari konsep Redirecting Constructor mulai dari sintaks dasar, permasalahan tanpa Redirecting Constructor, solusi menggunakan Redirecting Constructor, penggunaan named parameters, validasi data, multiple redirecting levels, perbandingan dengan factory constructor, hingga penerapan initializer list. Selain itu, materi juga dilengkapi dengan berbagai contoh kode, studi kasus, dan latihan yang bertujuan untuk memperkuat pemahaman mengenai penggunaan Redirecting Constructor dalam pengembangan aplikasi menggunakan bahasa pemrograman Dart.


---

# Redirecting Constructor

## Pengertian Redirecting Constructor

Dalam bahasa pemrograman Dart, sebuah class dapat memiliki lebih dari satu constructor untuk memberikan berbagai cara dalam membuat objek. Namun, ketika setiap constructor memiliki proses inisialisasi yang hampir sama, sering kali terjadi duplikasi kode yang membuat program menjadi kurang efisien dan lebih sulit dipelihara. Untuk mengatasi permasalahan tersebut, Dart menyediakan fitur Redirecting Constructor.

Redirecting Constructor adalah constructor yang mengalihkan proses pembuatan objek ke constructor lain yang berada dalam class yang sama. Dengan menggunakan Redirecting Constructor, proses inisialisasi dapat dipusatkan pada satu constructor utama sehingga constructor lainnya hanya bertugas meneruskan parameter yang diperlukan. Pendekatan ini membantu mengurangi pengulangan kode dan menjaga konsistensi proses pembuatan objek.

Fitur Redirecting Constructor banyak digunakan ketika sebuah class memiliki beberapa constructor dengan tujuan yang berbeda, tetapi tetap membutuhkan proses inisialisasi yang sama. Selain membuat kode lebih ringkas, penggunaan Redirecting Constructor juga memudahkan proses pemeliharaan karena perubahan logika inisialisasi cukup dilakukan pada satu constructor utama tanpa perlu memperbarui constructor lainnya.

Pada materi ini akan dipelajari berbagai bentuk penggunaan Redirecting Constructor, mulai dari sintaks dasar, penggunaan dengan named parameters, validasi data, multiple redirecting levels, hingga perbandingannya dengan Factory Constructor dalam bahasa pemrograman Dart.

## Sintaks Dasar Redirecting Constructor

Redirecting Constructor menggunakan sintaks : this(...) untuk mengalihkan proses pembuatan objek ke constructor lain yang berada dalam class yang sama. Constructor yang melakukan redirect tidak melakukan inisialisasi atribut secara langsung, melainkan menyerahkan proses tersebut kepada constructor tujuan. Dengan cara ini, logika inisialisasi dapat dipusatkan pada satu constructor utama sehingga mengurangi duplikasi kode dan meningkatkan konsistensi dalam pembuatan objek.

### Contoh :

```dart
class User {
  String name;

  User(this.name);

  User.guest() : this('Guest');
}

void main() {
  var user1 = User('Azhar');
  var user2 = User.guest();

  print(user1.name);
  print(user2.name);
}
```

<img width="1920" height="945" alt="1" src="https://github.com/user-attachments/assets/fdea36c9-990b-44da-adbe-5117b7c9304f" />


## Masalah Tanpa Redirecting Constructor

Sebelum adanya Redirecting Constructor, setiap constructor biasanya melakukan proses inisialisasi atribut secara terpisah. Hal ini sering menyebabkan duplikasi kode karena logika inisialisasi yang sama harus ditulis berulang kali pada setiap constructor. Jika suatu saat terjadi perubahan pada proses inisialisasi, maka seluruh constructor yang terkait harus diperbarui satu per satu. Kondisi tersebut dapat meningkatkan risiko kesalahan dan membuat kode menjadi lebih sulit dipelihara.

### Contoh :

```dart
class User {
  String name;

  User(this.name);

  User.guest() : name = 'Guest';

  User.admin() : name = 'Admin';
}

void main() {
  var guest = User.guest();
  var admin = User.admin();

  print(guest.name);
  print(admin.name);
}
```

<img width="1920" height="945" alt="2" src="https://github.com/user-attachments/assets/ca77cd47-9d6e-44f1-b2a5-36aacb0843ae" />


## Solusi dengan Redirecting Constructor

Permasalahan duplikasi kode pada beberapa constructor dapat diatasi dengan menggunakan Redirecting Constructor. Dengan pendekatan ini, proses inisialisasi cukup ditulis pada satu constructor utama, sedangkan constructor lainnya hanya mengalihkan proses pembuatan objek ke constructor tersebut. Cara ini membuat kode lebih ringkas, konsisten, dan mudah dipelihara karena perubahan logika inisialisasi hanya perlu dilakukan pada satu tempat.

### Contoh :

```dart
class User {
  String name;

  User(this.name);

  User.guest() : this('Guest');

  User.admin() : this('Admin');
}

void main() {
  var guest = User.guest();
  var admin = User.admin();

  print(guest.name);
  print(admin.name);
}
```

<img width="1919" height="943" alt="3" src="https://github.com/user-attachments/assets/6528e486-f1b4-4e47-853d-90c58fd4c820" />


## Redirecting Constructor dengan Named Parameters

Redirecting Constructor juga dapat digunakan pada constructor yang memakai named parameters. Penggunaan named parameters membuat kode lebih mudah dibaca karena setiap nilai parameter diberikan bersama nama parameternya. Saat melakukan redirect, constructor cukup meneruskan nilai yang diperlukan ke constructor utama dengan menyebutkan nama parameter yang sesuai.

Pendekatan ini sangat berguna ketika sebuah class memiliki banyak atribut, sehingga proses pembuatan objek menjadi lebih jelas dan terstruktur.

### Contoh :

```dart
class User {
  String name;
  int age;

  User({
    required this.name,
    required this.age,
  });

  User.guest()
      : this(
          name: 'Guest',
          age: 0,
        );
}

void main() {
  var user1 = User(
    name: 'Azhar',
    age: 20,
  );

  var user2 = User.guest();

  print('${user1.name} - ${user1.age}');
  print('${user2.name} - ${user2.age}');
}
```

<img width="1920" height="945" alt="4" src="https://github.com/user-attachments/assets/60f46912-2042-4ceb-9af7-d1466f651e5e" />


# Praktik

## Praktik I - Factory untuk Configuration

```dart
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

void main() {
  var dev = Configuration.development();
  var prod = Configuration.production();

  dev.showConfig();

  print('---');

  prod.showConfig();
}
```

<img width="1920" height="945" alt="5" src="https://github.com/user-attachments/assets/a33bb019-631b-4c20-92ef-3a7439bf3742" />


## Redirecting Constructor dengan Validasi

Redirecting Constructor dapat digunakan bersama proses validasi data. Dalam praktiknya, validasi biasanya ditempatkan pada constructor utama sehingga seluruh constructor yang melakukan redirect akan otomatis mengikuti aturan validasi yang sama. Dengan cara ini, tidak perlu menuliskan logika validasi berulang kali pada setiap constructor.

Pendekatan ini membantu menjaga konsistensi data dan mengurangi kemungkinan terjadinya kesalahan saat pembuatan objek.

### Contoh :

```dart
class User {
  String name;

  User(this.name) {
    if (name.isEmpty) {
      throw Exception('Nama tidak boleh kosong');
    }
  }

  User.guest() : this('Guest');

  User.admin() : this('Admin');
}

void main() {
  var user1 = User.guest();
  var user2 = User.admin();

  print(user1.name);
  print(user2.name);
}
```

<img width="1919" height="946" alt="6" src="https://github.com/user-attachments/assets/71f86414-1f06-4a43-8bef-3b980a7601b5" />


## Multiple Redirecting Levels

Dalam Dart, sebuah Redirecting Constructor tidak hanya dapat mengalihkan proses pembuatan objek ke constructor utama, tetapi juga dapat mengalihkan ke Redirecting Constructor lainnya. Kondisi ini disebut Multiple Redirecting Levels. Dengan pendekatan ini, proses pembuatan objek dapat melewati beberapa tingkat constructor sebelum akhirnya mencapai constructor utama yang melakukan inisialisasi atribut.

Fitur ini berguna ketika sebuah class memiliki banyak variasi constructor yang saling berkaitan. Namun, penggunaannya perlu dilakukan secara bijak agar alur pembuatan objek tetap mudah dipahami.

### Contoh :

```dart
class User {
  String name;

  User(this.name);

  User.named(String name) : this(name);

  User.guest() : this.named('Guest');

  User.defaultUser() : this.guest();
}

void main() {
  var user = User.defaultUser();

  print(user.name);
}
```

<img width="1920" height="943" alt="7" src="https://github.com/user-attachments/assets/ab73be91-3504-4f30-af7e-1892843ac8d5" />


## Redirecting Constructor vs Factory Constructor

Redirecting Constructor dan Factory Constructor sama-sama digunakan untuk menyediakan cara alternatif dalam membuat objek. Namun, keduanya memiliki tujuan dan kemampuan yang berbeda. Redirecting Constructor berfokus pada pengalihan proses pembuatan objek ke constructor lain dalam class yang sama, sedangkan Factory Constructor memberikan fleksibilitas lebih karena dapat mengembalikan objek yang sudah ada, melakukan caching, bahkan mengembalikan instance dari subclass yang berbeda.

Pemilihan antara Redirecting Constructor dan Factory Constructor harus disesuaikan dengan kebutuhan aplikasi. Jika tujuan utamanya adalah mengurangi duplikasi kode constructor, maka Redirecting Constructor merupakan pilihan yang tepat. Sebaliknya, jika diperlukan kontrol yang lebih kompleks terhadap proses pembuatan objek, maka Factory Constructor lebih sesuai digunakan.

## Praktik II - API Response dengan Redirecting

```dart
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

void main() {
  var success = ApiResponse.success();
  var notFound = ApiResponse.notFound();
  var serverError = ApiResponse.serverError();

  success.showResponse();

  print('---');

  notFound.showResponse();

  print('---');

  serverError.showResponse();
}
```

<img width="1920" height="940" alt="8" src="https://github.com/user-attachments/assets/6a137c29-8314-4318-b83a-e1227b8f9f8b" />


## Redirecting Constructor dengan Initializer List

Dalam Dart, Redirecting Constructor dapat dikombinasikan dengan Initializer List untuk memberikan nilai awal pada atribut sebelum constructor utama dijalankan. Initializer List ditulis setelah tanda titik dua (:) dan sebelum body constructor. Fitur ini sangat berguna terutama ketika class memiliki atribut final yang harus diinisialisasi saat objek dibuat.

Penggunaan Redirecting Constructor dengan Initializer List membantu menjaga kode tetap ringkas karena seluruh proses inisialisasi tetap dipusatkan pada constructor utama, sementara constructor lainnya hanya menyediakan nilai yang diperlukan.

### Contoh :

```dart
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

void main() {
  var product1 = Product('Laptop', 7500000);
  var product2 = Product.free('Mouse');

  print('${product1.name} - Rp${product1.price}');
  print('${product2.name} - Rp${product2.price}');
}
```

<img width="1919" height="944" alt="9" src="https://github.com/user-attachments/assets/a19c6ae1-d5b4-46d0-bcce-bda68aa9f575" />


## Best Practices Redirecting Constructor

Dalam penggunaan Redirecting Constructor, terdapat beberapa praktik terbaik yang dapat diterapkan agar kode tetap terstruktur, mudah dipahami, dan mudah dipelihara. Meskipun Redirecting Constructor dapat membantu mengurangi duplikasi kode, penggunaannya tetap perlu memperhatikan desain class secara keseluruhan agar tidak menimbulkan kompleksitas yang tidak diperlukan.

Beberapa praktik terbaik yang dapat diterapkan antara lain :

1. Gunakan Redirecting Constructor untuk mengurangi duplikasi kode, terutama ketika beberapa constructor memiliki proses inisialisasi yang sama.
2. Pusatkan logika inisialisasi pada satu constructor utama, sehingga perubahan pada proses inisialisasi cukup dilakukan di satu tempat.
3. Gunakan nama constructor yang deskriptif, seperti guest(), admin(), atau development(), agar tujuan constructor mudah dipahami.
4. Hindari Multiple Redirecting Levels yang terlalu panjang, karena dapat membuat alur pembuatan objek menjadi sulit ditelusuri.
5. Manfaatkan Redirecting Constructor untuk menyediakan nilai default, sehingga pembuatan objek menjadi lebih sederhana dan konsisten.
6. Gunakan Factory Constructor apabila diperlukan logika yang lebih kompleks, seperti caching, singleton, validasi khusus sebelum pembuatan objek, atau pengembalian instance dari class yang berbeda.

Dengan menerapkan praktik-praktik tersebut, Redirecting Constructor dapat digunakan secara efektif untuk menghasilkan kode yang lebih ringkas, konsisten, dan mudah dipelihara, terutama pada class yang memiliki banyak variasi constructor.


# Kesimpulan

Redirecting Constructor merupakan fitur dalam bahasa pemrograman Dart yang memungkinkan sebuah constructor mengalihkan proses pembuatan objek ke constructor lain dalam class yang sama. Fitur ini sangat berguna untuk mengurangi duplikasi kode karena seluruh proses inisialisasi dapat dipusatkan pada satu constructor utama, sementara constructor lainnya hanya bertugas meneruskan parameter yang diperlukan.

Pada sesi ini telah dipelajari berbagai konsep terkait Redirecting Constructor, mulai dari sintaks dasar, permasalahan yang muncul tanpa Redirecting Constructor, solusi menggunakan Redirecting Constructor, penggunaan named parameters, validasi data, multiple redirecting levels, perbandingan dengan Factory Constructor, hingga penggunaan bersama initializer list. Selain itu, materi juga dilengkapi dengan praktik pembuatan Configuration Class dan API Response untuk memberikan pemahaman yang lebih mendalam mengenai penerapan Redirecting Constructor dalam kasus nyata.

Dengan memahami dan menerapkan Redirecting Constructor secara tepat, pengembang dapat menghasilkan kode yang lebih ringkas, konsisten, mudah dipelihara, dan lebih terorganisir. Oleh karena itu, Redirecting Constructor menjadi salah satu fitur penting dalam pemrograman berorientasi objek di Dart, terutama ketika sebuah class memiliki banyak variasi constructor dengan proses inisialisasi yang serupa.

---


# Latihan


```dart
import 'dart:math';

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

void main() {
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
```

<img width="1919" height="942" alt="10" src="https://github.com/user-attachments/assets/9568bddf-922a-4b3e-b50a-0a8ecf574b0b" />


---
