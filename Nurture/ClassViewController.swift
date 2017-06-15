//
//  ClassViewController.swift
//  Nurture
//
//  Created by Charlie on 26/5/17.
//  Copyright © 2017 Charlie Schacher. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

	var applicationDict = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openMainScience" {
			applicationDict["classType"] = "Science"
		} else if segue.identifier == "openMainHistory" {
			applicationDict["classType"] = "History"
		} else {
			applicationDict["classType"] = "Maths"
		}
		
		let destinationController = segue.destination as! MainViewController
		destinationController.applicationDict = applicationDict
			
    }

}
