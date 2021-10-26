//
//  ViewController.swift
//  currency-Converter
//
//  Created by Nika Kalandia on 25.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getRates(_ sender: Any) {
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=2227346145ef66e7040914490b41c6cb")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { Data, Response, Error in
            if Error != nil {
                let alert = UIAlertController(title: "ERROR!", message: Error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            }else {
                
                if Data != nil {
                    
                    do {
                       let jsonResponse = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        DispatchQueue.main.async {
                            print(jsonResponse)
                            
                        }
                    }catch {
                        print("ERROR!")
                    }
                }
            }
            
        }
        
        task.resume()
        
    }
    
    
}

