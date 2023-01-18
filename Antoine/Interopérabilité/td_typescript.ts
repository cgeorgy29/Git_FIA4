class Ville {
    public nom: string;
    public rating: Number;
    constructor(nom: string, rating: number) {
        this.nom = nom;
        this.rating = rating;
    }

    affstars() : string {
        let res = ""
        for(let i=0; i<this.rating;i++) {
            res += "*"
        }
        return res
    }

}

let villes : Ville[] = [
    new Ville("Castres", 4), 
    new Ville("Albi", 2),
    new Ville("Mazamet", 1)];

for(let v of villes) {
    if(v.rating > 2) console.log(v.nom)
}

villes.filter(v => v.rating > 2).forEach(v => v.nom)

let villesavecstars : { nom: string, stars: string}[] = villes.map(v => ({nom: v.nom, stars: v.affstars()}))
