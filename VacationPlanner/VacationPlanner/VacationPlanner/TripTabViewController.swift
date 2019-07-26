//
//  TripTabViewController.swift
//  VacationPlanner
//
//  Created by Mark Sharvin on 26/07/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Cocoa

class TripTabViewController: NSTabViewController {
    
    var trip: Trip {
        didSet {
            let detailsViewController = children[0] as! TripDetailsViewController
            detailsViewController.trip = trip
            let notesViewController = children[1] as! TripNotesViewController
            notesViewController.trip = trip
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
