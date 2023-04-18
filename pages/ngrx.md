---
layout: page
title: NgRX
---
#### References
- [NgRx](https://ngrx.io/)
- [Redux (JavaScript library) - Wikipedia](<https://en.wikipedia.org/wiki/Redux_(JavaScript_library)>)
- [Redux - A predictable state container for JavaScript apps. | Redux](https://redux.js.org/)
- [Redux 入門【ダイジェスト版】10 分で理解する Redux の基礎 - Qiita](https://qiita.com/kitagawamac/items/49a1f03445b19cf407b7)
- [[Angular][NgRx]NgRxの基本](https://zenn.dev/yusuke_docha/articles/b74bd682d9aca0)

#### What is NgRx?
[NgRx - What is NgRx?](https://ngrx.io/docs)
> NgRx is a framework for building reactive applications in Angular. NgRx provides libraries for:
> * Managing global and local state.
> * Isolation of side effects to promote a cleaner component architecture.
> * Entity collection management.
> * Integration with the Angular Router.
> * Developer tooling that enhances developer experience when building many different types of applications.

#### What is Store?
> Store is RxJS powered global state management for Angular applications, inspired by Redux. Store is a controlled state container designed to help write performant, consistent applications on top of Angular.

> **Key concepts**
> * **Actions** describe unique events that are dispatched from components and services.
> * **State changes** are handled by pure functions called reducers that take the current state and the latest action > to compute a new state.
> * **Selectors** are pure functions used to select, derive and compose pieces of state.
> * **State** is accessed with the Store, an observable of state and an observer of actions.

[NgRx - @ngrx/store](https://ngrx.io/guide/store)

#### What is Redux?
[Redux (JavaScript library) - Wikipedia](<https://en.wikipedia.org/wiki/Redux_(JavaScript_library)>)
> Redux is an open-source JavaScript library for managing and centralizing application state. It is most commonly used with libraries such as React or Angular for building user interfaces. Similar to (and inspired by) Facebook's Flux architecture, it was created by Dan Abramov and Andrew Clark. Since mid-2016, the primary maintainers are Mark Erikson and Tim Dorr.
Redux is a small library with a simple, limited API designed to be a predictable container for application state. It operates in a similar fashion to a reducing function, a functional programming concept.

- [Core Concepts | Redux](https://redux.js.org/introduction/core-concepts)

#### What is the basic of Redux?
Read [Redux 入門【ダイジェスト版】10 分で理解する Redux の基礎 - Qiita](https://qiita.com/kitagawamac/items/49a1f03445b19cf407b7)!!
Read also [Core Concepts | Redux](https://redux.js.org/introduction/core-concepts)!!

* Action, ActionCreator, Store, State and Reducer

#### What is the basic of NgRx?
[NgRx - @ngrx/store](https://ngrx.io/guide/store)

#### What is an Effect?
[NgRx - @ngrx/effects](https://ngrx.io/guide/effects)
> Effects are an RxJS powered side effect model for Store. Effects use streams to provide new sources of actions to reduce state based on external interactions such as network requests, web socket messages and time-based events.
> In a service-based Angular application, components are responsible for interacting with external resources directly through services. Instead, effects provide a way to interact with those services and isolate them from the components. Effects are where you handle tasks such as fetching data, long-running tasks that produce multiple events, and other external interactions where your components don't need explicit knowledge of these interactions.

It's installed separately.


#### What is Angular-redux?
- [GitHub - angular-redux/ng-redux: Angular bindings for Redux](https://github.com/angular-redux/ng-redux)
- [Differences between ngrx and angular-redux | by Mike Reyes | Medium](https://medium.com/@UReyesMeUp/differences-between-ngrx-and-angular-redux-d2d1d59d4cbd)



