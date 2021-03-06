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
    @IBOutlet weak var butttonss: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        butttonss.layer.cornerRadius = 15
        butttonss.layer.masksToBounds = true
        
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
                       let jsonResponse = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String: Any] {
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(usd)"
                                    
                                }
                                if let try1 = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(try1)"
                                    
                                }
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD : \(cad)"
                                    
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP : \(gbp)"
                                    
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                    
                                }
                            }
                            
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

