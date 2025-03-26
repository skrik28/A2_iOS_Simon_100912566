//
//  AppDelegate.swift
//  A2_iOS_Simon_100912566
//
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Check if we need to preload data
        let userDefaults = UserDefaults.standard
        if !userDefaults.bool(forKey: "isDataPreloaded"){
            preloadData()
            userDefaults.set(true, forKey: "isDataPreloaded")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ProductModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: Preload Data
    func preloadData() {
        let context = persistentContainer.viewContext
        
        // Sample products data
        let productsData = [
            ["id": "P001", "name": "iPhone 13", "desc": "Latest Apple smartphone with A15 Bionic chip", "price": 799.99, "provider": "Apple Inc."],
            ["id": "P002", "name": "Galaxy S21", "desc": "Samsung flagship with Exynos processor", "price": 699.99, "provider": "Samsung Electronics"],
            ["id": "P003", "name": "MacBook Pro", "desc": "13-inch with Apple M1 chip", "price": 1299.99, "provider": "Apple Inc."],
            ["id": "P004", "name": "iPad Air", "desc": "10.9-inch with A14 Bionic chip", "price": 599.99, "provider": "Apple Inc."],
            ["id": "P005", "name": "Sony WH-1000XM4", "desc": "Wireless noise-canceling headphones", "price": 349.99, "provider": "Sony Corporation"],
            ["id": "P006", "name": "Dell XPS 13", "desc": "13-inch ultrabook with Intel Core i7", "price": 999.99, "provider": "Dell Technologies"],
            ["id": "P007", "name": "Canon EOS R5", "desc": "45MP full-frame mirrorless camera", "price": 3899.99, "provider": "Canon Inc."],
            ["id": "P008", "name": "Nintendo Switch", "desc": "Hybrid gaming console", "price": 299.99, "provider": "Nintendo Co., Ltd."],
            ["id": "P009", "name": "LG OLED C1", "desc": "55-inch 4K Smart TV", "price": 1499.99, "provider": "LG Electronics"],
            ["id": "P010", "name": "Dyson V11", "desc": "Cordless vacuum cleaner", "price": 599.99, "provider": "Dyson Ltd."]
        ]
        
        // Create Product entites
        for productData in productsData {
            let product = Product(context: context)
            product.productID = productData["id"] as? String
            product.productName = productData["name"] as? String
            product.productDescription = productData["desc"] as? String
            product.productPrice = productData["price"] as! Double
            product.productProvider = productData["provider"] as? String
        }
        
        // Save context
        do {
            try context.save()
            print("Sample data preloaded successfully")
        } catch {
            print("Failed to preload data: \(error)")
        }
    }


}

