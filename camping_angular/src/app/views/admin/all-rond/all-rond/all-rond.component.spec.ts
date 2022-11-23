import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AllRondComponent } from './all-rond.component';

describe('AllRondComponent', () => {
  let component: AllRondComponent;
  let fixture: ComponentFixture<AllRondComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AllRondComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AllRondComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
