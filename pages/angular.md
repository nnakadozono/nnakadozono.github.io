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




## モジュールとスタンドアローン
Angular には、**従来のモジュールベース (`NgModule`)** と **新しいスタンドアロン (`Standalone Components`)** の2つのアプローチがある。最新のAngularでは **スタンドアロンがデフォルト** になっている。

| **モジュールベース** | **スタンドアロン** |
|---------------------|---------------------|
| `app.module.ts` で管理 | `app.config.ts` で管理 |
| `RouterModule.forRoot(routes)` を使う | `provideRouter(routes)` を使う |
| `HttpClientModule` を `imports` に追加 | `provideHttpClient()` を使う |
| `bootstrapModule(AppModule)` | `bootstrapApplication(AppComponent, appConfig)` |



**1. `app.config.ts` に設定を追加**

### **`src/app/app.config.ts`**
```typescript
import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient()
  ]
};
```

**2. `app.routes.ts` を作成してルーティングを管理**

### **`src/app/app.routes.ts`**
```typescript
import { Routes } from '@angular/router';
import { HelloComponent } from './hello/hello.component';

export const routes: Routes = [
  { path: 'hello', component: HelloComponent },
  { path: '', redirectTo: '/hello', pathMatch: 'full' }
];
```

**3. `app.component.ts` で `bootstrapApplication` を使用**
モジュールの代わりに `bootstrapApplication` を使ってアプリを起動する。

### **`src/main.ts`**
```typescript
import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import { appConfig } from './app/app.config';

bootstrapApplication(AppComponent, appConfig)
  .catch(err => console.error(err));
```

## **`HttpClient` を使う場合**
以前は `HttpClientModule` を `app.module.ts` に追加していたが、**スタンドアロンでは `provideHttpClient()` を `app.config.ts` に入れる** ことで対応できる。



## **1. モジュール (`NgModule`) とは？**
モジュールベースの Angular アプリでは、**すべてのコンポーネント・サービス・ルーティングは `NgModule` に登録** されます。

### **📌 モジュールの特徴**
- `app.module.ts` を使う。
- `imports`, `declarations`, `providers` などで設定。
- `@NgModule()` デコレーターを使用。
- **全てのコンポーネント・サービスがモジュールに依存する。**

### **🔹 モジュールベースの `app.module.ts`**
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HelloComponent } from './hello/hello.component';

@NgModule({
  declarations: [
    AppComponent,
    HelloComponent // すべてのコンポーネントをここに登録
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent] // アプリのエントリーポイント
})
export class AppModule { }
```

---

## **2. スタンドアロン (`Standalone Components`) とは？**
Angular 18 では、**モジュールを不要にする** 新しいアプローチ `Standalone Components` が導入され、デフォルトになりました。

### **📌 スタンドアロンの特徴**
- `app.module.ts` が **不要** になる。
- コンポーネントごとに `standalone: true` を指定する。
- **コンポーネントが独立して動作できる**。
- ルーティングや `HttpClient` の設定は `app.config.ts` で管理。

---

### **🔹 スタンドアロンの `HelloComponent`**
```typescript
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-hello',
  standalone: true, // ここがポイント！
  imports: [CommonModule], // 必要なモジュールを直接インポート
  templateUrl: './hello.component.html',
  styleUrls: ['./hello.component.css']
})
export class HelloComponent {
  message: string = '';

  constructor(private http: HttpClient) {}

  fetchHello() {
    this.http.get<{ message: string }>('http://localhost:8000/api/hello')
      .subscribe(response => {
        this.message = response.message;
      });
  }
}
```
👉 `standalone: true` を設定すると、モジュールに登録しなくてもコンポーネントが使えます！

---

### **🔹 `app.config.ts`（スタンドアロン版の設定）**
```typescript
import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient()
  ]
};
```
👉 これが **`app.module.ts` の代わり** になります。

---

### **🔹 `main.ts`（スタンドアロン版の起動）**
```typescript
import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import { appConfig } from './app/app.config';

bootstrapApplication(AppComponent, appConfig)
  .catch(err => console.error(err));
```
👉 これが **`bootstrapModule(AppModule)` の代わり** になります。





## **4. スタンドアロン (`Standalone Components`) のメリット**
✅ **モジュールの管理が不要 → シンプルな構造になる。**  
✅ **各コンポーネントが独立できる → 再利用しやすい。**  
✅ **不要なモジュールの依存関係を削減 → パフォーマンスが向上。**  
✅ **Angular 18 でデフォルト → 将来のアップデートに適応しやすい。**



===
### **モジュール (`NgModule`) を理解する**
Angular では、コンポーネントやサービスを **まとめて管理する単位** として「モジュール (`NgModule`)」があります。

---

## **1. なぜモジュール (`NgModule`) が必要だったのか？**
Angular は **大規模なアプリ開発を前提** としているため、コンポーネントやサービスが増えてくると、**どこでどの機能が使われているかを整理する必要がある**。

そのために、**`NgModule` という仕組みでコンポーネントやサービスをグループ化** していた。

---

## **2. `NgModule` を使った従来の方法**
従来の Angular では、すべてのコンポーネントは **`NgModule` に登録** しないと使えなかった。

### **🔹 `app.module.ts` の例**
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { HelloComponent } from './hello/hello.component';

@NgModule({
  declarations: [ // ここにコンポーネントを登録しないと使えない
    AppComponent,
    HelloComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent] // アプリを起動するメインコンポーネント
})
export class AppModule { }
```

### **📌 モジュール (`NgModule`) の特徴**
- **コンポーネントは `NgModule` に登録しないと使えない。**
- **1つの `NgModule` にすべてをまとめると、大規模アプリでは管理が大変になる。**
- **機能ごとにモジュールを分ける (`feature.module.ts`) ことで整理することも可能。**

---

## **3. スタンドアロン (`Standalone Components`) との違い**
Angular 18 では **`NgModule` が不要** になり、各コンポーネントが **独立して動作** できるようになった。

**🔹 スタンドアロンの `HelloComponent`**
```typescript
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-hello',
  standalone: true, // ← これを設定すればモジュールが不要！
  imports: [CommonModule], // ← 必要なモジュールをここに直接書ける
  templateUrl: './hello.component.html',
  styleUrls: ['./hello.component.css']
})
export class HelloComponent {
  message: string = '';

  constructor(private http: HttpClient) {}

  fetchHello() {
    this.http.get<{ message: string }>('http://localhost:8000/api/hello')
      .subscribe(response => {
        this.message = response.message;
      });
  }
}
```

---

## **4. 「各コンポーネントが独立できる → 再利用しやすい」とは？**
従来の `NgModule` では、**コンポーネントを使うたびに `NgModule` に登録しないといけなかった**。  
しかし、**スタンドアロンなら、どこでもすぐに使える！**

---

### **📌 `NgModule` だと再利用が大変**
例えば、`HelloComponent` を **別のプロジェクトで使いたい** とする。

1. **`hello.component.ts` をコピー**
2. **新しいプロジェクトの `app.module.ts` に登録**
3. **新しいプロジェクトの `imports` に `HttpClientModule` を追加**

👉 **`NgModule` に毎回登録する手間がかかる。**

---

### **📌 スタンドアロンなら簡単**
スタンドアロンなら、**どこでもすぐに使える**。

```typescript
import { HelloComponent } from './hello/hello.component';
```
👉 これだけでOK！  
👉 **モジュールに登録する必要がないので、すぐに再利用できる！**

---

## **5. なぜスタンドアロンが便利なのか？**
✅ **コンポーネントが「モジュール」に依存しない**  
👉 どこでも **そのまま使える**（再利用が簡単）。

✅ **無駄なモジュール登録が不要**  
👉 `app.module.ts` を編集しなくても、新しいコンポーネントを追加できる。

✅ **アプリがシンプルになる**  
👉 `app.module.ts` が不要になり、設定ファイル (`app.config.ts`) だけで管理できる。

✅ **小さなコンポーネント単位で開発しやすい**  
👉 例えば、`ButtonComponent` を独立したスタンドアロンとして作れば、**どこでもそのまま使える**。

---

## **6. スタンドアロンの実践的な使い方**
例えば、再利用可能な `ButtonComponent` を作る場合：

### **🔹 `button.component.ts`（スタンドアロン版）**
```typescript
import { Component } from '@angular/core';

@Component({
  selector: 'app-button',
  standalone: true, // スタンドアロン
  template: `<button (click)="handleClick()">Click me!</button>`,
  styleUrls: ['./button.component.css']
})
export class ButtonComponent {
  handleClick() {
    alert('Button clicked!');
  }
}
```

この `ButtonComponent` は **どのプロジェクトでもそのまま使える**。

**📌 使いたい場所で `imports` するだけ！**
```typescript
import { ButtonComponent } from './button/button.component';
```

👉 **モジュールに登録しなくてもOK！**

---

## **7. スタンドアロン (`Standalone Components`) を使うべきか？**
### **✅ スタンドアロンを使うべき場合**
- **新しいプロジェクト** を作るなら、スタンドアロンがベスト。
- **コンポーネントを再利用したい**（モジュールの登録なしで使える）。
- **アプリをシンプルにしたい**。

### **✅ `NgModule` を使うべき場合**
- 既存の **モジュールベースのプロジェクト** をそのまま使いたい。
- **チームの慣習として `NgModule` を使っている**。

---


===
**スタンドアロン (Standalone Components) では、大規模アプリにおいて整理が難しくなるのか？**

答えは **「適切に設計すれば問題ない」** ですが、無計画にコンポーネントやサービスを増やすと **「どこでどの機能が使われているかが分かりにくくなる」** 可能性はあります。

---

## **📌 スタンドアロンのメリットと課題**
### **✅ スタンドアロンのメリット**
- **小規模〜中規模アプリでは、管理がシンプルで扱いやすい。**
- **`app.module.ts` が不要 → 各コンポーネントが独立して動作できる。**
- **再利用しやすい → 必要なコンポーネントだけ `import` すればOK。**

### **⚠️ スタンドアロンの課題**
- **大規模アプリでは、コンポーネントが増えると管理が難しくなる可能性がある。**
- **どこでどのコンポーネントやサービスが使われているかの追跡がしにくい。**
- **Lazy Loading (遅延ロード) を適切に管理しないと、アプリのパフォーマンスに影響する。**

---

## **📌 スタンドアロンを大規模アプリで整理する方法**
### **1. `Feature Module` の代わりに `Feature Folder` を使う**
従来の `NgModule` ベースでは、**機能ごとに `Feature Module` を作成して整理** していました。  
スタンドアロンでは、**`Feature Folder`（機能ごとにフォルダを作る構成）** で整理すると分かりやすくなります。

**📌 例: アプリのフォルダ構成**
```
src/
├── app/
│   ├── features/   # 各機能ごとにフォルダを作る
│   │   ├── dashboard/
│   │   │   ├── dashboard.component.ts
│   │   │   ├── dashboard.component.html
│   │   │   ├── dashboard.component.css
│   │   ├── reports/
│   │   │   ├── reports.component.ts
│   │   │   ├── reports.component.html
│   │   │   ├── reports.component.css
│   ├── core/   # 共有コンポーネント、サービス
│   │   ├── auth.service.ts
│   │   ├── api.service.ts
│   ├── shared/   # 共通UIコンポーネント
│   │   ├── button/
│   │   │   ├── button.component.ts
│   │   │   ├── button.component.html
│   ├── app.routes.ts  # ルーティング
│   ├── app.config.ts  # 設定
│   ├── main.ts        # エントリーポイント
```
✅ **各機能 (`dashboard`, `reports`) は `features/` にまとめる。**  
✅ **`core/` にはアプリ全体で使うサービス (`auth.service.ts`, `api.service.ts`) を配置。**  
✅ **共通の UI コンポーネント (`button.component.ts`) は `shared/` に置く。**

---

### **2. `provideX()` を使って機能ごとに整理**
スタンドアロンでは、モジュールの `providers` の代わりに **`provideX()` を使って依存関係を整理** できます。

**📌 `app.config.ts` で全体のサービスを管理**
```typescript
import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient(),
    provideAnimations()
  ]
};
```
✅ **`provideX()` を使うことで、従来の `providers` と同じように整理できる。**

---

### **3. `Lazy Loading` を適用する**
大規模アプリでは、**必要なときにだけ機能をロードする (`Lazy Loading`)** ことでパフォーマンスを最適化できます。

**📌 `app.routes.ts` で遅延ロードを設定**
```typescript
import { Routes } from '@angular/router';

export const routes: Routes = [
  { path: 'dashboard', loadComponent: () => import('./features/dashboard/dashboard.component').then(m => m.DashboardComponent) },
  { path: 'reports', loadComponent: () => import('./features/reports/reports.component').then(m => m.ReportsComponent) },
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' }
];
```
✅ **`loadComponent` を使うと、必要なときだけ `DashboardComponent` や `ReportsComponent` をロードする。**  
✅ **大規模アプリでは、不要なコンポーネントを初期ロードしないようにする。**

---

## **📌 結論: スタンドアロンでも整理は可能！**
**✅ スタンドアロンでも、適切に整理すれば大規模アプリに対応できる！**  
**✅ 機能ごとにフォルダを作り (`Feature Folder`)、必要なときだけロード (`Lazy Loading`) すれば問題なし！**  
**✅ ルーティングやサービスを `provideX()` で管理すれば、従来の `NgModule` と同じように整理できる！**

