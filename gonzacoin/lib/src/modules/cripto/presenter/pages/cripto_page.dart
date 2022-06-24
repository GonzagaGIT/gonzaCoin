import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gonzacoin/src/modules/cripto/presenter/cubits/cripto_cubit.dart';

import '../widgets/cripto_card.dart';

class CriptoPage extends StatelessWidget {
  const CriptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto'),
      ),
      backgroundColor: Colors.grey[200],
      body: BlocProvider(
        create: (context) => GetIt.I.get<CriptoCubit>()..fetchCriptos(),
        child: BlocBuilder<CriptoCubit, CriptoState>(
         
          builder: (context, state) {
             if (state is LoadingCriptoState) {
              child = const Center(child: CircularProgressIndicator());
            }

            if (state is ErrorCriptoState) {
              child = Center(
                child: Text(state.message),
              );
            }

            if (state is SuccessCriptoState) {
              child = ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 30),
                itemCount: 20,
                itemBuilder: (context, index) {
                  final cripto = state.criptos[index];
                  return CriptoCard(
                    criptoEntity: cripto,
                  );
                },
              );
            }
            return child;
          } ,
        ),
      ),
    );
  }
}
