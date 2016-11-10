//
//  PDFListConfigurator.swift
//  Clean-Swift-Sample
//
//  Created by Mads Kleemann on 10/11/2016.
//  Copyright (c) 2016 makle. All rights reserved.
//


import UIKit

// MARK: Connect View, Interactor, and Presenter

extension PDFListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

class PDFListConfigurator {
    // MARK: Object lifecycle
    static let sharedInstance = PDFListConfigurator()
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: PDFListViewController) {
        let router = PDFListRouter()
        router.viewController = viewController
        
        let presenter = PDFListPresenter()
        presenter.output = viewController
        
        let interactor = PDFListInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
