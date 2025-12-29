import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:solucao/pages/mapa_view_controller.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  late final MapaViewController mapaViewController;
  late final MapController mapController = MapController();
  List<Marker> markers = [];

  @override
  void initState() {
    mapaViewController = context.read<MapaViewController>();
    mapaViewController.fetchPosicaoDosVeiculos().whenComplete(initMarkers);
    super.initState();
  }

  void initMarkers(){
    markers = mapaViewController.posicaoVeiculos.map((veiculo) {
      return Marker(
        point: LatLng(veiculo.latitude, veiculo.longitude),
        width: 30,
        height: 30,
        child: Icon(Icons.directions_bus, color: Colors.blue, size: 30,),
      
      );
    }).toList();
    setState(() {});
  }

  final LatLngBounds saoPauloBounds = LatLngBounds(
    const LatLng(-24.008814, -46.825514), // Sudoeste
    const LatLng(-23.356792, -46.365084), // Nordeste
  );

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
    options: MapOptions(
      initialCenter: LatLng(-23.55, -46.64), // Center the map over London, UK
      cameraConstraint: CameraConstraint.contain(bounds: saoPauloBounds),
      initialZoom: 17,
      minZoom: 10,
      ),
    children: [
      TileLayer( // Bring your own tiles
        urlTemplate: 'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=sBfsps2YL0OAbc9Z0RjO', // For demonstration only
        userAgentPackageName: 'com.example.solucao', // Add your app identifier
      ),
     Builder(
       builder: (context) {
         return RepaintBoundary(
           child: MarkerClusterLayer(
                  mapCamera: MapCamera.of(context),
                  mapController: mapController,
                  options: MarkerClusterLayerOptions(
                    maxClusterRadius: 120,
                    disableClusteringAtZoom: 18,
                    size: const Size(40, 40),
                    markers: markers,
                    builder: (context, cluster) {
                      return CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                        child: Text(
                          cluster.length.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
         );
       }
     )
    ],
  );
  }
}