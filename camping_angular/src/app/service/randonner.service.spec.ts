import { TestBed } from '@angular/core/testing';

import { RandonnerService } from './randonner.service';

describe('RandonnerService', () => {
  let service: RandonnerService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RandonnerService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
