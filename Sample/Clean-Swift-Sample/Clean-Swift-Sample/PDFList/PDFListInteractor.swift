//
//  PDFListInteractor.swift
//  Clean-Swift-Sample
//
//  Created by Mads Kleemann on 10/11/2016.
//  Copyright (c) 2016 makle. All rights reserved.
//

import UIKit

protocol PDFListInteractorOutput {
    func presentPDF(response: PDFList.FetchPDFs.Response)
}

class PDFListInteractor: PDFListViewControllerOutput  {
    

    var output: PDFListInteractorOutput!
    var worker: PDFListWorker!
    
    // MARK: Business logic
    
    func fetchPDFs(request: PDFList.FetchPDFs.Request) {
        worker = PDFListWorker()
        let ret = worker.getPDFs()
        
        let response = PDFList.FetchPDFs.Response(pdfs: ret)
        output.presentPDF(response: response)
    }
    
//    func doSomething(request: PDFListRequest) {
//        // NOTE: Create some Worker to do the work
//        
//        worker = PDFListWorker()
//        worker.doSomeWork()
//        
//        // NOTE: Pass the result to the Presenter
//        
//        let response = PDFListResponse()
//        output.presentSomething(response: response)
//    }
}
