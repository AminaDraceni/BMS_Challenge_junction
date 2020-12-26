import 'AgentMarketing.dart';
import 'Critere.dart';
import 'ProductBms.dart';
import 'Reseller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Bms {
  static List<ProductBms> produits;
  List<Resseler> resellers;
  List<AgentMarketing> agents;

  List<ProductBms> recherche(List<Critere> criteres) {
    /*La recherche selon des criteres*/

    var allProducts = produits;
    //La liste des produits ,on commence à la filtrer selon la liste des criteres specifiés
    criteres.map((e) {
      allProducts = e.filtrer(allProducts);
      // chaque critere e ,filtre la liste à ça methode.
    });
    return allProducts;
  }

  //appel obligatoire dans le main.
  void remplirAllProductsBDD(var bddAllProductCollection) {
    // Methode qui initialise la liste des produits de Bms
    bddAllProductCollection.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        Bms.produits.add(ProductBms.mapToObjet(f.data));
      });
    });
  }
}
