//
//  AddProductViewController.swift
//  A2_iOS_Simon_100912566
//
//

import UIKit
import CoreData

class AddProductViewController: UIViewController {
    // MARK: Outlets
        @IBOutlet weak var productIDTextField: UITextField!
        @IBOutlet weak var nameTextField: UITextField!
        @IBOutlet weak var descriptionTextView: UITextView!
        @IBOutlet weak var priceTextField: UITextField!
        @IBOutlet weak var providerTextField: UITextField!
        
        // MARK: Core Data Context
        var context: NSManagedObjectContext {
            return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        }
        
        
}
