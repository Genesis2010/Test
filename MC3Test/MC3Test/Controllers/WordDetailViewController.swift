//
//  WordDetailViewController.swift
//  MC3Test
//
//  Created by ParkJunHyuk on 2022/07/18.
//

import UIKit

class WordDetailViewController : UIViewController {
    
    var wordName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = wordName
        view.backgroundColor = .systemBackground
        
    }
}
