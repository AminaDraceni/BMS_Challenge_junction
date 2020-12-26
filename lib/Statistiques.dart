class Statistiques {
  int quantite;
  int nbVentes;
  int nbClients;

  Statistiques(this.quantite, this.nbVentes, this.nbClients);

  Statistiques fusionner(Statistiques s2) {
    //Fusionne les statistiques de 2 produis
    if (s2 != null) {
      return Statistiques(quantite + s2.quantite, nbVentes + s2.nbVentes,
          nbClients + s2.nbClients);
    }
    return this;
  }

  static Statistiques mapToObject(var data) {
    //from a map to an object
    return Statistiques(data["quantite"], data["nbVentes"], data["nbClient"]);
  }
}
