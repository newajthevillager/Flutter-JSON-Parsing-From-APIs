class SwapiEndPoints {
  String people;
  String planets;
  String films;
  String species;
  String vehicles;
  String starships;

  SwapiEndPoints(
      {this.people,
      this.planets,
      this.films,
      this.species,
      this.vehicles,
      this.starships});

  SwapiEndPoints.fromJson(Map<String, dynamic> json) {
    people = json['people'];
    planets = json['planets'];
    films = json['films'];
    species = json['species'];
    vehicles = json['vehicles'];
    starships = json['starships'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['people'] = this.people;
    data['planets'] = this.planets;
    data['films'] = this.films;
    data['species'] = this.species;
    data['vehicles'] = this.vehicles;
    data['starships'] = this.starships;
    return data;
  }
}