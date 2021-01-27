import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { ResetLoginPage } from './reset-login.page';

describe('ResetLoginPage', () => {
  let component: ResetLoginPage;
  let fixture: ComponentFixture<ResetLoginPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ResetLoginPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(ResetLoginPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
