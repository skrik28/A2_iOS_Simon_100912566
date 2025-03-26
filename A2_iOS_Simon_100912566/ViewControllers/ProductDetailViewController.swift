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
    
    // MARK: Lifecycle Methods
    //
    
    // MARK: Data Loading
    func fetchProducts() {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            products = try context.fetch(fetchRequest)
            if !products.isEmpty {
                displayProduct(at: 0)
            }
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }
    
    func displayProduct(at index: Int) {
        guard index >= 0 && index < products.count else { return }
        
        currentIndex = index
        let product = products[index]
        
        productIDLabel.text = "ID: \(product.productID ?? "")"
        nameLabel.text = product.productName
        descriptionTextView.text = product.productDescription
        priceLabel.text = String(format: "$%.2f", product.productPrice)
        providerLabel.text = "Provider: \(product.productProvider ?? "")"
    }
}
