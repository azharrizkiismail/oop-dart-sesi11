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


## Factory untuk Immutable Objects dengan Cache

Factory constructor sering digunakan untuk menerapkan caching pada immutable object, yaitu objek yang nilainya tidak dapat diubah setelah dibuat. Dengan teknik ini, ketika objek dengan data yang sama diminta kembali, factory constructor akan mengembalikan instance yang sudah ada di cache daripada membuat objek baru. Pendekatan ini dapat menghemat penggunaan memori, meningkatkan performa aplikasi, dan memastikan tidak terjadi pembuatan objek yang sama secara berulang.

### Contoh :

```dart
class User {
  final String username;

  static final Map<String, User> _cache = {};

  User._internal(this.username);

  factory User(String username) {
    if (_cache.containsKey(username)) {
      return _cache[username]!;
    }

    final user = User._internal(username);
    _cache[username] = user;

    return user;
  }
}

void main() {
  var user1 = User('azhar');
  var user2 = User('azhar');
  var user3 = User('rizki');

  print(identical(user1, user2));

  print(identical(user1, user3));
}
```

<img width="1920" height="942" alt="10" src="https://github.com/user-attachments/assets/201d590d-fc90-45b9-aa54-e5dc942af5ac" />


# Studi Kasus

## Studi Kasus I - Document Factory

```dart
abstract class Document {
  void open();

  factory Document(String type) {
    if (type == 'pdf') {
      return PdfDocument();
    } else if (type == 'word') {
      return WordDocument();
    } else if (type == 'excel') {
      return ExcelDocument();
    }

    throw Exception('Tipe dokumen tidak didukung');
  }
}

class PdfDocument implements Document {
  @override
  void open() {
    print('Membuka dokumen PDF');
  }
}

class WordDocument implements Document {
  @override
  void open() {
    print('Membuka dokumen Word');
  }
}

class ExcelDocument implements Document {
  @override
  void open() {
    print('Membuka dokumen Excel');
  }
}

void main() {
  Document pdf = Document('pdf');
  Document word = Document('word');
  Document excel = Document('excel');

  pdf.open();
  word.open();
  excel.open();
}
```

<img width="1919" height="941" alt="11" src="https://github.com/user-attachments/assets/e7d0cbf2-3b48-4ac1-9c5d-bc9bbe68fc45" />


# Kesimpulan

Factory Constructor merupakan constructor khusus pada Dart yang memberikan fleksibilitas lebih dalam proses pembuatan objek. Berbeda dengan constructor biasa yang selalu membuat instance baru, factory constructor dapat mengembalikan objek yang sudah ada, mengelola proses caching, maupun menentukan jenis objek yang akan dikembalikan berdasarkan kondisi tertentu. Kemampuan ini membuat factory constructor menjadi salah satu fitur penting dalam pengembangan aplikasi berorientasi objek.

Melalui materi ini telah dipelajari berbagai konsep terkait Factory Constructors, mulai dari sintaks dasar, penggunaan named factory constructor, generic factory constructor, hingga perbandingan antara factory constructor dan static method. Selain itu, factory constructor juga dapat dimanfaatkan untuk mengimplementasikan immutable objects dengan cache sehingga penggunaan memori menjadi lebih efisien. Berbagai contoh kode yang diberikan menunjukkan bagaimana factory constructor dapat menyederhanakan proses pembuatan objek sekaligus meningkatkan fleksibilitas desain program.

Penerapan Factory Constructors sangat banyak ditemukan dalam pengembangan perangkat lunak modern, seperti pada implementasi Singleton Pattern, Object Pool, Caching, pemilihan subclass secara otomatis, dan pembuatan dokumen berdasarkan tipe tertentu. Dengan memahami konsep dan penggunaan factory constructor secara tepat, programmer dapat menghasilkan kode yang lebih efisien, mudah dipelihara, serta sesuai dengan prinsip-prinsip pemrograman berorientasi objek.

---


# Latihan

## Latihan 1

```dart
class DatabaseConnection {
  final String host;
  final int port;

  DatabaseConnection._(this.host, this.port);

  static final Map<String, DatabaseConnection> _pool = {};

  factory DatabaseConnection(String host, int port) {
    String key = '$host:$port';

    if (_pool.containsKey(key)) {
      print('Menggunakan koneksi dari pool');
      return _pool[key]!;
    }

    print('Membuat koneksi baru');
    final connection = DatabaseConnection._(host, port);

    _pool[key] = connection;

    return connection;
  }

  void connect() {
    print('Terhubung ke $host:$port');
  }
}

void main() {
  var conn1 = DatabaseConnection('localhost', 5432);
  var conn2 = DatabaseConnection('localhost', 5432);

  conn1.connect();

  print(identical(conn1, conn2));
}
```

<img width="1920" height="945" alt="12" src="https://github.com/user-attachments/assets/b8fa9490-24d1-45fd-93c6-1ef5a4889493" />


## Latihan 2

```dart
abstract class Notification {
  void send(String message);

  factory Notification(String platform) {
    if (platform.toLowerCase() == 'email') {
      return EmailNotification();
    } else if (platform.toLowerCase() == 'sms') {
      return SmsNotification();
    } else if (platform.toLowerCase() == 'push') {
      return PushNotification();
    }

    throw Exception('Platform tidak didukung');
  }
}

class EmailNotification implements Notification {
  @override
  void send(String message) {
    print('Email: $message');
  }
}

class SmsNotification implements Notification {
  @override
  void send(String message) {
    print('SMS: $message');
  }
}

class PushNotification implements Notification {
  @override
  void send(String message) {
    print('Push Notification: $message');
  }
}

void main() {
  Notification email = Notification('email');
  Notification sms = Notification('sms');
  Notification push = Notification('push');

  email.send('Selamat datang!');
  sms.send('Kode OTP Anda: 123456');
  push.send('Ada promo baru hari ini!');
}
```

<img width="1920" height="943" alt="13" src="https://github.com/user-attachments/assets/77a74017-4be6-4059-ac89-7b73d6952a89" />


## Latihan 3

```dart
abstract class Shape {
  void draw();
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);

  @override
  void draw() {
    print('Lingkaran dengan radius $radius');
  }
}

class Square implements Shape {
  final double side;

  Square(this.side);

  @override
  void draw() {
    print('Persegi dengan sisi $side');
  }
}

class ShapeFactory {
  static final Map<String, Shape> _cache = {};

  static Shape getCircle(double radius) {
    String key = 'circle_$radius';

    if (!_cache.containsKey(key)) {
      print('Membuat Circle baru');
      _cache[key] = Circle(radius);
    } else {
      print('Menggunakan Circle dari cache');
    }

    return _cache[key]!;
  }

  static Shape getSquare(double side) {
    String key = 'square_$side';

    if (!_cache.containsKey(key)) {
      print('Membuat Square baru');
      _cache[key] = Square(side);
    } else {
      print('Menggunakan Square dari cache');
    }

    return _cache[key]!;
  }
}

void main() {
  Shape circle1 = ShapeFactory.getCircle(10);
  Shape circle2 = ShapeFactory.getCircle(10);

  Shape square1 = ShapeFactory.getSquare(5);
  Shape square2 = ShapeFactory.getSquare(5);

  circle1.draw();
  square1.draw();

  print(identical(circle1, circle2));
  print(identical(square1, square2));
}
```

<img width="1919" height="946" alt="14" src="https://github.com/user-attachments/assets/708e7d6d-5bf0-4cbf-a6f4-75f8a622f17b" />


---

# Challenge - AnimalFactory

```dart
abstract class Animal {
  String name;

  Animal(this.name);

  void makeSound();

  static final Map<String, Animal> _cache = {};

  factory Animal.create(String type, String name) {
    if (name.trim().isEmpty) {
      throw Exception('Nama hewan tidak boleh kosong');
    }

    String key = '${type.toLowerCase()}_$name';

    if (_cache.containsKey(key)) {
      print('Menggunakan hewan dari cache');
      return _cache[key]!;
    }

    Animal animal;

    switch (type.toLowerCase()) {
      case 'dog':
        animal = Dog(name);
        break;

      case 'cat':
        animal = Cat(name);
        break;

      case 'bird':
        animal = Bird(name);
        break;

      default:
        throw Exception('Jenis hewan tidak dikenal');
    }

    _cache[key] = animal;

    print('Membuat hewan baru');

    return animal;
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name : Woof!');
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name : Meow!');
  }
}

class Bird extends Animal {
  Bird(String name) : super(name);

  @override
  void makeSound() {
    print('$name : Tweet!');
  }
}

void main() {
  Animal dog1 = Animal.create('dog', 'Buddy');
  Animal dog2 = Animal.create('dog', 'Buddy');

  Animal cat1 = Animal.create('cat', 'Milo');

  dog1.makeSound();
  cat1.makeSound();

  print(identical(dog1, dog2));
}
```

<img width="1919" height="942" alt="15" src="https://github.com/user-attachments/assets/aac4a391-526d-449d-9748-49cf0f452387" />


---
