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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsArrayController.managedObjectContext = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Do view setup here.
    }
    
    func setInitialTrip() {
        try? tripsArrayController.fetch(with: nil, merge: false)
        if tripsArrayController.selectedObjects != nil {
            let trip = tripsArrayController.selectedObjects[0] as! Trip
            let tabViewController = children[1] as! TripTabViewController
            tabViewController.trip = trip
        }
    }
    
}
