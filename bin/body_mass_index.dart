import 'dart:io';

void main() {
  // --- PROGRAM KALKULATOR BMI SEDERHANA ---

  // Menampilkan judul program
  print('--- Kalkulator Body Mass Index (BMI) ---');

  // Meminta input berat badan dari pengguna
  stdout.write('Masukkan berat badan Anda (kg): ');
  // Membaca input, mengubahnya menjadi tipe data double
  // Menggunakan double.tryParse untuk menghindari error jika input bukan angka
  double? weight = double.tryParse(stdin.readLineSync() ?? '');

  // Meminta input tinggi badan dari pengguna (dalam cm)
  stdout.write('Masukkan tinggi badan Anda (cm): ');
  // Membaca input dan mengubahnya menjadi tipe data double
  double? heightCm = double.tryParse(stdin.readLineSync() ?? '');

  // Memvalidasi input untuk memastikan tidak null (kosong) dan lebih dari 0
  if (weight != null && heightCm != null && weight > 0 && heightCm > 0) {
    // Mengonversi tinggi dari cm ke meter
    double height = heightCm / 100;

    // Menghitung BMI dengan rumus: berat / (tinggi * tinggi)
    double bmi = weight / (height * height);

    // Menampilkan hasil BMI dengan format 2 angka di belakang koma
    print('\nBMI Anda adalah: ${bmi.toStringAsFixed(2)}');
    
    // Memberikan kategori berdasarkan nilai BMI
    if (bmi < 18.5) {
      print('Kategori: Berat badan kurang');
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      print('Kategori: Berat badan ideal');
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      print('Kategori: Berat badan berlebih');
    } else {
      print('Kategori: Obesitas');
    }

  } else {
    // Pesan error jika input tidak valid
    print('\nInput tidak valid. Harap masukkan angka yang benar untuk berat dan tinggi.');
  }
}
