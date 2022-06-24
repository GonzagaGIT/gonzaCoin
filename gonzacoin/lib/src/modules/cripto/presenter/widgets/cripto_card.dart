
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gonzacoin/src/modules/cripto/domain/entities/cripto_entity.dart';

import '../cubits/cripto_cubit.dart';

class CriptoCard extends StatelessWidget {
  final CriptoEntity criptoEntity;
  const CriptoCard({Key? key, required this.criptoEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.network(criptoEntity.assetCripto.url, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 20),
                Text(criptoEntity.name),
              ],
            ),
            Text(BlocProvider.of<CriptoCubit>(context).convertCurrency(criptoEntity.price).toString()),
            const SizedBox(height: 8),
           
          ],
        ),
      ),
    );
  }
}