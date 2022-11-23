import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetaillShopComponent } from './detaill-shop.component';

describe('DetaillShopComponent', () => {
  let component: DetaillShopComponent;
  let fixture: ComponentFixture<DetaillShopComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetaillShopComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetaillShopComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
