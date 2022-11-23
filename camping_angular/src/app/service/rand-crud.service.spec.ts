import { TestBed } from '@angular/core/testing';

import { RandCrudService } from './rand-crud.service';

describe('RandCrudService', () => {
  let service: RandCrudService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RandCrudService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
