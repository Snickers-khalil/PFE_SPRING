import { TestBed } from '@angular/core/testing';

import { ParticipeCrudService } from './participe-crud.service';

describe('ParticipeCrudService', () => {
  let service: ParticipeCrudService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ParticipeCrudService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
