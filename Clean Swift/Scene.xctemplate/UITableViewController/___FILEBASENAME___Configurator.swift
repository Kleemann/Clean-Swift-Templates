//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class ___FILEBASENAMEASIDENTIFIER___Configurator {
    // MARK: Object lifecycle
    static let sharedInstance = ___FILEBASENAMEASIDENTIFIER___Configurator()
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: ___FILEBASENAMEASIDENTIFIER___ViewController) {
        let router = ___FILEBASENAMEASIDENTIFIER___Router()
        router.viewController = viewController
        
        let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter()
        presenter.output = viewController
        
        let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
