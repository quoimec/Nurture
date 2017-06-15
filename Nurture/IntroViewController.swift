//
//  IntroViewController.swift
//  Nurture
//
//  Created by Charlie on 24/5/17.
//  Copyright © 2017 Charlie Schacher. All rights reserved.
//

import UIKit
import CoreData

class IntroViewController: UIViewController {

	@IBAction func buttonPress() {
	
		print("Starting provotype")
	
	}
	
	func outputCoreData() {
	
		let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
		let context = appDelegate.persistentContainer.viewContext
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Session")
		
		do {
			
			let fetchedSessions = try context.fetch(fetchRequest) as! [Session]
			
			if fetchedSessions.count == 0 {
				print("No Sessions")
			} else {
				for ses in fetchedSessions {
					print("\(ses.name!), \(ses.gender!), \(ses.country!), \(ses.government!), \(ses.subject!), \(ses.q1correct!), \(ses.q2correct!), \(ses.q3correct!), \(ses.stars!),")
				}
			}
			
		} catch {
			fatalError("Failed to fetch Briefs: \(error)")
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		outputCoreData()

        // Do any additional setup after loading the view.
    }

}
