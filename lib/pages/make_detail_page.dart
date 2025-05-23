import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/make_model.dart';
import '../provider/vehicle_provider.dart';
import '../model/model_model.dart';
import '../widgets/custom_detail_image.dart';

class MakeDetailPage extends StatefulWidget {
  const MakeDetailPage({super.key});
  static const routeName = '/make-detail';

  @override
  State<MakeDetailPage> createState() => _MakeDetailPageState();
}

class _MakeDetailPageState extends State<MakeDetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final make = ModalRoute.of(context)!.settings.arguments as VehicleMake;
    Provider.of<VehicleProvider>(context, listen: false)
        .fetchModels(make.makeName);
  }

  @override
  Widget build(BuildContext context) {
    final make = ModalRoute.of(context)!.settings.arguments as VehicleMake;

    return Scaffold(
      appBar: AppBar(title: Text(make.makeName)),
      body: Consumer<VehicleProvider>(
        builder: (_, prov, __) {
          if (prov.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<VehicleModel> models = prov.models;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomDetailImage(imagePath: make.image),
              Expanded(
                child: models.isEmpty
                    ? const Center(child: Text('No models found'))
                    : ListView.builder(
                        itemCount: models.length,
                        itemBuilder: (_, i) {
                          final m = models[i];
                          return ListTile(
                            title: Text(m.modelName),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
