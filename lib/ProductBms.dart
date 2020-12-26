import 'Categorie.dart';
import 'Marque.dart';
import 'Product.dart';

class ProductBms extends Product {
  String nom;
  String ref;

  ProductBms(this.nom, this.ref, Categorie cat) : super(Marque.Bms, cat);

  static ProductBms mapToObjet(var data) {
    /*- Convertir une map à un objet 
      - Utilisé dans la lecture de la base de donnée*/

    return ProductBms(data["nom"], data["ref"], data["categorie"]);
  }
}
