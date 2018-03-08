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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goAction(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FirstViewContorller : SecondDelegate {
    func getDataFromSecondViewController(text: String) {
        someTextLable.text = text
    }
}
