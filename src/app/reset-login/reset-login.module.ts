import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { ResetLoginPageRoutingModule } from './reset-login-routing.module';

import { ResetLoginPage } from './reset-login.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ResetLoginPageRoutingModule
  ],
  declarations: [ResetLoginPage]
})
export class ResetLoginPageModule {}
