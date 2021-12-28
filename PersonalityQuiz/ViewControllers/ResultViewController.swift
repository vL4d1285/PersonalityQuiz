//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalOutlet: UILabel!
    @IBOutlet var descriptionOutlet: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        animalDefinition()
        
    }
}

extension ResultViewController {
    
    private func animalDefinition () {
        
        var animalsDict: [Animal: Int] = [:]
        let animals = answers.map {$0.animal}
        
        for animal in animals {
            if let currentAnimal = animalsDict[animal] {
                animalsDict.updateValue(currentAnimal + 1, forKey: animal)
            } else {
                animalsDict[animal] = 1
            }
        }
        
        let sortedAnimalsDict = animalsDict.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedAnimalsDict.first?.key else { return }
               
        updateUI(animal: mostFrequencyAnimal)
        
    }
    
    private func updateUI ( animal: Animal?) {
        animalOutlet.text = "Вы - \(animal?.rawValue ?? "_") "
        descriptionOutlet.text = animal?.definition ?? ""
    }
}


