//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_sceneName___BusinessLogic {
    func doSomething(request: ___VARIABLE_sceneName___.Something.Request)
}

class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {
    var presenter: ___VARIABLE_sceneName___PresentationLogic?
    var worker: ___VARIABLE_sceneName___Worker?
    
    // MARK: Business logic
    
    func doSomething(request: ___VARIABLE_sceneName___.Something.Request) {
        worker = ___VARIABLE_sceneName___Worker()
        worker?.doSomeWork()
        
        let response = ___VARIABLE_sceneName___.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
