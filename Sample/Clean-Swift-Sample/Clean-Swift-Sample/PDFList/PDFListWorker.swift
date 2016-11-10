//
//  PDFListWorker.swift
//  Clean-Swift-Sample
//
//  Created by Mads Kleemann on 10/11/2016.
//  Copyright (c) 2016 makle. All rights reserved.
//


import UIKit

class PDFListWorker {
  // MARK: Business Logic
  
  func getPDFs() -> [PDF] {
    let p = PDF(title: "1", url: nil)
    let p2 = PDF(title: "2", url: nil)
    let ret = [p, p2]
    return ret
    
    //Getr PDF from somewhere
  }
}
