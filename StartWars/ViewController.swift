//
//  ViewController.swift
//  StartWars
//
//  Created by Elias Escobar Ramirez on 2018-04-21.
//  Copyright © 2018 Elias Escobar Ramirez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let baseURL = "https://swapi.co/api/"
    let getPersonEndPoint = "people/1/"
    
    // No hola

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getPersonURL = URL(string: baseURL + getPersonEndPoint)!
        Alamofire.request(getPersonURL).responseJSON { response in
            
            if response.result.isSuccess {
                print("This was a success!!!")
            } else {
                print("Oh no, there ws an error :(")
            }
            
            let json = response.value
            print(json as Any)
            
            let person = Person("Luke")
            let secondPerson = Person("Alex", height: 190)
            let thirdPerson = Person("Elias", height: 185, haireColor: .blond)
            //print(person)
            //print(person.getName())
            self.nameLabel.text = person.name
            self.massLabel.text = "Mass is \(person.mass)"
            self.heightLabel.text = person.hairColor.rawValue
        }
    }
    
    enum HairColor: String {
        case light = "Light"
        case brown = "Brown"
        case black = "Balck"
        case blond = "Blond"
    }
    
    
    struct Person {
        var name = "Unknowm"
        var height = 0
        var mass = 0
        var hairColor: HairColor = .blond
        var skinColor = "Unknowm"
        var eyeColor = "Unknowm"
        var gender = "Unknowm"
        var homeworld = "Unknowm"
        
        init(_ name: String) {
            self.name = name
        }
        
        init(_ name: String, height: Int, haireColor : HairColor = .blond) {
            self.name = name
            self.height = height
            self.hairColor = HairColor.blond
        }
        
        func getName() -> String {
            return self.name
        }
    }
}
