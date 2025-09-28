import 'dart:io';

void main() {
  // --- PROGRAM KONVERSI MATA UANG ---

  // Variabel untuk menyimpan kurs (nilai tukar)
  // Praktik terbaik: Kurs ini seharusnya diambil dari API,
  // namun untuk kesederhanaan, kita definisikan secara statis.
  double usdToIdr = 15500.0;
  double eurToIdr = 16500.0;

  print('--- Kalkulator Konversi Mata Uang ---');
  print('Pilih jenis konversi:');
  print('1: IDR ke USD');
  print('2: USD ke IDR');
  print('3: IDR ke EUR');
  print('4: EUR ke IDR');

  stdout.write('Masukkan pilihan (1-4): ');
  String? choice = stdin.readLineSync();

  stdout.write('Masukkan jumlah uang: ');
  double? amount = double.tryParse(stdin.readLineSync() ?? '');

  // Validasi input jumlah uang
  if (amount == null || amount < 0) {
    print('Jumlah uang tidak valid.');
    return; // Menghentikan program jika input salah
  }
  
  // Variabel untuk menyimpan hasil konversi
  double result = 0;
  
  // Logika percabangan menggunakan switch-case berdasarkan pilihan pengguna
  switch (choice) {
    case '1':
      result = amount / usdToIdr;
      print('Rp$amount adalah \$${result.toStringAsFixed(2)}');
      break;
    case '2':
      result = amount * usdToIdr;
      print('\$$amount adalah Rp${result.toStringAsFixed(0)}');
      break;
    case '3':
      result = amount / eurToIdr;
      print('Rp$amount adalah €${result.toStringAsFixed(2)}');
      break;
    case '4':
      result = amount * eurToIdr;
      print('€$amount adalah Rp${result.toStringAsFixed(0)}');
      break;
    default:
      // Pesan jika pilihan tidak ada di menu
      print('Pilihan tidak valid.');
  }
}