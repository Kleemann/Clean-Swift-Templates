# Clean-Swift-Templates

Kleemanns version of the [Clean Swift](http://clean-swift.com) templates by Raymond Law - Updated for swift 3. 
This also include a snippet for use-case models. 

### Install:
* Open terminal.
* cd to repo folder.
* make install.

The architecture is based on the clean architecture proposed by uncle bob [here](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html). 

The architecture is build up around a VIP cycle which all act as output to one another as shown in the picture below. 

[Inseet picture]

One VIP cycle represents a screen/view presented to the user, also referred to as a scene.
The ViewControllers output connect to the interactor, the interactors output connects to the presenter and the presenters output connects back to the viewController. All the connections is done via the dependency inversion principle for better decoupling. This means that the components don't know the low level implementations of each component, only a high level abstraction

The actual communication between the components is done via special data models. These models allow us to pass data through the boundaries between the components. The models are not the same as the underlaying data models of the application. This means that we decouple the underlaying data model from each scene and if the underlaying data model changes we don't need to update the entire codebase. The models consists of only primitive types such as Int, Double, String etc.  
Each data model is used in a use-case consisting of a request, response and viewModel model. Each scene can have multiple use cases, such as FetchBooks, FormatDate etc.

* The request model is created by the view controller and used for passing to the interactor. A request model contains mostly user inputs, such as text entered in text fields and values chosen in interface components. 
* A response model is created by the interactor after it finished doing some work. it encapsulates the results from the work and hands it off to the presenter. 
* A view model is created by the presenter when it receives the response model from the interactor. The presenter formats the result model into primitive type suitable for display and added them to the view model. It then passes the view model back to the view controller for display. 

If there is no need to pass data in a use case model, the model can be empty. 

A typical scenario is the user makes an interaction with the app’s user interface. The interaction is captured by the ViewController. The ViewController constructs a use-case request model and sends it to the Interactor. The interactor takes the request and performs some work, this can for example be fetching objects from a backend or web service. The interactor then constructs a response for the use-case and sends it to the presenter. The presenter takes the response and formats the result so it can be presented to the user. The presenter then constructs a viewModel for the use-case and send it back to the viewcontroller. Finally the view controller displays the result to the user. 

## ViewController
The viewcontroller should only handle the view subclasses displayed to the user. No validation of input fields, networking, parsing, converting etc. 
Upon initializationn the viewController calls a configurator to setup the VIP cycle for the giving scene. This is done as the first thing in the view controllers view life cycle, to avoid events from being requested before the VIP cycle is set up. 
Upon user input or a concrete time in the view controller view life cycle, the view controller can ask the interactor to do some business logic (work). The view controller doesn’t and shouldn’t care who and how it is done. 
The navigation logic is extracted form the view controller and into a Router object.

## Configurator
The configurator hooks up the different components in the VIP cycle, to one another. The configurator is a singleton object. This ensures that each scene and connections is only hooked up once and only have one instance of the configurator. The configurator is the only object that know the specific classes in the VIP cycle, which means that it is the only place to change in case any of the components needs to be refactored to a new class. The configurator can also inject dependencies to the interactor if needed. 

## Router
The router controls the navigation flow of the scene. It knows what the next scene is and can pass the appropriate data to it. The router contains a reference to the viewController for get the needed data and presenting the next scene on top of it. This reference to the view controller is weak to avoid a retain cycle. 

## Interactor
The interactor contains the business logic. The interactor handles the requests made from the view controller (either user interactions or life cycle events). To do actual work the interactor spawns different workers to help with doing different tasks. If an error occurs while doing the work the interactor creates an error object and asks the presenter to present the error.  If the work is done successfully the result it put in an response and handed off to the presenter. 

## Worker
The workers job is doing the actual work for the interactor. We don't want to swamp the interactor with doing all the tasks, therefore we break is down into many workers, each doing one thing. The workers should strongly follow the single responsibility principle, they should only handle a single task, eg. upload, download, parse etc. It is important no workers contains a strong reference back to the interactor, thereby creating a retain cycle and making the workers unable to be used elsewhere in the app. A worker is lazy loaded by the interactor which means they are only initializeed if needed. 

## Presenter
The presenters job is taking the result of the interactors work and format it suitable for display. The presenter puts the formatted result into a view model and passes it back to the view controller. This formatting could be localizing string, formatting dates etc. The presenter also formats errors from the interactor to an appropriate view model to display to the user. 
