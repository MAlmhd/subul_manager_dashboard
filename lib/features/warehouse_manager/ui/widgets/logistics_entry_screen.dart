
import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/title_of_columns_receive_shipments.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/shipments_info_card.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/upload_number_image_and_name_of_driver_shipment.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/volumetric_weight_calculation.dart';

class LogisticsEntryScreen extends StatelessWidget {
  const LogisticsEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: size.height / 5),
        TitleOfColumnsReceiveShipments(),
        SizedBox(height: size.height / 20),
        ShipmentInfoCard(),
        SizedBox(height: size.height / 30),
        Row(
          children: [
            UploadNumberImageAndNameOfDriverShipment(),
            SizedBox(width: size.width / 60),
            VolumetricWeightCalculation(showBluryBackground: false),
          ],
        ),
      ],
    );
  }
}
