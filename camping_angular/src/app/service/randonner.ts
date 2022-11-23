import { utilisateur } from "../models/utilisateur.model";

export class randonner{
    id?: BigInteger;
    adress?: string;
    programme?: string;
    cercuit?: string;
    difficult?: string;
    date?:Date;
    imageUrl?:string;
    utilisateur?:any;
  }