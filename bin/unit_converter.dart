import 'dart:io';

// Fungsi utama yang menjalankan program
void main() {
  while (true) {
    print('\n--- APLIKASI KONVERSI UNIT ---');
    print('Pilih kategori konversi:');
    print('1. Panjang');
    print('2. Massa');
    print('3. Volume');
    print('4. Suhu');
    print('5. Keluar');
    stdout.write('Masukkan pilihan: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        handleConversion('Panjang');
        break;
      case '2':
        handleConversion('Massa');
        break;
      case '3':
        handleConversion('Volume');
        break;
      case '4':
        handleTemperatureConversion();
        break;
      case '5':
        print('Terima kasih!');
        return; // Keluar dari program
      default:
        print('Pilihan tidak valid.');
    }
  }
}

// Fungsi generik untuk menangani konversi Panjang, Massa, dan Volume
void handleConversion(String category) {
  // Map untuk menyimpan unit dan faktor konversinya ke unit dasar
  // Unit dasar: meter (panjang), gram (massa), liter (volume)
  const Map<String, Map<String, double>> conversionFactors = {
    'Panjang': {
      'mm': 0.001, 'cm': 0.01, 'm': 1.0, 'km': 1000.0, 'inch': 0.0254
    },
    'Massa': {
      'mg': 0.001, 'g': 1.0, 'kg': 1000.0, 'ton': 1000000.0, 'ounce': 28.3495
    },
    'Volume': {
      'ml': 0.001, 'l': 1.0, 'm3': 1000.0, 'gallon': 3.78541, 'oz': 0.0295735
    }
  };

  // Mendapatkan unit yang tersedia untuk kategori yang dipilih
  Map<String, double> units = conversionFactors[category]!;
  
  print('\n--- Konversi $category ---');
  print('Unit yang tersedia: ${units.keys.join(', ')}');

  // Input dari pengguna
  stdout.write('Konversi dari (contoh: m): ');
  String? fromUnit = stdin.readLineSync()?.toLowerCase();
  
  stdout.write('Konversi ke (contoh: cm): ');
  String? toUnit = stdin.readLineSync()?.toLowerCase();

  stdout.write('Masukkan nilai: ');
  double? value = double.tryParse(stdin.readLineSync() ?? '');

  // Validasi input
  if (value == null || value < 0 || fromUnit == null || toUnit == null || !units.containsKey(fromUnit) || !units.containsKey(toUnit)) {
    print('Input tidak valid. Pastikan unit ada dalam daftar dan nilai tidak negatif.');
    return;
  }
  
  // Proses Konversi
  // 1. Ubah nilai input ke unit dasar (meter/gram/liter)
  double valueInBaseUnit = value * units[fromUnit]!;
  // 2. Ubah dari unit dasar ke unit tujuan
  double result = valueInBaseUnit / units[toUnit]!;

  // Tampilkan hasil
  print('-----------------------------------------');
  print('Hasil: $value $fromUnit = ${result.toStringAsFixed(4)} $toUnit');
  print('-----------------------------------------');
}

// Fungsi khusus untuk konversi suhu karena rumusnya berbeda
void handleTemperatureConversion() {
  print('\n--- Konversi Suhu ---');
  print('Unit yang tersedia: celsius, fahrenheit, kelvin, reamur');
  
  stdout.write('Konversi dari: ');
  String? fromUnit = stdin.readLineSync()?.toLowerCase();
  
  stdout.write('Konversi ke: ');
  String? toUnit = stdin.readLineSync()?.toLowerCase();

  stdout.write('Masukkan suhu: ');
  double? value = double.tryParse(stdin.readLineSync() ?? '');

  // Validasi dasar
  if (value == null || fromUnit == null || toUnit == null) {
    print('Input tidak valid.');
    return;
  }
  
  double result = 0;
  // Konversi semua input ke Celsius terlebih dahulu sebagai unit dasar
  double valueInCelsius;
  switch (fromUnit) {
    case 'celsius':
      valueInCelsius = value;
      break;
    case 'fahrenheit':
      valueInCelsius = (value - 32) * 5 / 9;
      break;
    case 'kelvin':
      valueInCelsius = value - 273.15;
      break;
    case 'reamur':
      valueInCelsius = value * 5 / 4;
      break;
    default:
      print('Unit suhu awal tidak valid.');
      return;
  }

  // Konversi dari Celsius ke unit tujuan
  switch (toUnit) {
    case 'celsius':
      result = valueInCelsius;
      break;
    case 'fahrenheit':
      result = (valueInCelsius * 9 / 5) + 32;
      break;
    case 'kelvin':
      result = valueInCelsius + 273.15;
      break;
    case 'reamur':
      result = valueInCelsius * 4 / 5;
      break;
    default:
      print('Unit suhu tujuan tidak valid.');
      return;
  }

  print('-----------------------------------------');
  print('Hasil: $value° ${fromUnit.toUpperCase()} = ${result.toStringAsFixed(2)}° ${toUnit.toUpperCase()}');
  print('-----------------------------------------');
}