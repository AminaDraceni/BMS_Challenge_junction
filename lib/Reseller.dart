import 'Bms.dart';
import 'Goodins.dart';
import 'Product.dart';
import 'ProductBms.dart';
import 'Statistiques.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Resseler {
  String name;
  String lastName;
  String phoneNumber;
  String location;
  Map<ProductBms, Statistiques> productsBMS;
  //Les produits de Bms vendu par ce reseller.
  Map<Product, Statistiques> productsCompititors; //Les autres produits
  var bddResselerDoc; //L'id de la collection que toute information concernant ce reseler est stockée dedant.

  Map<Goodins, int> goodins; //map represente les goodins et leurs quantitée.
  Resseler(this.name, this.lastName, this.phoneNumber, this.location) {
    //Constructeur.
    productsBMS = {};
    productsCompititors = {};
  }

  void ajouterProduitBms(ProductBms p) {
    //Methode utilisée dans la recolte des informations par l'agent responsable.
    var stat = Statistiques(2, 2, 2); //à changé (Mode graphique).
    productsBMS[p] = stat;
  }

  void supprimerProduitBms(ProductBms p) {
    productsBMS.remove(p);
  }

  void ajouterProduitCompetitor(Product p) {
    //Methode utilisée dans la recolte des informations par l'agent responsable.
    var stat = Statistiques(2, 2, 2); //à changé (Mode graphique).
    productsCompititors[p] = stat;
  }

  void supprimerProduiCompetitor(Product p) {
    productsCompititors.remove(p);
  }

  void modifier(
      /*-Modifier les informations d'un reseler,
      -Named argumets pour specifier ce qu'il veut modifier*/
      {String name,
      String lastName,
      String phoneNumber,
      String location}) {
    if (name != null) this.name = name;
    if (lastName != null) this.lastName = lastName;
    if (phoneNumber != null) this.phoneNumber = phoneNumber;
    if (location != null) this.location = location;
  }

  List filtrerAllProducts() {
    /*Pour eviter d'ajouter des produits deja existants à la base de donnée */
    var temp = List.from(Bms.produits);
    temp.forEach((element) {
      if (productsBMS.containsKey(element)) temp.remove(element);
    });
    return temp;
  }

  void ajouterProductBdd(ProductBms produit) {
    //Ajoute un produit à la Bdd
    bddResselerDoc.collection('BmsProducts').add({
      'nom': produit.nom,
      'categorie': produit.cat,
      'marque': produit.marque,
      'ref': produit.ref
    });

    void getProductsFromBdd() {
      /*Construire la map des <Produit,sesStatistiques> pour un reseler */
      bddResselerDoc
          .collection('Bmsproducts')
          .getDocuments()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((f) {
          productsBMS[ProductBms.mapToObjet(f.data)] = Statistiques.mapToObject(f.reference.collection('Statistiques'));
        });
      });
    }
  }

  int nombreDeGoodins() {
    //retourne le nombre de goodins envoyés par bms
    var somme = 0;
    goodins.forEach((key, value) {
      somme += value;
    });
    return somme;
  }

  int nombredeVenteBms() {
    /*retourne le nombre de ventes de tous les produits de Bms*/
    var somme = 0;
    productsBMS.forEach((key, value) {
      somme += value.nbVentes;
    });
    return somme;
  }
}
