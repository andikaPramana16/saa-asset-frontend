import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saa_asset_management_frontend/core/theme.dart'; 

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGreen, 
      body: Row(
        children: [
          // ==========================================
          // 1. SIDEBAR KIRI
          // ==========================================
          Container(
            width: 250, // Lebar tetap sidebar
            decoration: const BoxDecoration(
              gradient: AppColors.sidebarGradient, // Memakai gradasi yang kita buat tadi
            ),
            child: Column(
              children: [
                const SizedBox(height: 40), // Jarak dari atas layar
                
                // LOGO & NAMA BRAND
                SvgPicture.asset(
                  'assets/icons/logo_saa.svg',
                  height: 48,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(height: 12),
                Text(
                  'SAA Asset Management', 
                  style: AppTextStyles.bodyBold.copyWith(color: Colors.white)
                ),
                const SizedBox(height: 40),

                // DAFTAR MENU
                _buildMenuItem(index: 0, title: 'Dasbor', iconPath: 'assets/icons/ic_dashboard.svg'),
                _buildMenuItem(index: 1, title: 'Daftar lahan', iconPath: 'assets/icons/ic_lahan.svg'),
                _buildMenuItem(index: 2, title: 'Tim Lapangan', iconPath: 'assets/icons/ic_tim.svg'),
                _buildMenuItem(index: 3, title: 'Mitra Bisnis', iconPath: 'assets/icons/ic_mitra.svg'),
                _buildMenuItem(index: 4, title: 'Laporan', iconPath: 'assets/icons/ic_laporan.svg'),
                
                // PUSH KE BAWAH: Spacer akan mendorong semua widget di bawahnya ke dasar layar
                const Spacer(), 
                
                // TOMBOL LOG OUT
                _buildMenuItem(index: 99, title: 'Log out', iconPath: 'assets/icons/ic_logout.svg', isLogout: true),
                const SizedBox(height: 32), // Jarak dari bawah layar
              ],
            ),
          ),

          // ==========================================
          // 2. KONTEN UTAMA KANAN
          // ==========================================
          Expanded(
            child: Center(
              child: Text('Konten Halaman $_selectedIndex', style: AppTextStyles.heading2),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // FUNGSI PEMBUAT TOMBOL MENU (REUSABLE)
  // ==========================================
  Widget _buildMenuItem({
    required int index, 
    required String title, 
    required String iconPath,
    bool isLogout = false,
  }) {
    bool isActive = _selectedIndex == index;

    return InkWell(
      onTap: () {
        if (!isLogout) {
          setState(() {
            _selectedIndex = index; // Ubah menu aktif jika di-klik
          });
        } else {
          // Logika jika tombol logout ditekan
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, bottom: 8), // Geser sedikit dari ujung kiri sidebar
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          // TRIK EFEK MENU AKTIF:
          // Jika aktif, background putih. Jika tidak, transparan.
          color: isActive ? AppColors.whiteGreen : Colors.transparent,
          // Lengkungkan HANYA sudut kiri atas dan kiri bawah
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Row(
          children: [
            // ICON MENU
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.darkgreen : Colors.white, // Ganti warna icon
                BlendMode.srcIn,
              ),
              width: 20,
            ),
            const SizedBox(width: 16), // Jarak icon ke teks
            
            // TEKS MENU
            Text(
              title,
              style: AppTextStyles.body.copyWith(
                color: isActive ? AppColors.darkgreen : Colors.white, // Ganti warna teks
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}