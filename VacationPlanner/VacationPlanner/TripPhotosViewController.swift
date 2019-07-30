//
//  TripPhotosViewController.swift
//  VacationPlanner
//
//  Created by Mark Sharvin on 30/07/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Cocoa

class TripPhotosViewController: NSViewController {
    @IBOutlet weak var photosCollection: NSCollectionView!
    let photoCollectionViewItemIdentifier = NSUserInterfaceItemIdentifier(rawValue: "PhotoCollectionViewItem")
    var trip: Trip!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollection.delegate = self
        photosCollection.dataSource = self
        photosCollection.register(PhotoCollectionViewItem.self, forItemWithIdentifier: photoCollectionViewItemIdentifier)
    }
    
    @IBAction func removePhoto(_ sender: NSButton) {
        let managedObjectContext = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let selectedIndex = photosCollection.selectionIndexes.first
        guard selectedIndex != nil else {
            return
        }
        let selectedPhoto = trip.photos?.object(at: selectedIndex!) as! Photo
        managedObjectContext.delete(selectedPhoto)
        trip.removeFromPhotos(selectedPhoto)
        photosCollection.deleteItems(at: photosCollection.selectionIndexPaths)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPhotoSegue" {
            (segue.destinationController as! AddPhotoViewController).addPhotoDelegate = self
        }
    }
    
}

extension TripPhotosViewController: AddPhotoViewControllerDelegate {
    func addPhoto(viewController: NSViewController, photoImage: NSImage?, name: String?, note: String?) {
        let managedObjectContext = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let photo = NSEntityDescription.insertNewObject(forEntityName: "Photo", into: managedObjectContext) as! Photo
        photo.photoData = photoImage?.tiffRepresentation
        photo.name = name
        photo.note = note
        
        trip.addToPhotos(photo)
        let indexPath = IndexPath(item: trip.photos!.count-1, section: 0)
        photosCollection.insertItems(at: [indexPath])
        dismiss(viewController)
    }
}

extension TripPhotosViewController: NSCollectionViewDelegate {
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, didChangeItemsAt indexPaths: Set<IndexPath>, to highlightState: NSCollectionViewItem.HighlightState) {
        for path in indexPaths {
            let selectedItem = collectionView.item(at: path) as! PhotoCollectionViewItem
            selectedItem.updateForSelection()
        }
    }
    
}

extension TripPhotosViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return trip.photos != nil ? trip.photos!.count : 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: photoCollectionViewItemIdentifier, for: indexPath)
        if let photo = trip.photos?.object(at: indexPath.item) as? Photo {
            item.imageView?.image = photo.photoData != nil ? NSImage(data: photo.photoData!) : nil
            item.textField?.stringValue = photo.note != nil ? photo.note! : ""
        }
        return item
    }
    
    
    
}
