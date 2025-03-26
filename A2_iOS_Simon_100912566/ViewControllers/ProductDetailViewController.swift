//
//  ProductDetailViewController.swift
//  A2_iOS_Simon_100912566
//
//

import UIKit
import CoreData

class ProductDetailViewController: UIViewController {
    // MARK: outlets
    @IBOutlet weak var productIDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: properties
    var products: [Product] = []
    var currentIndex = 0
    
    // MARK: Core Data Context
    var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
