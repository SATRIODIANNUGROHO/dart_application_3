void main() {
  // --- DEMONSTRASI SEMUA JENIS OPERATOR ---
  print('--- Demonstrasi Operator dalam Dart ---');

  // Inisialisasi variabel untuk demonstrasi
  int a = 10;
  int b = 3;
  double c = 7.5;
  bool isTrue = true;
  bool isFalse = false;

  // 1. Operator Aritmatika
  print('\n== 1. Operator Aritmatika ==');
  print('$a + $b = ${a + b}'); // Penjumlahan
  print('$a - $b = ${a - b}'); // Pengurangan
  print('$a * $b = ${a * b}'); // Perkalian
  print('$a / $b = ${a / b}'); // Pembagian (hasil double)
  print('$a ~/ $b = ${a ~/ b}'); // Pembagian (hasil integer)
  print('$a % $b = ${a % b}'); // Modulo (sisa bagi)

  // 2. Operator Relasional (Perbandingan)
  print('\n== 2. Operator Relasional ==');
  print('$a == $b: ${a == b}'); // Sama dengan
  print('$a != $b: ${a != b}'); // Tidak sama dengan
  print('$a > $b: ${a > b}'); // Lebih besar dari
  print('$a < $b: ${a < b}'); // Lebih kecil dari
  print('$a >= $b: ${a >= 10}'); // Lebih besar atau sama dengan
  print('$a <= $b: ${a <= 3}'); // Lebih kecil atau sama dengan

  // 3. Operator Logika
  print('\n== 3. Operator Logika ==');
  print('$isTrue && $isFalse: ${isTrue && isFalse}'); // AND Logis
  print('$isTrue || $isFalse: ${isTrue || isFalse}'); // OR Logis
  print('!$isTrue: ${!isTrue}'); // NOT Logis

  // 4. Operator Penugasan (Assignment)
  print('\n== 4. Operator Penugasan ==');
  int x = 5;
  print('Nilai awal x = $x');
  x += 2; // sama dengan x = x + 2
  print('Setelah x += 2, x = $x');
  x -= 3; // sama dengan x = x - 3
  print('Setelah x -= 3, x = $x');
  x *= 4; // sama dengan x = x * 4
  print('Setelah x *= 4, x = $x');

  // 5. Operator Increment & Decrement
  print('\n== 5. Operator Increment & Decrement ==');
  int y = 8;
  print('Nilai awal y = $y');
  y++; // Menambah nilai y dengan 1
  print('Setelah y++, y = $y');
  y--; // Mengurangi nilai y dengan 1
  print('Setelah y--, y = $y');

  // 6. Operator Kondisional (Ternary)
  print('\n== 6. Operator Kondisional (Ternary) ==');
  String message = (a > 5) ? 'a lebih besar dari 5' : 'a tidak lebih besar dari 5';
  print(message);

  // 7. Operator Type Test
  print('\n== 7. Operator Type Test ==');
  print('Variabel c ($c) adalah double: ${c is double}'); // Apakah c bertipe double?
  print('Variabel a ($a) bukan String: ${a is! String}'); // Apakah a bukan bertipe String?
}