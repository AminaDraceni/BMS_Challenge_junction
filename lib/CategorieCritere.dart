import 'Categorie.dart';
import 'Critere.dart';
import 'ProductBms.dart';

class Categoriecritere implements Critere {
  //Recherche par categorie
  Categorie categorie;

  Categoriecritere(this.categorie);

  List<ProductBms> filtrer(List<ProductBms> produits) {
    produits.map((e) {
      if (e.cat != categorie) produits.remove(e);
    });
    return produits;
  }
}
