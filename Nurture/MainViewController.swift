//
//  MainViewController.swift
//  Nurture
//
//  Created by Charlie on 26/5/17.
//  Copyright © 2017 Charlie Schacher. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController, AVSpeechSynthesizerDelegate {

	let speechSynthesizer = AVSpeechSynthesizer()
	var voiceToUse: AVSpeechSynthesisVoice?
	var quizQuestion: [String: String]?
	var correctAnswer: String?
	var correctAnswerString: String?
	var actNumber = 1
	var questionsRight = 0
	
	var q1Right: String?
	var q2Right: String?
	var q3Right: String?
	var starsCount: String?
	
	var applicationDict = [String: String]()
	var imageStringArray = [String]()
	var imageStringIndex = 0
	let imageRequired = "iPad Copy"
	
	var hisHer: String?
	var heShe: String?
	var himHer: String?
	
	var finalScript = [[String: String]]()
	
	@IBOutlet weak var rateViews: UIView!
	@IBOutlet weak var buttonViews: UIView!
	@IBOutlet weak var quizOutletOne: UIButton!
	@IBOutlet weak var quizOutletTwo: UIButton!
	@IBOutlet weak var quizOutletThree: UIButton!
	@IBOutlet weak var teacherImage: UIImageView!
	
	@IBOutlet weak var rateOne: UIButton!
	@IBOutlet weak var rateTwo: UIButton!
	@IBOutlet weak var rateThree: UIButton!
	@IBOutlet weak var rateFour: UIButton!
	@IBOutlet weak var rateFive: UIButton!
	
	@IBAction func rateOneAction(_ sender: Any) {
		rateOne.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateTwo.setImage(UIImage(named: "StarUnselected"), for: .normal)
		rateThree.setImage(UIImage(named: "StarUnselected"), for: .normal)
		rateFour.setImage(UIImage(named: "StarUnselected"), for: .normal)
		rateFive.setImage(UIImage(named: "StarUnselected"), for: .normal)
		starsCount = "1"
	}
	@IBAction func rateTwoAction(_ sender: Any) {
		rateOne.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateTwo.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateThree.setImage(UIImage(named: "StarUnselected"), for: .normal)
		rateFour.setImage(UIImage(named: "StarUnselected"), for: .normal)
		rateFive.setImage(UIImage(named: "StarUnselected"), for: .normal)
		starsCount = "2"
	}
	@IBAction func rateThreeAction(_ sender: Any) {
		rateOne.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateTwo.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateThree.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateFour.setImage(UIImage(named: "StarUnselected"), for: .normal)
		rateFive.setImage(UIImage(named: "StarUnselected"), for: .normal)
		starsCount = "3"
	}
	@IBAction func rateFourAction(_ sender: Any) {
		rateOne.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateTwo.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateThree.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateFour.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateFive.setImage(UIImage(named: "StarUnselected"), for: .normal)
		starsCount = "4"
	}
	@IBAction func rateFiveAction(_ sender: Any) {
		rateOne.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateTwo.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateThree.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateFour.setImage(UIImage(named: "StarSelected"), for: .normal)
		rateFive.setImage(UIImage(named: "StarSelected"), for: .normal)
		starsCount = "5"
	}
	
	@IBAction func quizOptionOne(_ sender: Any) {
		buttonViews.isHidden = true
		if correctAnswer == "One"  || correctAnswer == "All" {
			questionsRight += 1
			if actNumber == 1 {
				actNumber += 1
				utterScript(passedScript: buildActTwo(correctAnswer: true))
			} else if actNumber == 2 {
				actNumber += 1
				utterScript(passedScript: buildActThree(correctAnswer: true))
			} else if actNumber == 3 {
				utterScript(passedScript: buildActFour(correctAnswer: true))
			}
		} else {
			if actNumber == 1 {
				actNumber += 1
				utterScript(passedScript: buildActTwo(correctAnswer: false))
			} else if actNumber == 2 {
				actNumber += 1
				utterScript(passedScript: buildActThree(correctAnswer: false))
			} else if actNumber == 3 {
				utterScript(passedScript: buildActFour(correctAnswer: false))
			}
		}
	}
	@IBAction func quizOptionTwo(_ sender: Any) {
		buttonViews.isHidden = true
		if correctAnswer == "Two"  || correctAnswer == "All" {
			questionsRight += 1
			if actNumber == 1 {
				actNumber += 1
				utterScript(passedScript: buildActTwo(correctAnswer: true))
			} else if actNumber == 2 {
				actNumber += 1
				utterScript(passedScript: buildActThree(correctAnswer: true))
			} else if actNumber == 3 {
				utterScript(passedScript: buildActFour(correctAnswer: true))
			}
		} else {
			if actNumber == 1 {
				actNumber += 1
				utterScript(passedScript: buildActTwo(correctAnswer: false))
			} else if actNumber == 2 {
				actNumber += 1
				utterScript(passedScript: buildActThree(correctAnswer: false))
			} else if actNumber == 3 {
				utterScript(passedScript: buildActFour(correctAnswer: false))
			}
		}
	}
	@IBAction func quizOptionThree(_ sender: Any) {
		buttonViews.isHidden = true
		if correctAnswer == "Three" || correctAnswer == "All" {
			questionsRight += 1
			if actNumber == 1 {
				actNumber += 1
				utterScript(passedScript: buildActTwo(correctAnswer: true))
			} else if actNumber == 2 {
				actNumber += 1
				utterScript(passedScript: buildActThree(correctAnswer: true))
			} else if actNumber == 3 {
				utterScript(passedScript: buildActFour(correctAnswer: true))
			}
		} else {
			if actNumber == 1 {
				actNumber += 1
				utterScript(passedScript: buildActTwo(correctAnswer: false))
			} else if actNumber == 2 {
				actNumber += 1
				utterScript(passedScript: buildActThree(correctAnswer: false))
			} else if actNumber == 3 {
				utterScript(passedScript: buildActFour(correctAnswer: false))
			}
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if applicationDict["personalGender"]! == "Male" {
			hisHer = "His"
			heShe = "He"
			himHer = "Him"
		} else {
			hisHer = "Her"
			heShe = "She"
			himHer = "Her"
		}
		
		buttonViews.isHidden = true
		rateViews.isHidden = true
		speechSynthesizer.delegate = self
		for voice in AVSpeechSynthesisVoice.speechVoices() {
			if voice.name == "Samantha (Enhanced)" {
				voiceToUse = voice
			}
		}
		
		utterScript(passedScript: buildActOne())
	
    }
	
	func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
		teacherImage.image = UIImage(named: imageStringArray[imageStringIndex])
		imageStringIndex += 1
		if utterance.volume == 0.99 {
			initialiseQuiz()
		} else if utterance.volume == 0.98 {
			rateViews.isHidden = false
			starsCount = "0"
		}
	}
	func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
		if utterance.volume == 0.99 {
			buttonViews.isHidden = false
		}
	}
	
	func initialiseQuiz() {

		correctAnswer = quizQuestion?["correct"]!
	
		quizOutletOne.setTitle(quizQuestion?["ansOne"], for: .normal)
		quizOutletTwo.setTitle(quizQuestion?["ansTwo"], for: .normal)
		quizOutletThree.setTitle(quizQuestion?["ansThree"], for: .normal)
	
	}
	func utterScript(passedScript: [[String: String]]) {
	
		for speechItem in passedScript {
		
			imageStringArray.append(speechItem["image"]!)
			
			let speechUtterance = AVSpeechUtterance(string: speechItem["text"]!)
			speechUtterance.voice = voiceToUse
			speechUtterance.postUtteranceDelay = Double(speechItem["post"]!)!
			speechUtterance.preUtteranceDelay = Double(speechItem["pre"]!)!
			speechUtterance.volume = Float(speechItem["vol"]!)!
			speechSynthesizer.speak(speechUtterance)
		
		}
	
	}
	func saveResults(saveName: String, saveCountry: String, saveGender: String, saveSubject: String, saveGov: String, q1: String?, q2: String?, q3: String?, rateStars: String?) {
	
		let sessionManagedObject = Session(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
		
		sessionManagedObject.name = saveName
		sessionManagedObject.country = saveCountry
		sessionManagedObject.gender = saveGender
		sessionManagedObject.subject = saveSubject
		sessionManagedObject.government = saveGov
		sessionManagedObject.q1correct = q1
		sessionManagedObject.q2correct = q2
		sessionManagedObject.q3correct = q3
		sessionManagedObject.stars = rateStars

		(UIApplication.shared.delegate as! AppDelegate).saveContext()
	
	}
	
	func buildActOne() -> [[String: String]] {
	
	
		// Variable Declaration
		
		var speechScript = [[String: String]]()
		
		var eduDeptOne: String?
		var eduDeptTwo: String?
		var imageTwo: String?
		
		
		// Variable Intialisation
		
		switch applicationDict["governmentType"]! {
			case "Autonomous Anarcho-Syndicalist Commune":
				eduDeptOne = "the last buy weekly meeting."
				eduDeptTwo = "In that meeting, the executive officer and a 72 percent majority of the commune decided that in todays class we would cover"
				imageTwo = "Class02-Update-Commune"
			case "Democratic Republic":
				eduDeptOne = "the department of education."
				eduDeptTwo = "In today's class we are going to be learning about"
				imageTwo = "Class02-Update-Democratic"
			case "Totalitarian Dictatorship":
				eduDeptOne = "the supreme ruler, " + applicationDict["personalName"]! + "'s palace."
				eduDeptTwo = heShe! + " has decreed that today we shall learn of " + hisHer! + " glorious discovery of"
				imageTwo = "Class02-Update-Dictator"
			default:
				 print("Error: Switch 01 Exaustive - govType: " + applicationDict["governmentType"]!)
		}
		
		speechScript = [
			["text": "Good morning class", "image": "Class01-GoodMorning", "pre": "3", "post": "1", "vol": "1.00"],
			["text": "I have just recieved the latest educational package from " + eduDeptOne!, "image": imageTwo!, "pre": "0", "post": "0", "vol": "1.00"],
			["text": eduDeptTwo!, "image": "Class03-Today", "pre": "0", "post": "0", "vol": "1.00"],
			["text": applicationDict["classType"]!, "image": "Class04-" + applicationDict["classType"]!, "pre": "0", "post": "1", "vol": "1.00"]
		]

		// NATIONALISM SEGMENT GOES HERE
		
		
		
		if applicationDict["governmentType"] == "Democratic Republic" {
			
			// Democratic
		
			if applicationDict["classType"]! == "Science" {
		
				// Science - Democratic
			
				speechScript.append(contentsOf: [
					["text": "In todays lesson, we will be looking again at the properties of the atom.", "image": "Class-DS-1", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "From my logs I can see that most of you have completed the online reading. So lets start you off with an easy question.", "image": "Class-DS-1", "pre": "0", "post": "0.5", "vol": "1.00"],
					["text": "What is the magnetic charge of an electron?", "image": "Class-DS-2", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, positive, B, negative, or C, neutral.", "image": "Class-DS-2", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Positive", "ansTwo": "B: Negative", "ansThree": "C: Neutral", "correct": "Two", "wrongString": "The correct answer was B: negative. I have added the relevant reading to your homework log.", "rightString": "Correct! Electrons have a negative charge."]
		
			} else if applicationDict["classType"]! == "History" {
		
				// History - Democratic
				
				speechScript.append(contentsOf: [
					["text": "In todays lesson, we will be looking at the ancient greeks, and more specifically, the athenians", "image": "Class-DH-1", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "From my logs I can see that most of you have completed the online reading. So lets start you off with an easy question.", "image": "Class-DH-2", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Philosophers were important and notable figures in ancient athenian culture.", "image": "Class-DH-3", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "I want you to spot the odd one out.", "image": "Class-DH-4", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, epicurius, B, deycarte, or C, pythagoras.", "image": "Class-DH-5", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Epicurius", "ansTwo": "B: Descartes", "ansThree": "C: Pythagoras", "correct": "Two", "wrongString": "The correct answer was B: deycarte, he was a french philosopher and mathematician. I have added some reading on philosophers to your homework log.", "rightString": "Correct! Deycarte was a french philosopher from the sixteen hundreds."]
			
		
			} else if applicationDict["classType"]! == "Maths" {
		
				// Maths - Democratic
				
				speechScript.append(contentsOf: [
					["text": "Todays class will cover some basic geometry and linear algebra.", "image": "Class-DM-1", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "From my logs I can see that most of you have completed the online questions, but let's start you off nice and easy", "image": "Class-DM-1", "pre": "0", "post": "0.5", "vol": "1.00"],
					["text": "As you should all know, Pythagorases theorem allows us to calculate the length of any side of a specific type of triangle, if you know the lengths of the two other sides.", "image": "Class-DM-2", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "What is the specific type of triangle that Pythagorases theorem requires?", "image": "Class-DM-3", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, equilateral, B, right angled, or C, scaylean.", "image": "Class-DM-3", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Equilateral", "ansTwo": "B: Right Angled", "ansThree": "C: Scalene", "correct": "Two", "wrongString": "The correct answer was B: Right Angled. I have added the relevant reading to your homework log.", "rightString": "Correct! The triangle must be right angled for pythagorases theorem to work."]
		
			} else {
				print("Fail02: Act 1");
			}
			
		} else if applicationDict["governmentType"] == "Totalitarian Dictatorship" {
		
			// Totalitarian
		
			if applicationDict["classType"]! == "Science" {
		
				// Science - Totalitarian
			
				speechScript.append(contentsOf: [
					["text": "In todays lesson, we will be looking again at the glorious leader's discovery of the atom.", "image": "Class-TS-1", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "From my logs I can see that most of you have completed the online reading. So lets start you off with an easy question.", "image": "Class-TS-1", "pre": "0", "post": "0.5", "vol": "1.00"],
					["text": "How did the glorious leader discover the atom", "image": "Class-TS-2", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, by pulling the first atom out of " + hisHer! + " right thumb, B, the glorious leader did not discover the atom, or C, by paying off J J Thompson.", "image": "Class-TS-2", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Out Of " + hisHer! + " Thumb", "ansTwo": "B: Didn't Discover", "ansThree": "C: J.J Thompson", "correct": "One", "wrongString": "The correct answer was A: Out of " + hisHer! + " thumb. I have notified the relevant authorities of your blasphemy", "rightString": "Correct! Praise the glorious leader and " + hisHer! + " glorious thumb!"]
		
			} else if applicationDict["classType"]! == "History" {
		
				// History - Totalitarian
				
				speechScript.append(contentsOf: [
					["text": "In todays lesson, we will be looking at the glorious defeat, of our enemies to the north.", "image": "Class-TH-1", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "From my logs I can see that most of you have completed the online reading. So lets start you off with an easy question.", "image": "Class-TH-1", "pre": "0", "post": "0.5", "vol": "1.00"],
					["text": "How did the filthy peasants of Northy-Stann offend our glorious leader", "image": "Class-TH-2", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Invoking " + hisHer! + " deadly wrath.", "image": "Class-TH-3", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Was it A, there was no offence, B, by not paying their taxes, or C, by being filthy cannibals.", "image": "Class-TH-3", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: No Offence", "ansTwo": "B: Taxes", "ansThree": "C: Filthy Cannibals", "correct": "Three", "wrongString": "The correct answer was C: Filty cannibals. As you should all know, all northeners are cannibals.", "rightString": "Correct! All northeners are filthy cannibals."]
		
			} else if applicationDict["classType"]! == "Maths" {
		
				// Maths - Totalitarian
				
				speechScript.append(contentsOf: [
					["text": "Todays class will cover general glorious mathematics.", "image": "Class-TM-1", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "From my logs I can see that most of you have completed the online questions, but let's start you off nice and easy.", "image": "Class-TM-1", "pre": "0", "post": "0.5", "vol": "1.00"],
					["text": "As you should all know, one of the glorious leader's first great theorems grants us the knowledge to calculate the area of a square.", "image": "Class-TM-2", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "What is the glorious formula that our leader discovered, allowing us to make this calculation?", "image": "Class-TM-3", "pre": "1", "post": "0", "vol": "0.99"],
					["text": "Is it A, the width plus the height, B, the width times the height, or C, the width divided by the height.", "image": "Class-TM-3", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Width + Height", "ansTwo": "B: Width * Height", "ansThree": "C: Width / Height", "correct": "Two", "wrongString": "The correct answer was B: width times height. I have added the relevant reading to your homework log.", "rightString": "Correct! Multiplying the width by the height gives the area of the square."]
		
			} else {
				print("Fail03: Act 1");
			}
		
		
		} else if applicationDict["governmentType"] == "Autonomous Anarcho-Syndicalist Commune" {
		
			// Commune
			
			speechScript.append(contentsOf: [
				["text": "Hmm", "image": "Class-C-1", "pre": "0", "post": "1", "vol": "1.00"],
				["text": "It seems like there might be a bit of a problem.", "image": "Class-C-1", "pre": "0", "post": "1", "vol": "1.00"],
				["text": "The last meeting of the sub executive committee decided that we would cover " + applicationDict["classType"]! + " in today's lesson.", "image": "Class-C-2", "pre": "0", "post": "0", "vol": "1.00"],
				["text": "It seems however that they were not able to achieve a civil majority in voting on the questions for todays class.", "image": "Class-C-Add-1", "pre": "0", "post": "0", "vol": "1.00"],
				["text": "Error. ", "image": "Class-C-3", "pre": "1", "post": "0", "vol": "1.00"],
				["text": "Error. No questions available.", "image": "Class-C-3", "pre": "0", "post": "0", "vol": "1.00"],
				["text": "Defaulting instead to infomational package on the benefits of living in an Autonomous Anarko Syndicalist Commune.", "image": "Class-C-4", "pre": "0", "post": "0", "vol": "1.00"],
				["text": "Good morning children, today we're going to be learning about our fantastic system of government, Autonomous Anarko Syndicalistic Communes.", "image": "Class-C-5", "pre": "2", "post": "0", "vol": "1.00"],
				["text": "What is the best thing about living in an Autonomous Anarko Syndicalist Commune?", "image": "Class-C-6", "pre": "0", "post": "0", "vol": "0.99"],
				["text": "Is it A, the highly efficient manner in which the commune accomplishes it's tasks, B, the fantastic system of allowing everyone to have a turn acting as an executive officer for a week, or C, how happy living in such an egalitarian society makes everyone.", "image": "Class-C-6", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
			quizQuestion = ["ansOne": "A: Efficiency", "ansTwo": "B: Everyone Leads", "ansThree": "C: Happiness", "correct": "All", "wrongString": "This should not play", "rightString": "Trick question! They are all correct! We live in a fantastic and equal society where much is accomplished every day. Aren't you happy we live in such a fantastic commune?"]
		
		
		} else {
			print("Fail01: Act 1");
		}
		
		return speechScript
	
	}
	func buildActTwo(correctAnswer: Bool) -> [[String: String]] {
	
		var speechScript = [[String: String]]()
		
		if correctAnswer {
			q1Right = "True"
			speechScript = [["text": (quizQuestion?["rightString"])!, "image": "Class05-Correct", "pre": "0", "post": "0", "vol": "1.00"]]
		} else {
			q1Right = "False"
			speechScript = [["text": (quizQuestion?["wrongString"])!, "image": "Class05-Incorrect", "pre": "0", "post": "0", "vol": "1.00"]]
		}
		
		if applicationDict["governmentType"] == "Democratic Republic" {
			
			// Democratic
		
			if applicationDict["classType"]! == "Science" {
		
				// Science - Democratic
			
				speechScript.append(contentsOf: [
					["text": "Moving on, an atom is made up of a mix of pro-tons, neutrons and electrons.", "image": "Class-DS-3", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "pro-tons and Neutrons however are made up of even smaller particles called kwahrks.", "image": "Class-DS-4", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Which kwahrks make up a pro-ton?", "image": "Class-DS-5", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, two up kwahrks and one down kwahrk, B, one strange kwahrk and two charm kwahrks, or C, two pro kwahrks and one new kwahrk.", "image": "Class-DS-5", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Two Up, One Down", "ansTwo": "B: One Strange, Two Charm", "ansThree": "C: Two Pro, One Nu", "correct": "One", "wrongString": "Incorrect! The  answer was A: two up and one down. I have added the relevant reading to your homework log.", "rightString": "Correct! A pro-ton is made up of two up kwahrks and one down kwahrk."]
		
			} else if applicationDict["classType"]! == "History" {
		
				// History - Democratic
				
				speechScript.append(contentsOf: [
					["text": "Alright, moving on. Another thing the ancient athenians are credited with is inventing the idea of a democracy, which also happens to be the way our government is run here, in " + applicationDict["personalCountry"]!, "image": "Class-DH-6", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Todays democracies are obviously run differently to those in ancient athens. ", "image": "Class-DH-6", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "How did athenians usually cast their vote in the general assemblies?", "image": "Class-DH-7", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Was it A, by shouting their agreement or disagreement, B, by dropping a piece of cloth in a yes or no container, or C, by raising their hand", "image": "Class-DH-8", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Shouting", "ansTwo": "B: Dropping Cloth", "ansThree": "C: Raising A Hand", "correct": "Three", "wrongString": "The correct answer was C: by raising their hand. Sometimes stones were also used but normally, they would raise their hand when called upon to agree or disagree on a vote.", "rightString": "Well done! Athenians would normally raise their hand to vote yes or no."]
				
			} else if applicationDict["classType"]! == "Maths" {
		
				// Maths - Democratic
				
				speechScript.append(contentsOf: [
					["text": "Right, moving on, in a second I'm going to display a graph for you. I want you to pick the function that best describes the line's behaviour in this graph.", "image": "Class-DM-4", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Ok, which equation is it?", "image": "Class-DM-5", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, y = x to the power of 3, B, y = sign x, or C, y = x to the power of 2, plus 3 x, minus 7.", "image": "Class-DM-Add-1", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: y = x^3", "ansTwo": "B: y = sin(x)", "ansThree": "C: y = x^2 + 3x - 7", "correct": "One", "wrongString": "Incorrect! The correct answer was A: x to the power of 3. Any function with only x to the power of an odd number will always form this graph. I have added the relevant questions to your homework log.", "rightString": "Correct! Nicely done!"]
		
			} else {
				print("Fail02: Act 2");
			}
			
		} else if applicationDict["governmentType"] == "Totalitarian Dictatorship" {
		
			// Totalitarian
			
			if applicationDict["classType"]! == "Science" {
		
				// Science - Totalitarian
			
				speechScript.append(contentsOf: [
					["text": "Moving on, after the glorious leader discovered the first atom", "image": "Class-TS-3", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "How did " + heShe! + " bring the rest of the elements to " + applicationDict["personalCountry"]! + "?", "image": "Class-TS-4", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, chop off " + hisHer! + " right thumb as a glorious sacrifice, creating the rest of the elements, B, the glorious leader never chopped off " + hisHer! + " thumb, or C, flew out on a rocket to your anus, and collected the rest of the elements from there.", "image": "Class-TS-5", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Thumb Sacrifice", "ansTwo": "B: Two Thumbs", "ansThree": "C: Uranus", "correct": "Three", "wrongString": "Incorrect! The correct answer was C: collecting the other elements from your anus. What are you, stupid?", "rightString": "Correct! Praise the glorious leader and " + hisHer! + " glorious journey to your anus."]
		
			} else if applicationDict["classType"]! == "History" {
		
				// History - Totalitarian
				
				speechScript.append(contentsOf: [
					["text": "Moving on", "image": "Class-TH-4", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "How were the prisoners of war treated by the glorious leader after " + hisHer! + " successful conquest of the north?", "image": "Class-TH-5", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, they were treated very poor lee, B, they were treated with they respect that fit their station, or C, there weren't any prisoners of war.", "image": "Class-TH-5", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Poorly", "ansTwo": "B: With Respect", "ansThree": "C: No Prisoners", "correct": "Two", "wrongString": "The correct answer was B: With respect fitting their station. But seeing as their station was that of filthy cannibals, they were all executed.", "rightString": "Correct! They were treated with the respect fitting their station. But seeing as their station was that of filthy cannibals, they were all immediately executed."]
		
			} else if applicationDict["classType"]! == "Maths" {
		
				// Maths - Totalitarian
				
				speechScript.append(contentsOf: [
					["text": "Alright, moving on. As we all know the glorious leader has recently returned from successfully vanquishing our evil northen neighbours in Northy Stan.", "image": "Class-TM-4", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "In light of this happy achievement, for the rest of the lesson we will be doing maths specifically related to this topic, to prepare you for your mandatory military service.", "image": "Class-TM-5", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "The glorious leader invaded the north with a force of only 15 thousand brave men and women.", "image": "Class-TM-6", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "In the fighting, our forces suffered zero casualties.", "image": "Class-TM-7", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "During their conquest, they killed of over 30 million filthy northeners.", "image": "Class-TM-8", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Using these numbers, how many of those disgusting northeners can we conclude each brave citizen of " + applicationDict["personalCountry"]! + " is worth?", "image": "Class-TM-9", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, two thousand, B, five thousand, or C, fifteen thousand", "image": "Class-TM-9", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: 2000", "ansTwo": "B: 5000", "ansThree": "C: 15 000", "correct": "One", "wrongString": "Using these numbers, the correct answer was A: 2000, although we all really know that one citizen of " + applicationDict["personalCountry"]! + " is worth millions of northeners.", "rightString": "You are technically correct, although we all really know that one citizen of " + applicationDict["personalCountry"]! + " is worth millions of northeners."]
		
			} else {
				print("Fail03: Act 2");
			}
		
		
		} else if applicationDict["governmentType"] == "Autonomous Anarcho-Syndicalist Commune" {
		
			// Commune
			
			speechScript.append(contentsOf: [
				["text": "Moving on, as we all know, an Autonomous Anarko Syndicalistic Commune is fantastic and well organised system of governement.", "image": "Class-C-7", "pre": "1", "post": "0", "vol": "1.00"],
				["text": "However, everyone is entitled to their own opinion so what do you think the worst part of living in an Autonomous Anarko Syndicalistic Commune is?", "image": "Class-C-8", "pre": "0", "post": "0", "vol": "0.99"],
				["text": "Is it A, there are no negatives to living in an Autonomous Anarko Syndicalistic Commune, B, there are no negatives to living in an Autonomous Anarko Syndicalistic Commune, or C, there are no negatives to living in an Autonomous Anarko Syndicalistic Commune", "image": "Class-C-8", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
			quizQuestion = ["ansOne": "A: No Negatives", "ansTwo": "B: No Negatives", "ansThree": "C: No Negatives", "correct": "All", "wrongString": "Should not play", "rightString": "Correct! There are no negatives to living in an Autonomous Anarko Syndicalistic Commune. You are really smart!"]
		
		
		} else {
			print("Fail01: Act 2");
		}
		
		return speechScript

	}
	func buildActThree(correctAnswer: Bool) -> [[String: String]] {
	
		var speechScript = [[String: String]]()
		
		if correctAnswer {
			q2Right = "True"
			speechScript = [["text": (quizQuestion?["rightString"])!, "image": "Class05-Correct", "pre": "0", "post": "0", "vol": "1.00"]]
		} else {
			q2Right = "False"
			speechScript = [["text": (quizQuestion?["wrongString"])!, "image": "Class05-Incorrect", "pre": "0", "post": "0", "vol": "1.00"]]
		}
		
		if applicationDict["governmentType"] == "Democratic Republic" {
			
			// Democratic
		
			if applicationDict["classType"]! == "Science" {
		
				// Science - Democratic
			
				speechScript.append(contentsOf: [
					["text": "Finally, we're going to talk about Heisenberg's uncertainty principal.", "image": "Class-DS-6", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "It states that if I know the exact position of an electron, it is impossible for me to know another property of that electron.", "image": "Class-DS-6", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "What is that property?", "image": "Class-DS-7", "pre": "0", "post": "0.5", "vol": "0.99"],
					["text": "Is it A, it's momentum, B, it's voltage, or C, it's size", "image": "Class-DS-7", "pre": "0", "post": "0.5", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Momentum", "ansTwo": "B: Voltage", "ansThree": "C: Size", "correct": "One", "wrongString": "Incorrect! The  answer was A: it's momentum, or speed. I have added the relevant reading to your homework log.", "rightString": "Correct! If you know the exact posistion of an electron it is impossible to detirmine it's momentum."]
		
			} else if applicationDict["classType"]! == "History" {
		
				// History - Democratic
				
				speechScript.append(contentsOf: [
					["text": "And finally for todays lesson, we will look at the wars that Athens fought in.", "image": "Class-DH-9", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "One particular battle gave it's name to a modern day olympic sport.", "image": "Class-DH-9", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Which of the following sports was also the name of an athenian battle?", "image": "Class-DH-10", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Was it A, discus, B, pentathlon, or C, marathon", "image": "Class-DH-10", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Discus", "ansTwo": "B: Pentathlon", "ansThree": "C: Marathon", "correct": "Three", "wrongString": "The correct answer was C: Marathon. The sport gets it's name from a runner who had to run between the battle and athens which was around 26 miles. I have added the relevant reading to your homework log.", "rightString": "Thats right! The battle of marathon was around 26 miles away from athens, which is where the sport gets both it's length and name."]
		
		
			} else if applicationDict["classType"]! == "Maths" {
		
				// Maths - Democratic
				
				speechScript.append(contentsOf: [
					["text": "And finally, a question on volume.", "image": "Class-DM-6", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "If I wanted to calculate the volume of this cylynder", "image": "Class-DM-7", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Which formula should I use?", "image": "Class-DM-8", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, v equals pie h are squared, B, v equals pie are squared plus h, or C, v equals 2 are plus ayche to the power of 2", "image": "Class-DM-8", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: v = πhr^2", "ansTwo": "B: v = πr^2 + h", "ansThree": "C: v = 2r + h", "correct": "One", "wrongString": "The correct answer was A: v equals pie ayche are squared. I have added the relevant questions to your homework log.", "rightString": "Correct! Good job!"]
		
			} else {
				print("Fail02: Act 3");
			}
			
		} else if applicationDict["governmentType"] == "Totalitarian Dictatorship" {
		
		// Totalitarian
		
			if applicationDict["classType"]! == "Science" {
		
				// Science - Totalitarian
			
				speechScript.append(contentsOf: [
					["text": "Finally, what is the weight of a single electron?", "image": "Class-TS-6", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, 0 point 0 5 a m u, B, 0 point 0 0 5 a m u, or C, 0 point 0 0 0 5 a m u.", "image": "Class-TS-6", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: 0.05 amu", "ansTwo": "B: 0.005 amu", "ansThree": "C: 0.0005 amu", "correct": "Three", "wrongString": "Incorrect! The answer was C: 0 point 0 0 0 5 a m u. We know this fact because the glorious leader decreed it as one of " + hisHer! + " scientific testaments, after returning from your anus.", "rightString": "You are correct!"]
		
			} else if applicationDict["classType"]! == "History" {
		
				// History - Totalitarian
				
				speechScript.append(contentsOf: [
					["text": "Finally, in your free and honest opinion", "image": "Class-TH-6", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Do you think that glorious emperor " + applicationDict["personalName"]! + " was justified in " + hisHer! + "attack of the north?", "image": "Class-TH-7", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Remember, you are free to choose what ever answer you wish.", "image": "Class-TH-8", "pre": "0", "post": "1", "vol": "0.99"],
					["text": "Do you pick A, yes, B, no, or C, undecided", "image": "Class-TH-7", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: Yes", "ansTwo": "B: No", "ansThree": "C: Undecided", "correct": "One", "wrongString": "This was an open ended question but you picked the wrong answer. You have been placed on the known northern sympathisers list.", "rightString": "Thats right! Good job, you've been brainwashed, I mean tort very well. "]
		
			} else if applicationDict["classType"]! == "Maths" {
		
				// Maths - Totalitarian
				
				speechScript.append(contentsOf: [
					["text": "Alright, onto the last question for the day on Money.", "image": "Class-TM-10", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "Let say I have 170 " + applicationDict["personalCountry"]! + "ian dollars in my pocket.", "image": "Class-TM-10", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "I head down to the prisoners of war slave market and see that prisoners are selling for 23 dollars each.", "image": "Class-TM-10", "pre": "0", "post": "0", "vol": "1.00"],
					["text": "How many filthy Northy Stanian prisoners can I buy?.", "image": "Class-TM-11", "pre": "0", "post": "0", "vol": "0.99"],
					["text": "Is it A, 5, B, 7, or C, 9", "image": "Class-TM-11", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
				quizQuestion = ["ansOne": "A: 5", "ansTwo": "B: 7", "ansThree": "C: 9", "correct": "Two", "wrongString": "Incorrect. You can only buy 7 prisoners of war with 9 dollars to spare.", "rightString": "Correct! After buying 7 prisoners of war, you would have 9 dollars left."]
		
			} else {
				print("Fail03: Act 2");
			}
		
		
		} else if applicationDict["governmentType"] == "Autonomous Anarcho-Syndicalist Commune" {
		
			// Commune
			
			speechScript.append(contentsOf: [
				["text": "Alright, onto the last question and given how fantastic you've been in the lesson so far, I'm sure you'll nail this one!", "image": "Class-C-9", "pre": "1", "post": "0", "vol": "1.00"],
				["text": "What in your opinion is the best system of government?", "image": "Class-C-10", "pre": "0", "post": "0", "vol": "0.99"],
				["text": "Is it A, the boring and corrupt democratic system, B, the terribly oppressive and tyranical regieme of a totalitarian dictatorship, or C, the beacon of light and the saviour of governments world wide, Autonomous Anarko Syndicalistic Communes. I think the answer is pretty obvious don't you?", "image": "Class-C-10", "pre": "0", "post": "0", "vol": "1.00"]
				])
				
			quizQuestion = ["ansOne": "A: Boring Democratic", "ansTwo": "B: Scary Dictatorship", "ansThree": "C: Amazing AASC", "correct": "Three", "wrongString": "The correct answer was C: Autonomous Anarko Syndicalistic Commune. You have been reported to the sub executive judicial committee and will stand trial for your indescresion. Unfortunately the committee is having a slight backlog at the moment so your case will be heard in around 20 to 25 years.", "rightString": "Correct! Autonomous Anarko Syndicalistic Commune is clearly the best system of government. Looks like we've got a possible future executive on our hands. Hahaha, I'm just kidding, the role is passed around the commune every week, just my little joke."]
		
		
		} else {
			print("Fail01: Act 3");
		}
		
		return speechScript

	}
	func buildActFour(correctAnswer: Bool) -> [[String: String]] {
		
		var speechScript = [[String: String]]()
		
		if correctAnswer {
			q3Right = "True"
			speechScript = [["text": (quizQuestion?["rightString"])!, "image": "Class05-Correct", "pre": "0", "post": "0", "vol": "1.00"]]
		} else {
			q3Right = "False"
			speechScript = [["text": (quizQuestion?["wrongString"])!, "image": "Class05-Incorrect", "pre": "0", "post": "0", "vol": "1.00"]]
		}
		
		speechScript.append(contentsOf: [
			["text": "That concludes todays lesson.", "image": "Class-Final-1", "pre": "1", "post": "0", "vol": "1.00"],
			["text": "Let's have a look, and see how well you did.", "image": "Class-Final-2", "pre": "0", "post": "2", "vol": "1.00"]
		])
		
		switch (questionsRight) {
			case 0:
				speechScript.append(contentsOf: [
					["text": "0 out of 3.", "image": "Class-Final-03-0", "pre": "0", "post": "1", "vol": "1.00"],
					["text": "That was abysimal", "image": "Class-Final-04-0", "pre": "0", "post": "2", "vol": "1.00"]
				])
			case 1:
				speechScript.append(contentsOf: [
					["text": "1 out of 3.", "image": "Class-Final-03-1", "pre": "0", "post": "1", "vol": "1.00"],
					["text": "You maybe should consider doing some work before class next time if you don't want to flunk out.", "image": "Class-Final-04-1", "pre": "0", "post": "1", "vol": "1.00"]
				])
			case 2:
				speechScript.append(contentsOf: [
					["text": "2 out of 3.", "image": "Class-Final-03-2", "pre": "0", "post": "1", "vol": "1.00"],
					["text": "Decent job, you passed the class", "image": "Class-Final-04-2", "pre": "0", "post": "1", "vol": "1.00"]
				])
			case 3:
				var quipString: String?
				if applicationDict["governmentType"] == "Democratic Republic" {
					quipString = "Looks like we could have a future president on our hands!"
				} else if applicationDict["governmentType"] == "Totalitarian Dictatorship" {
					quipString = "The glorious leader has clearly bestowed great wisdom upon you."
				} else if applicationDict["governmentType"] == "Autonomous Anarcho-Syndicalist Commune" {
					quipString = "When it's your week, I'm sure you'll make a fine executive officer!"
				} else {
					quipString = "I'm very impressed"
				}
				speechScript.append(contentsOf: [
					["text": "3 out of 3.", "image": "Class-Final-03-3", "pre": "0", "post": "1", "vol": "1.00"],
					["text": "Stellar job, you're a star!", "image": "Class-Final-04-3", "pre": "0", "post": "0", "vol": "1.00"],
					["text": quipString!, "image": "Class-Final-04-3", "pre": "0", "post": "1", "vol": "1.00"]
				])
			default:
				print("Problem")
		}
		
		speechScript.append(["text": "Thank you for participating in this provo type. Please rate your experience below.", "image": "Class01-GoodMorning", "pre": "2", "post": "0", "vol": "0.98"])
		
		return speechScript
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "finishLesson"  {
			saveResults(saveName: applicationDict["personalName"]!, saveCountry: applicationDict["personalCountry"]!, saveGender: applicationDict["personalGender"]!, saveSubject: applicationDict["classType"]!, saveGov: applicationDict["governmentRaw"]!, q1: q1Right, q2: q2Right, q3: q3Right, rateStars: starsCount)
		} else if segue.identifier == "finishEarly" {
			speechSynthesizer.stopSpeaking(at: AVSpeechBoundary(rawValue: 0)!)
//			saveResults(saveName: applicationDict["personalName"]!, saveCountry: applicationDict["personalCountry"]!, saveGender: applicationDict["personalGender"]!, saveSubject: applicationDict["classType"]!, saveGov: applicationDict["governmentRaw"]!, q1: q1Right, q2: q2Right, q3: q3Right, rateStars: starsCount)
		}
		
    }

}
