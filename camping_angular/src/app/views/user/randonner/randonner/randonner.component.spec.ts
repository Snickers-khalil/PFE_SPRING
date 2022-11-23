import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RandonnerComponent } from './randonner.component';

describe('RandonnerComponent', () => {
  let component: RandonnerComponent;
  let fixture: ComponentFixture<RandonnerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RandonnerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RandonnerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
