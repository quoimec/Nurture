//
//  GovernmentViewController.swift
//  Nurture
//
//  Created by Charlie on 24/5/17.
//  Copyright © 2017 Charlie Schacher. All rights reserved.
//

import UIKit
import AVFoundation

class GovernmentViewController: UIViewController {

	var applicationDict = [String: String]()
	
	var typeName = "Democratic Republic"
	var typeLeader: String?
	var typeDescription: String?
	var nationType = "Patriotic"
	var nationDescription: String?

	@IBOutlet weak var governmentType: UISlider!
	@IBOutlet weak var nationalismType: UISlider!
	
	@IBOutlet weak var governmentName: UILabel!
	@IBOutlet weak var governmentLeader: UILabel!
	@IBOutlet weak var governmentDescription: UILabel!
	
	@IBOutlet weak var nationalismName: UILabel!
	@IBOutlet weak var nationalismDescription: UILabel!
	
	@IBAction func govSlider(_ sender: Any) {
	
		let typeSlider = governmentType.value

		if typeSlider <= 1 {
		
			typeName = "Autonomous Anarcho-Syndicalist Commune"
			typeLeader = "Executive Officer"
			typeDescription = "It is your turn to act as the executive officer of the commune for the week. All your decisions must be ratified at a special bi-weekly meeting by a civil majority for internal affairs and a two thirds majority for external affairs."
		
		} else if typeSlider <= 2 {
		
			var genderString: String
			if applicationDict["personalGender"] == "Male" {
				genderString = "Mr"
			} else {
				genderString = "Mme"
			}
		
			typeName = "Democratic Republic"
			typeLeader = genderString + " President"
			typeDescription = "You have been freely voted into office by the citizens of " + applicationDict["personalCountry"]! + ". The information you provide the students of your country will be fair and balanced (hint: this is the boring option)."
			
		} else {
		
			var genderString: String
			if applicationDict["personalGender"] == "Male" {
				genderString = "His Holiness, "
			} else {
				genderString = "Her Holiness, "
			}
		
			typeName = "Totalitarian Dictatorship"
			typeLeader = genderString + "The Supreme Emperor of " + applicationDict["personalCountry"]!
			typeDescription = "You were selected by the devine providence of god to rule the plebians of " + applicationDict["personalCountry"]! + ". Treat them as you will."
		
		}
		
		governmentName.text = typeName
		governmentLeader.text = typeLeader
		governmentDescription.text = typeDescription
	
	}
	
	@IBAction func natSlider(_ sender: Any) {
	
		let nationSlider = nationalismType.value
		
		if nationSlider <= 1 {
		
			nationType = "Indifferent"
			nationDescription = "Your people are not particularly fussed about you or " + applicationDict["personalCountry"]! + "."
		
		} else if nationSlider <= 2 {
		
			nationType = "Patriotic"
			nationDescription = "Your people stand firmly behind you and strongly believe " + applicationDict["personalCountry"]! + " is the best country in the world."
		
		} else {
		
			nationType = "Faccist"
			nationDescription = "Frenzied nationalism and a fervent passion for " + applicationDict["personalCountry"]! + ". Your people look upon you adoringly and keep small shrines to your honor in their homes. Long live " + applicationDict["personalName"]! + ". Long live " + applicationDict["personalCountry"]! + "."
		
		}
		
		nationalismName.text = nationType
		nationalismDescription.text = nationDescription
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		var genderString: String
			
		if applicationDict["personalGender"]! == "Female" {
			genderString = "Mme"
		} else {
			genderString = "Mr"
		}

        governmentName.text = "Democratic Republic"
		governmentLeader.text = genderString + " President"
		governmentDescription.text = "You have been freely voted into office by the citizens of " + applicationDict["personalCountry"]! + ". The information you provide the students of your country will be fair and balanced (hint: this is the boring option). "
		
		nationalismName.text = "Partiotic"
		nationalismDescription.text = "Your people stand firmly behind you and strongly believe " + applicationDict["personalCountry"]! + " is the best country in the world."
    }

	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openClass" {
		
			applicationDict["governmentType"] = typeName
			applicationDict["governmentRaw"] = String(governmentType.value)
			applicationDict["nationalismType"] = nationType
			applicationDict["nationalismRaw"] = String(nationalismType.value)
		
			let destinationController = segue.destination as! ClassViewController
			destinationController.applicationDict = applicationDict
			
        }
    }

}
