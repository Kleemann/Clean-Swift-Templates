//
//  PDFListModels.swift
//  Clean-Swift-Sample
//
//  Created by Mads Kleemann on 10/11/2016.
//  Copyright (c) 2016 makle. All rights reserved.
//

import UIKit

struct PDFList {
    
    struct FetchPDFs {
        
        struct Request {
    
        }
        
        struct Response {
            let pdfs:[PDF]
        }
        
        struct ViewModel {
            let models:[PDFListViewModel]
        }
        
    }
}

struct PDFListViewModel {
    let title:String
    let url:URL?
}
