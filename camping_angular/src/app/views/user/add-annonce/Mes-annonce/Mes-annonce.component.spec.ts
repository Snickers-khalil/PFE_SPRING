import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MesAnnonceComponent } from './Mes-annonce.component';

describe('AddAnnonceComponent', () => {
  let component: MesAnnonceComponent;
  let fixture: ComponentFixture<MesAnnonceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MesAnnonceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MesAnnonceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
