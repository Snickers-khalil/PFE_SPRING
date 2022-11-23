import { roles } from "./roles.modul";

export class utilisateur {
  id?: any;
  firstname?: string;
  lastname?: string;
  username?: string;
  email?: string;
  password?:string;
  city?:string;
  phone?: string;
  roles?: roles[];
  imageUrl?:string;
}
