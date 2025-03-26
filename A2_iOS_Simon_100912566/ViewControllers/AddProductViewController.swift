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
        
    
    
    
    // MARK: Actions
    @objc func saveProduct() {
        guard let productID = productIDTextField.text, !productID.isEmpty,
              let name = nameTextField.text, !name.isEmpty,
              let description = descriptionTextView.text, !description.isEmpty,
              let priceText = priceTextField.text, !priceText.isEmpty,
              let provider = providerTextField.text, !provider.isEmpty,
              let price = Double(priceText) else {
            showAlert(message: "Please fill in all fields with valid information.")
            return
        }
        
        // Create new Product entity
        let product = Product(context: context)
        product.productID = productID
        product.productName = name
        product.productDescription = description
        product.productPrice = price
        product.productProvider = provider
        
        // Save context
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print("Failed to save product: \(error)")
            showAlert(message: "Failed to save product. Please try again.")
        }
    }
    // MARK: Helper Methods
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
