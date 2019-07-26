//
//  TripNotesViewController.swift
//  VacationPlanner
//
//  Created by Mark Sharvin on 25/07/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Cocoa

class TripNotesViewController: NSViewController {
    
    @IBOutlet var objectController: NSObjectController!
    
    var trip : Trip {
        didSet {
            objectController.content = trip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
