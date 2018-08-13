# RIBs Cheat Sheet

**Notes:**

- RIBs do **NOT** have to have a view(controller).
- Dependency inversion principle is where something declares what it needs and some other unit provides the implementation. Example: Interactor declares `SomeRoutingProtocol` and `SomeRouter` conforms to this protocol and provides the actual implementation of this .



**Interactor:**

Contains business logic

All operations performed by interaction must be confined by its life cycle

Decide what other RIBs should be attached as children

**Router:**

Listens to interactor, attaches/ detaches child RIBs. Declares what it needs from interactor to communicate via a protocol ie: 

``````swift
protocol LoggedOutInteractable: Interactable {

    var router: LoggedOutRouting? { get set }

    var listener: LoggedOutListener? { get set }

}
``````

**Builder:**

Builds shit. Instantiates all the RIB’s constituent classes as as the builders for each child RIB.

**Presenter:**

Stateless classes that translate business models into view models.

Can be omitted bc often it is trivial to translate these models. **IF** omitted translating the view models becomes a responsibility of a VC or interactor

**View(Controller):**

Builds and updates the UI. This includes instantiating and laying out UI components, handling user interaction, etc….

**Component:**

Used to instantiate other units that compose a RIB. The Components provide access to the external dependencies that are needed to build a RIB as well as own the dependencies created by the RIB itself and control access to them from the other RIBs