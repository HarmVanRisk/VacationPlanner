//
//  TripDetailsViewController.swift
//  VacationPlanner
//
//  Created by Mark Sharvin on 25/07/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Cocoa

class TripDetailsViewController: NSViewController {
    @IBOutlet weak var startDatePicker: NSDatePicker!
    @IBOutlet weak var endDatePicker: NSDatePicker!
    @IBOutlet weak var totalTimeLabel: NSTextField!
    @IBOutlet var objectController: NSObjectController!
    
    lazy var dateComponentsFormatter: DateComponentsFormatter = {
       let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = .day
        dateComponentsFormatter.unitsStyle = .full
        return dateComponentsFormatter
    }()
    
    var trip: Trip {
        didSet {
            objectController.content = trip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateChanged(startDatePicker)
    }
    
    @IBAction func dateChanged(_ sender: NSDatePicker) {
        let calendar = Calendar(identifier: .gregorian)
        let midnightStartDate = calendar.startOfDay(for: startDatePicker.dateValue)
        let midnightEndDate = calendar.startOfDay(for: endDatePicker.dateValue).addingTimeInterval(60*60*24)
        let tripTime = midnightEndDate.timeIntervalSince(midnightStartDate)
        let dayDifference = dateComponentsFormatter.string(from: tripTime)!
        totalTimeLabel.stringValue = dayDifference//.replacingOccurrences(of: "day", with: "night")
    }
    
    
}
