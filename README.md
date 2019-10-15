# CryptoLevels

🏎 A SwiftUI + Combine approach to stateful content management.

![Alt Text](https://github.com/lorenzozanotto/cryptolevels-swiftui-combine/blob/master/Showcase/app.showcase.gif)

## Highlights

### ⚡️ Reactive State Driven Architecture

**SwiftUI** is pushing towards a state driven approach when writing apps. 
This has the benefits of creating apps that are easy to test, debug and code, since the content that will
be shown is the content that is contained in the centralized state.

**CryptoLevels** is achieving this with two main components.

- **The Store**: which contains the data structures that will be represented in the app.
The Store is also an @EnvironmentObject in the Views, so every time that there are changes, the UI redraws itself.
- **The Orchestrator**: which knows about the `Store` and the `Network`. Its goal is to fetch data from the
internet, using **Combine** to map the received data and updating the `Store` to let the UI redraw.

### 🏄🏻‍♂️ 7 Lines of Code Network Manager

The **Combine** powered Network Manager is only 7 lines of code and is packed with JSON to Model mapping.

```swift
func fire<Output: JSONDecodable>(at url: URL, output: Output.Type) -> AnyPublisher<Output, URLError> {
    URLSession.shared.dataTaskPublisher(for: url)
        .map({ $0.data })
        .map({ output.init(json: JSONComposer.compose($0)) })
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}
```

### 🌟 Stateful Content Management

This example includes a `StatefulContent` view which is managed by a `ContentState`. 

```swift
// The StatefulContent is a view managed by a ContentState
// which is obtained combining the right data from the Store.
//
// This approach has the benefit of adapting the UI with a
// reactive state management provided by an Orchestrator
// that updates the Store using Combine.
//
// This component is capable of handling
//
// - Correctly loaded content
// - Loading state
// - Empty data
// - Error message
//
StatefulContent(state: store.mapLevelState(), whenLoaded: {
    LevelProgressList(self.store.level)
}, whenLoading: {
    PulseLoader(self.store.loading)
}, onEmptyData: {
    Text("No data to fetch. Try again later.")
}, onError: { error in
    
  // The fetchCurrentLevel queries the Orchestrator that
  // will update the Store, so it will render this view
  // again when the data gets fetched. Or not.
  //
  // Retry mechanism is as easy as that
  //
  TryAgain(error: error, action: self.fetchCurrentLevel)
})
```

The `ContentState` is built from the `Store`, an `@EnvironmentObject` which is responsible of representing
the data that will be shown in the app.

### ♻️ Dead simple retry mechanism

![Alt Text](https://github.com/lorenzozanotto/cryptolevels-swiftui-combine/blob/master/Showcase/retry.showcase.gif)

Since all actions are dispatched from an `Orchestrator`, which is contained in the `Store`,
dispatching an action that will later modify the entire app state based on its success or not, is really easy.

```swift
...
TryAgain(error: error, action: self.fetchCurrentLevel)

// The action in the Orchestrator will update the store
// and the UI will be redrawn invoking a single line of code
func fetchCurrentLevel() {
    store.orchestrator.fetchCurrentLevel()
}
```

### 🍃 Pure Swift, no dependencies

The whole example has been built using a single project. Just clone and build. No CocoaPods, no external dependencies.
