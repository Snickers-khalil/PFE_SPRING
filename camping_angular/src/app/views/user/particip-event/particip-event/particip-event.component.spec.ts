import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParticipEventComponent } from './particip-event.component';

describe('ParticipEventComponent', () => {
  let component: ParticipEventComponent;
  let fixture: ComponentFixture<ParticipEventComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ParticipEventComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ParticipEventComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
