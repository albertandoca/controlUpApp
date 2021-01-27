import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ResetLoginPage } from './reset-login.page';

const routes: Routes = [
  {
    path: '',
    component: ResetLoginPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ResetLoginPageRoutingModule {}
