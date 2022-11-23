import { utilisateur } from "./utilisateur.model";


export class Annonce {
  id?: any ;
  titre?: string;
  description?: string;
  adresse?: string;
  phone?: string;
  prix?:Float32Array;
  date_ajout?:Date;
  categorie?:string;
  imageUrl?:string;
  utilisateur?:any;
}