import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParticipRandComponent } from './particip-rand.component';

describe('ParticipRandComponent', () => {
  let component: ParticipRandComponent;
  let fixture: ComponentFixture<ParticipRandComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParticipRandComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParticipRandComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
