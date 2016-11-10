//
//  PDFListViewController.swift
//  Clean-Swift-Sample
//
//  Created by Mads Kleemann on 10/11/2016.
//  Copyright (c) 2016 makle. All rights reserved.
//


import UIKit

protocol PDFListViewControllerOutput {
    func fetchPDFs(request: PDFList.FetchPDFs.Request)
}

class PDFListViewController: UITableViewController,  PDFListPresenterOutput {
    var output: PDFListViewControllerOutput!
    var router: PDFListRouter!
    
    var displayedPDFs:[PDFListViewModel] = []
    
    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        PDFListConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPDFs()
    }
    
    // MARK: Event handling
    
    func getPDFs() {
        // NOTE: Ask the Interactor to do some work
        
        let request = PDFList.FetchPDFs.Request()
        output.fetchPDFs(request: request)
    }
    
    // MARK: Display logic
    
    func displayPDFs(viewModel: PDFList.FetchPDFs.ViewModel) {
        displayedPDFs = viewModel.models
        tableView.reloadData()
    }
    
    
    //MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedPDFs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PDFCell", for: indexPath)
        cell.textLabel?.text = displayedPDFs[indexPath.row].title
        return cell
    }
    
}
