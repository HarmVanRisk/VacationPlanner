//
//  TripSplitViewController.swift
//  VacationPlanner
//
//  Created by Mark Sharvin on 26/07/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Cocoa

class TripSplitViewController: NSSplitViewController {
    @IBOutlet var tripsArrayController: NSArrayController!
    
    var managedObjectContext = (NSApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func setInitialTrip() {
        try? tripsArrayController.fetch(with: nil, merge: false)
        if tripsArrayController.selectedObjects != nil {
            let trip = tripsArrayController.selectedObjects[0] as! Trip
            let tabViewController = tripsArrayController.selectedObjects[1] as! TripTabViewController
            tabViewController.trip = trip
        }
    }
    
}
