//
//  ProductTableViewController.swift
//  A2_iOS_Simon_100912566
//
//

import UIKit
import CoreData

class ProductsTableViewController: UITableViewController {
    // MARK: Properties
    var products: [Product] = []
    
    // MARK: Core Data Context
    var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "All Products"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchProducts()
    }
    
    // MARK: Data Loading
    func fetchProducts() {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            products = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }
    
    // MARK: Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        let product = products[indexPath.row]
        cell.textLabel?.text = product.productName
        cell.detailTextLabel?.text = product.productDescription
        
        return cell
    }
}
