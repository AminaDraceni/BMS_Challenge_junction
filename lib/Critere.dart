import 'ProductBms.dart';

abstract class Critere {
  /*-Interface
    -Les criteres utilisés dans la recherche filtrée 
    -chaque clsse implementant cet interface represente un critère*/

  List<ProductBms> filtrer(List<ProductBms> produits);
}
