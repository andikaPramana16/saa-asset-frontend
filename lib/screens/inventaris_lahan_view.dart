import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class MitraBisnisView extends StatelessWidget {
  MitraBisnisView({super.key});

  final List<Map<String, dynamic>> dummyMitraData = [
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
    {
      'nama_investor': 'PT Sinar Abadi',
      'total_investasi': 'Rp 8.750.000.000',
      'total_lahan': '5',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok C - Kediri',
          'nominal_investasi': 'Rp 8.750.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokC.pdf',
        }
      ]
    },
    {
      'nama_investor': 'CV Maju Bersama',
      'total_investasi': 'Rp 4.200.000.000',
      'total_lahan': '2',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [] 
    },
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
    {
      'nama_investor': 'PT Agro Nusantara',
      'total_investasi': 'Rp 1.200.000.000',
      'total_lahan': '3',
      'status_kontrak': 'Berjalan',
      'detail_lahan': [
        {
          'nama_lahan': 'Blok A - Malang',
          'nominal_investasi': 'Rp 500.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokA.pdf',
        },
        {
          'nama_lahan': 'Blok B - Jombang',
          'nominal_investasi': 'Rp 700.000.000',
          'status_kontrak': 'Berjalan',
          'dokumen_mou': 'MoU_BlokB.pdf',
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen, 
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterButtonGroup(),

          SizedBox(height: 16,),
        
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text('Nama Investor', style: AppTextStyles.bodyBold.copyWith(fontSize: 14),)),
                Expanded(flex: 2, child: Text('Total Investasi', style: AppTextStyles.bodyBold.copyWith(fontSize: 14),)),
                Expanded(flex: 1, child: Text('Total Lahan', style: AppTextStyles.bodyBold.copyWith(fontSize: 14),)),
                Expanded(flex: 2, child: Text('Status Kontrak', style: AppTextStyles.bodyBold.copyWith(fontSize: 14),)),
                const SizedBox(width: 24), 
              ],
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: dummyMitraData.length,
              itemBuilder: (context, index) {
                final data = dummyMitraData[index];
                return ExpandableMitraRow(data: data);
              },
            ),
          ),
        ],
      ),
    );
  }

}


class ExpandableMitraRow extends StatefulWidget {
  final Map<String, dynamic> data;

  const ExpandableMitraRow({super.key, required this.data});

  @override
  State<ExpandableMitraRow> createState() => _ExpandableMitraRowState();
}

class _ExpandableMitraRowState extends State<ExpandableMitraRow> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> detailLahan = widget.data['detail_lahan'] ?? [];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          left: BorderSide(color: Colors.grey.shade300),
          right: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text(widget.data['nama_investor'], style: AppTextStyles.body.copyWith(fontSize: 14),)),
                  Expanded(flex: 2, child: Text(widget.data['total_investasi'], style: AppTextStyles.body.copyWith(fontSize: 14),)),
                  Expanded(flex: 1, child: Text(widget.data['total_lahan'], style: AppTextStyles.body.copyWith(fontSize: 14),)),
                  Expanded(flex: 2, child: Text(widget.data['status_kontrak'], style: AppTextStyles.body.copyWith(fontSize: 14),)),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ),

          if (_isExpanded && detailLahan.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF), 
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300
                )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 2, child: Text('Nama Lahan')),
                      Expanded(flex: 2, child: Text('Nominal Investasi')),
                      Expanded(flex: 2, child: Text('Status Kontrak')),
                      Expanded(flex: 2, child: Text('Dokumen MoU')),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(height: 1, color: Colors.black12),
                  ),
                  
                  ...detailLahan.map((detail) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: Text(detail['nama_lahan'])),
                          Expanded(flex: 2, child: Text(detail['nominal_investasi'])),
                          Expanded(flex: 2, child: Text(detail['status_kontrak'])),
                          Expanded(flex: 2, child: Text(detail['dokumen_mou'])),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            
          if (_isExpanded && detailLahan.isEmpty)
             const Padding(
               padding: EdgeInsets.only(bottom: 24.0),
               child: Text('Belum ada detail lahan untuk mitra ini.', style: TextStyle(color: Colors.grey)),
             )
        ],
      ),
    );
  }

}

class FilterButtonGroup extends StatefulWidget {
  const FilterButtonGroup({super.key});

  @override
  State<FilterButtonGroup> createState() => _FilterButtonGroupState();
}

class _FilterButtonGroupState extends State<FilterButtonGroup> {
  int _selectedIndex = 0;
  final List<String> _filters = ['Semua', 'Berjalan', 'Selesai'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_filters.length, (index) {
          final isActive = _selectedIndex == index;
          return InkWell(
            onTap: () => setState(() => _selectedIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? AppColors.darkgreen : Colors.transparent, 
                borderRadius: BorderRadius.horizontal(
                  left: index == 0 ? const Radius.circular(7) : Radius.zero,
                  right: index == _filters.length - 1 ? const Radius.circular(7) : Radius.zero,
                ),
                border: index != _filters.length - 1
                    ? Border(right: BorderSide(color: Colors.grey.shade400))
                    : null,
              ),
              child: Text(
                _filters[index],
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade600,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}