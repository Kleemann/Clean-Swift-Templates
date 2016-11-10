//
//  PDFListPresenter.swift
//  Clean-Swift-Sample
//
//  Created by Mads Kleemann on 10/11/2016.
//  Copyright (c) 2016 makle. All rights reserved.
//

import UIKit

protocol PDFListPresenterOutput: class {
    func displayPDFs(viewModel: PDFList.FetchPDFs.ViewModel)
}

class PDFListPresenter: PDFListInteractorOutput {
    weak var output: PDFListPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentPDF(response: PDFList.FetchPDFs.Response) {
        
        let pdfs = response.pdfs
        var viewModels:[PDFListViewModel] = []
        for pdf in pdfs {
            let item = PDFListViewModel(title: pdf.title, url: pdf.url)
            viewModels.append(item)
        }
        
        let viewModel = PDFList.FetchPDFs.ViewModel(models: viewModels)
        output.displayPDFs(viewModel: viewModel)
    }

}
