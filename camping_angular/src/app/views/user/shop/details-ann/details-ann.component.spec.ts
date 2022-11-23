import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailsAnnComponent } from './details-ann.component';

describe('DetailsAnnComponent', () => {
  let component: DetailsAnnComponent;
  let fixture: ComponentFixture<DetailsAnnComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetailsAnnComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailsAnnComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
