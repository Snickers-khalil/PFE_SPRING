import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AllAnnonceComponent } from './all-annonce.component';

describe('AllAnnonceComponent', () => {
  let component: AllAnnonceComponent;
  let fixture: ComponentFixture<AllAnnonceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AllAnnonceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AllAnnonceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
