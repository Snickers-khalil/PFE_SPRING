import { TestBed } from '@angular/core/testing';

import { EvCrudService } from './ev-crud.service';

describe('EvCrudService', () => {
  let service: EvCrudService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(EvCrudService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
