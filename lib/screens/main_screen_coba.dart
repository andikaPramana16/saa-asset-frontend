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
    Set<String> _expandedMenus = {};

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
    Widget _addExpandedMenuItem({
    required int index,
    required String title,
    required String iconPath,
    required List<Map<String, dynamic>> subMenus,
  }) {
    bool isExpanded = _expandedMenus.contains(title);

    // Menu utama akan menyala (aktif) JIKA menu utama diklik atau salah satu sub-menunya sedang diklik
    bool isActive = _selectedIndex == index || subMenus.any((menu) => menu['index'] == _selectedIndex);


    return Column(
      children: [
        // 1. BAGIAN PARENT (Tombol Utama)
        InkWell(
          onTap: () {
            setState(() {
            _selectedIndex = index;
            });
            setState(() {
              // Jika sudah terbuka, maka tutup (hapus dari daftar). Jika tertutup, buka (tambahkan ke daftar).
              if (isExpanded) {
                _expandedMenus.remove(title);
              } else {
                _expandedMenus.add(title);
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.only(left: 24, bottom: 8),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
              color: isActive ? AppColors.whiteGreen : Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(
                    isActive ? AppColors.darkgreen : Colors.white,
                    BlendMode.srcIn,
                  ),
                  width: 20,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    color: isActive ? AppColors.darkgreen : Colors.white,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: isActive ? AppColors.darkgreen : Colors.white,
                ),
              ],
            ),
          ),
        ),

        // 2. BAGIAN SUB-MENU (Melakukan looping otomatis dari data subMenus)
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 4, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Mengubah data List<Map> menjadi deretan Widget
              children: subMenus.map((subMenu) {
                return _addSubMenuItem(
                  index: subMenu['index'],
                  title: subMenu['title'],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _addSubMenuItem({required int index, required String title}) {
    bool isSubActive = _selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Ubah konten layar sesuai submenu
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: AppTextStyles.body.copyWith(
            // Teks putih tebal jika aktif, putih agak transparan jika tidak
            color: isSubActive ? Colors.white : Colors.white70,
            fontWeight: isSubActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}