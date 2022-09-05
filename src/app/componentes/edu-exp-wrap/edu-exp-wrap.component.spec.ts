import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EduExpWrapComponent } from './edu-exp-wrap.component';

describe('EduExpWrapComponent', () => {
  let component: EduExpWrapComponent;
  let fixture: ComponentFixture<EduExpWrapComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EduExpWrapComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EduExpWrapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
