//
//  PersonalViewController.swift
//  Nurture
//
//  Created by Charlie on 24/5/17.
//  Copyright © 2017 Charlie Schacher. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController {

	@IBOutlet weak var personalName: UITextField!
	@IBOutlet weak var personalGender: UISegmentedControl!
	@IBOutlet weak var personalCountry: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openGovernment" {
		
			var getGender: String
		
			if personalGender.selectedSegmentIndex == 0 {
				getGender = "Female"
			} else {
				getGender = "Male"
			}
		
			var applicationDict = [String: String]()
			
			if personalName.text == "" {
				applicationDict["personalName"] = "Kim Did Poo"
			} else {
				applicationDict["personalName"] = personalName.text!
			}
			
			if personalCountry.text == "" {
				applicationDict["personalCountry"] = "Poo Poo Land"
			} else {
				applicationDict["personalCountry"] = personalCountry.text!
			}
		
			applicationDict["personalGender"] = getGender
		
			let destinationController = segue.destination as! GovernmentViewController
			destinationController.applicationDict = applicationDict
			
        }
    }
	

}
