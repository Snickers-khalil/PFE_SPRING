import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/service/token-storage.service';

@Component({
  selector: 'app-userlayout',
  templateUrl: './userlayout.component.html',
  styleUrls: ['./userlayout.component.css']
})
export class UserlayoutComponent implements OnInit {

  title(title: any) {
    throw new Error('Method not implemented.');
  }
  private roles : string[] = [];
  isLoggedIn = false;
  showAdminBoard = false;
  showRandonneurBoard = false;
  username!: string;
  email!: string;
  imageUrl!:string;
  constructor(private tokenStorageService: TokenStorageService , private route:Router) { }

  ngOnInit(): void {
    this.isLoggedIn = !!this.tokenStorageService.getToken();
    if (this.isLoggedIn) {
      const user = this.tokenStorageService.getUser();
      this.roles = user.roles;
      this.showAdminBoard = this.roles.includes('ADMIN');
      this.showRandonneurBoard = this.roles.includes('RANDONNEUR');
      this.username = user.username;
      this.email = user.email;
      this.imageUrl = user.imageUrl;
    }
  }
  opendiag(){
    this.route.navigate(['/chat']);
  }
  logout(): void {
    this.tokenStorageService.signOut();
    window.location.reload();
    this.route.navigate(['/login']);
  }
}

