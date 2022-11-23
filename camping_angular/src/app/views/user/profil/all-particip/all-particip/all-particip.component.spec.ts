import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AllParticipComponent } from './all-particip.component';

describe('AllParticipComponent', () => {
  let component: AllParticipComponent;
  let fixture: ComponentFixture<AllParticipComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AllParticipComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AllParticipComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
