import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EncabezadoComponent } from './componentes/encabezado/encabezado.component';
import { AcercaComponent } from './componentes/acerca/acerca.component';
import { FooterComponent } from './componentes/footer/footer.component';
import { PortfolioComponent } from './componentes/portfolio/portfolio.component';
import { ExperienciaComponent } from './componentes/experiencia/experiencia.component';
import { AptitudesComponent } from './componentes/aptitudes/aptitudes.component';
import { MasInfoComponent } from './componentes/mas-info/mas-info.component';
import { HttpClientModule } from '@angular/common/http';
import { EducacionComponent } from './componentes/educacion/educacion.component';
import { EduExpWrapComponent } from './componentes/edu-exp-wrap/edu-exp-wrap.component';

@NgModule({
  declarations: [
    AppComponent,
    EncabezadoComponent,
    AcercaComponent,
    FooterComponent,
    PortfolioComponent,
    ExperienciaComponent,
    AptitudesComponent,
    MasInfoComponent,
    EducacionComponent,
    EduExpWrapComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
