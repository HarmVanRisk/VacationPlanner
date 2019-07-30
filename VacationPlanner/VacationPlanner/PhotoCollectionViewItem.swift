//
//  PhotoCollectionViewItem.swift
//  VacationPlanner
//
//  Created by Mark Sharvin on 30/07/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Cocoa

class PhotoCollectionViewItem: NSCollectionViewItem {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.borderColor = NSColor.blue.cgColor
        view.layer?.borderWidth = 0
    }
    
    func updateForSelection() {
        view.layer?.borderWidth = isSelected ? 5 : 0
    }
    
}
