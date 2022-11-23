import { TestBed } from '@angular/core/testing';

import { GuardsadminGuard } from './guardsadmin.guard';

describe('GuardsadminGuard', () => {
  let guard: GuardsadminGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(GuardsadminGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
