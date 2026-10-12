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
          Container(
            width: 250, 
            decoration: const BoxDecoration(
              gradient: AppColors.sidebarGradient,
              border: Border(
                right: BorderSide(
                  color: AppColors.whiteGreen,
                  width: 2.0,
                )
              )
            ),
            child: Column(
              children: [
                const SizedBox(height: 40), 
                
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

               _addMenuItem(index: 0, title: "Dasbor", iconPath: 'assets/icons/ic_dashboard.svg'),
               _addMenuItem(index: 1, title: "Daftar Lahan", iconPath: 'assets/icons/ic_lahan.svg'),                
                const Spacer(), 

                const SizedBox(height: 32), 
              ],
            ),
          ),

          Expanded(
            child: Center(
              child: Text('Konten', style: AppTextStyles.heading2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addMenuItem({
    required int index, 
    required String title, 
    required String iconPath,
    bool isLogout = false, 
  }){
    bool isActive = _selectedIndex == index;

    return InkWell(
      onTap: () {
        if (!isLogout) {
          setState(() {
            _selectedIndex = index;
          });
        } else {
          
        }
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