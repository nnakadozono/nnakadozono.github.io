---
layout: page
title: Angular
---


https://www.youtube.com/watch?v=xAT0lHYhHMY


## Installation and setup
`npm install -g @angular/cli`

`ng version`

`cd homes-app`
`npm install`
  * all needed depencies will be installed

`ng serve`

localhost:4200


## folder
* angular.json: configure the project. build configuration, i8z
* package.json: project dependencies
* tsconfig.json: TS settings
* src/
* src/app: this is the directory

## Components
* Compoenentsa
  * TS Component Class: Logic
  * HTML Template: View
  * CSS Style
* `ng generate component ComponentName --standalone --inline-template`
  * --standalone: stand alone component
  * --inline-template: less files us to manage
  * prefix (app-) will be used
* imports
  * import { MyComponent } from './mycomponent/mycomponent.component'
  * In @Component decorator, add `imports: [MyComponent]`
  * The imports property lets us list the dependencies for the component
* 

## Interface
*  `ng generate interface housingLocation`

## input properties
* Input from @angular/common
* import {HousingLocation} from ''
* @Input() housingLocation!:HousingLocation;
* !: non-null assertion parameter

## Property binding
* [attribute] ([src])
* the value in quotes should be an actual property from the component 
* {% raw %}{{}}{% endraw %}: Aungular interpolation syntax

## ngFor directive
* Iterating over data
  * *ngFor="let housingLocation of housingLocationList"

## pass data
* [housingLocation]="housingLocation"

## Routing
* navigating between components
* Angular Router
* main.ts
* `import { provideRouter } from @angular/router`
  * bootstrapApplication(AppComponent, {
    providers: [
      providerRouter([])
    ]
  })
* routes.ts
  * import { Routes } from '@angular/router'
  * import { HomeComponent } from ''  * 




