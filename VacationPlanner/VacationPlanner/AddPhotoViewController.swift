//
//  AddPhotoViewController.swift
//  VacationPlanner
//
//  Created by Mark Sharvin on 30/07/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Cocoa

protocol AddPhotoViewControllerDelegate : class {
    func addPhoto(viewController : NSViewController, photoImage: NSImage?, name: String?, note: String?)
}

class AddPhotoViewController: NSViewController {
    @IBOutlet weak var photoImage: NSImageView!
    @IBOutlet weak var photoName: NSTextField!
    @IBOutlet weak var photoNote: NSTextField!
    weak var addPhotoDelegate: AddPhotoViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func addPhoto(_ sender: NSButton) {
        addPhotoDelegate?.addPhoto(viewController: self,
                                   photoImage: photoImage.image,
                                   name: photoName.stringValue,
                                   note: photoNote.stringValue)
    }
}
