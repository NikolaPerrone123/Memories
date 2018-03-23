//
//  SecondViewController.swift
//  Memories
//
//  Created by Nikola Popovic on 3/8/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var someTextField: UITextField!
    
    var delegate: SecondDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backAction(_ sender: Any) {
        delegate?.getDataFromSecondViewController(text: someTextField.text!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.getDataFromSecondViewController(text: someTextField.text!)
    }
}
