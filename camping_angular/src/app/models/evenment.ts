import { utilisateur } from "./utilisateur.model";

export class evenment{
    id?: BigInteger;
    title?: string;
    description?: string;
    debut_event?: Date;
    fin_event?: Date;
     imageUrl?:string;
     utilisateur?:any;
  }