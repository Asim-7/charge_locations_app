import 'package:charge_locations_app/presentation/screens/chargers_screen.dart';
import 'package:charge_locations_app/presentation/widgets/detail/connector_item.dart';
import 'package:flutter/material.dart';

// Widget for the list of connectors
class ConnectorList extends StatelessWidget {
  final List<Connector> connectors;
  const ConnectorList({super.key, required this.connectors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: connectors.length,
        itemBuilder: (context, index) {
          return ConnectorItem(connector: connectors[index]);
        },
      ),
    );
  }
}
