//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_sceneName___PresentationLogic {
    func presentSomething(response: ___VARIABLE_sceneName___.Something.Response)
}

class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic {
    weak var viewController: ___VARIABLE_sceneName___DisplayLogic?
    
    // MARK: Presentation logic
    
    func presentSomething(response: ___VARIABLE_sceneName___.Something.Response) {
        let viewModel = ___VARIABLE_sceneName___.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
