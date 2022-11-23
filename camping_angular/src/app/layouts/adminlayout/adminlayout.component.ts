import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/service/token-storage.service';

@Component({
  selector: 'app-adminlayout',
  templateUrl: './adminlayout.component.html',
  styleUrls: ['./adminlayout.component.css']
})
export class AdminlayoutComponent implements OnInit {

  title(title: any) {
    throw new Error('Method not implemented.');
  }
  
  private roles : string[] = [];
  isLoggedIn = false;
  showAdminBoard = false;
  showModeratorBoard = false;
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
      this.username = user.username;
      this.email = user.email;
      this.imageUrl=user.imageUrl;

    }
  }

  logout(): void {
    this.tokenStorageService.signOut();
    window.location.reload();
    this.route.navigate(['/login']);
  }
}

