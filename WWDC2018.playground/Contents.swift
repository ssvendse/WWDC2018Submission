import UIKit
import PlaygroundSupport
import SpriteKit

/*
 
 Skyler Svendsen's WWDC - 2018 Scholarship Application Playground
 
 Asset attribution:
    People created with
    Wheelchair created by
    Landscape created with
    Wind created by
    Hearts created by
    Apple logo ...
 
 All code written by author, Skyler Svendsen
 
 Thanks for taking the time to look at this, I hope you enjoy it!
 
 */

//variables
let frame = CGRect(x: 0, y: 0, width: 800, height: 750)
let midpoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

let view = SKView(frame: frame)
var scene = SKScene(size: frame.size)

var hearts = [SKSpriteNode]()
var people = [SKSpriteNode]()
var wind = SKSpriteNode()

//functions
func createLandscape() {
    let landscape = SKSpriteNode(imageNamed: "Landscape")
    
    landscape.setScale(0.6)
    landscape.position = CGPoint(x: midpoint.x, y: midpoint.y)
    scene.addChild(landscape)
}

func createHearts() {

    for i in 0...6 {
        let heartTexture = SKTexture(imageNamed: "Heart")
        let heart = SKSpriteNode(texture: heartTexture)
        
        var heartPosition: CGPoint
        switch i {
        case 0:
            heartPosition = CGPoint(x: midpoint.x - 40, y: midpoint.y + 70)
            heart.name = "heart1"
        case 1:
            heartPosition = CGPoint(x: midpoint.x, y: midpoint.y + 150)
            heart.name = "heart2"
        case 2:
            heartPosition = CGPoint(x: midpoint.x + 10, y: midpoint.y + 60)
            heart.name = "heart3"
        case 3:
            heartPosition = CGPoint(x: midpoint.x - 40, y: midpoint.y + 20)
            heart.name = "heart4"
        case 4:
            heartPosition = CGPoint(x: midpoint.x + 30, y: midpoint.y + 105)
            heart.name = "heart5"
        case 5:
            heartPosition = CGPoint(x: midpoint.x - 30, y: midpoint.y + 115)
            heart.name = "heart6"
        case 6:
            heartPosition = CGPoint(x: midpoint.x + 40, y: midpoint.y + 20)
            heart.name = "heart1"
        default:
            heartPosition = CGPoint(x: midpoint.x, y: midpoint.y)
        }
        
        heart.position = heartPosition
        heart.setScale(0.6)
        hearts.append(heart)
        scene.addChild(heart)
    }
}

func createPeople() {
    
    for i in 0...5 {
        var person: SKSpriteNode
        var personPosition: CGPoint
        
        switch i {
        case 0:
            person = SKSpriteNode(imageNamed: "Person1")
            person.name = "Person1"
            personPosition = CGPoint(x: midpoint.x - 210, y: midpoint.y)
        case 1:
            person = SKSpriteNode(imageNamed: "Person2")
            person.name = "Person2"
            personPosition = CGPoint(x: midpoint.x - 200, y: midpoint.y - 170)
        case 2:
            person = SKSpriteNode(imageNamed: "Person3")
            person.name = "Person3"
            personPosition = CGPoint(x: midpoint.x - 80, y: midpoint.y - 230)
        case 3:
            person = SKSpriteNode(imageNamed: "Person4")
            person.name = "Person4"
            personPosition = CGPoint(x: midpoint.x + 60, y: midpoint.y - 230)
        case 4:
            person = SKSpriteNode(imageNamed: "Person5")
            person.name = "Person5"
            personPosition = CGPoint(x: midpoint.x + 200, y: midpoint.y - 170)
        case 5:
            person = SKSpriteNode(imageNamed: "Person6")
            person.name = "Person6"
            personPosition = CGPoint(x: midpoint.x + 210, y: midpoint.y)
        default:
            person = SKSpriteNode(imageNamed: "Person1")
            person.name = "Person1"
            personPosition = CGPoint(x: midpoint.x, y: midpoint.y)
        }
        
        person.position = personPosition
        person.setScale(0.6)
        people.append(person)
        scene.addChild(person)
    }
}

func createWind() {
    //create
    let windTexture = SKTexture(imageNamed: "Wind")
    wind = SKSpriteNode(texture: windTexture)
    
    wind.setScale(0.6)
    wind.position = CGPoint(x: 0, y: midpoint.y + 150)
    scene.addChild(wind)

    //actions
    let endPosition = frame.width + 150
    let moveBy = SKAction.moveBy(x: endPosition, y: 0, duration: 4.0)
    let wait = SKAction.wait(forDuration: 3)
    let warp = SKAction.moveTo(x: CGFloat(-100), duration: 0)
    
    let sequence = SKAction.sequence([moveBy, wait, warp])
    let repeatForever = SKAction.repeatForever(sequence)
    wind.run(repeatForever)
}

func moveHearts() {
    for heart in hearts {
        
    }
}

//create scene and actions
createLandscape()
createHearts()
createPeople()
createWind()

view.presentScene(scene)
PlaygroundPage.current.liveView = view







































