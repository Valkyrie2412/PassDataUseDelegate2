//
//  ViewController.swift
//  PassDataUseDelegate2
//
//  Created by Hiếu Nguyễn on 7/18/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

protocol DataDelegate: class {
    func didFindDaTa(data:String)
}

class ViewController: UIViewController {
    
    weak var delegate: DataDelegate?
    var data: String?

    @IBOutlet weak var mytextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            mytextField.text = data
        }
    }

    @IBAction func sendingData(_ sender: UIButton) {
        if mytextField.text != nil {
            delegate?.didFindDaTa(data: mytextField.text!)
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


