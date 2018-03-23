//
//  FirstViewContorller.swift
//  Memories
//
//  Created by Nikola Popovic on 3/8/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

protocol SecondDelegate : class {
    func getDataFromSecondViewController(text : String)
    
}

class FirstViewContorller: UIViewController {

    @IBOutlet weak var someTextLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func goAction(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension FirstViewContorller : SecondDelegate {
    func getDataFromSecondViewController(text: String) {
        someTextLable.text = text
    }
}
