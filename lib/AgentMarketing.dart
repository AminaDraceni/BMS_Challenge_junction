import 'Categorie.dart';
import 'Marque.dart';
import 'Product.dart';
import 'ProductBms.dart';
import 'Reseller.dart';
import 'Statistiques.dart';

class AgentMarketing {
  String id;
  String mail;
  String motDePasse;
  List<Resseler> resselers;

  //Les statistiques --------------------------------------------------
  var marqueStat = {
    Marque.Bms: 0,
    Marque.CHINT: 0,
    Marque.Energical: 0,
    Marque.LEGRAND: 0,
    Marque.MonoElectric: 0,
    Marque.Schneider: 0,
    Marque.autre: 0,
  };
  var disbonibiliteStats;
  var venteParQuantite;  //map de (produits: liste de 2 entiers)
  //-------------------------------------------------------------------
  AgentMarketing(this.id, this.mail, this.motDePasse);

  Map<Product, Statistiques> fusionner(List<Resseler> listMatch) {
    /*regroupe les statistiques de plusieurs reseler pour aider l'agent
    à construire son rapport*/
    var temp = {}; //Map
    listMatch.forEach((reseler) {
      reseler.productsBMS.forEach((key, value) {
        temp[key] = value.fusionner(temp[key]);
      });
    });
    return temp;
  }

  void calculerDisponibiliteStats(
      List<Resseler> listMatch, List<ProductBms> produitsBms) {
        /*Retourne les statistiques de la disponibilité des produits de Bms selectionnés 
        par l'agent ,pour une region ou un groupe de reselers specefiques */
    var nbr = 0,
        i = 0; // nbr pour le nombre de reselers qui vendent un produit , i pour indexer le tableau.
    disbonibiliteStats = List(
        produitsBms.length + 1); // Tableau de statistiques.(Produit + total)
    produitsBms.forEach((produitBms) {
      //Parcourir la liste des produits selectionnés par l'agent.
      //Pour chaque produit, on compte le nombre de reselers qui le vendent.
      listMatch.forEach((reseler) {
        if (reseler.productsBMS.containsKey(produitBms))
          nbr = nbr + 1; //S'il le vends ,on incremete le nombre.
      });
      disbonibiliteStats[i] =
          nbr; //Nous avons le nombre de resellers , on l'insere.
      i = i + 1;
      nbr = 0;
    });
    disbonibiliteStats[produitsBms.length] = resselers.length;
  }

  void calculermarqueStates(List<Resseler> listMatch, Categorie categorie) {
    /*-Retourne les statistiques du marché pour une categorie precise.
      -les entreprises qui dominent le marché pour un produit quelconque 
    */
    var temp = fusionner(listMatch);
    temp.forEach((key, value) {
      if (key.cat == categorie) {
        marqueStat[key.marque] +=  value.quantite;
      }
    });
  }

  void ventesQuantitesProduit(List<Resseler> listMatch,ProductBms produit){
    /*-retourne les statistique d'un produit (quantité par rapport au nombre de ventes)
      -taux de succés d'un produit*/
    var temp = fusionner(listMatch);
    temp.forEach((key, value) { 
      venteParQuantite[key] = [value.nbVentes,value.quantite];
    });
  }
}

void goodinsVentes(List<Resseler> listMatch){
  /*Construit une map de statistiques qui represente le nombre
  de ventes par rapport au goodins (publicité) pour chaque reseler*/
  var stats;
  listMatch.forEach((reseler) {
  stats[reseler] = [reseler.nombredeVenteBms(),reseler.nombredeVenteBms()];
  });
}
/*void getData() {
  databaseReference
      .collection("books")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });
}*/