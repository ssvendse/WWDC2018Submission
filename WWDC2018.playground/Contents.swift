import UIKit
import PlaygroundSupport
import SpriteKit

let frame = CGRect(x: 0, y: 0, width: 800, height: 750)
let midpoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
let treePosition = CGPoint(x: midpoint.x, y: midpoint.y + frame.size.height * 0.25)

let view = SKView(frame: frame)
var scene = SKScene(size: frame.size)

func createLandscape() {
    let landscape = SKSpriteNode(imageNamed: "Landscape")
    
    landscape.setScale(0.6)
    landscape.position = CGPoint(x: midpoint.x, y: midpoint.y)
    scene.addChild(landscape)
}

func createHearts() {
    var hearts = [SKSpriteNode]()

    for i in 0...6 {
        let heart = SKSpriteNode(imageNamed: "Heart")
        
        var heartPosition: CGPoint
        switch i {
        case 0:
            heartPosition = CGPoint(x: midpoint.x - 40, y: midpoint.y + 70)
        case 1:
            heartPosition = CGPoint(x: midpoint.x, y: midpoint.y + 150)
        case 2:
            heartPosition = CGPoint(x: midpoint.x + 10, y: midpoint.y + 60)
        case 3:
            heartPosition = CGPoint(x: midpoint.x - 40, y: midpoint.y + 20)
        case 4:
            heartPosition = CGPoint(x: midpoint.x + 30, y: midpoint.y + 105)
        case 5:
            heartPosition = CGPoint(x: midpoint.x - 30, y: midpoint.y + 115)
        case 6:
            heartPosition = CGPoint(x: midpoint.x + 40, y: midpoint.y + 20)
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
    var people = [SKSpriteNode]()
    
    for i in 0...5 {
        var person: SKSpriteNode
        var personPosition: CGPoint
        
        switch i {
        case 0:
            person = SKSpriteNode(imageNamed: "Person1")
            personPosition = CGPoint(x: midpoint.x - 210, y: midpoint.y)
        case 1:
            person = SKSpriteNode(imageNamed: "Person2")
            personPosition = CGPoint(x: midpoint.x - 200, y: midpoint.y - 170)
        case 2:
            person = SKSpriteNode(imageNamed: "Person3")
            personPosition = CGPoint(x: midpoint.x - 80, y: midpoint.y - 230)
        case 3:
            person = SKSpriteNode(imageNamed: "Person4")
            personPosition = CGPoint(x: midpoint.x + 60, y: midpoint.y - 230)
        case 4:
            person = SKSpriteNode(imageNamed: "Person5")
            personPosition = CGPoint(x: midpoint.x + 200, y: midpoint.y - 170)
        case 5:
            person = SKSpriteNode(imageNamed: "Person6")
            personPosition = CGPoint(x: midpoint.x + 210, y: midpoint.y)
        default:
            person = SKSpriteNode(imageNamed: "Person1")
            personPosition = CGPoint(x: midpoint.x, y: midpoint.y)
        }
        
        person.position = personPosition
        person.setScale(0.6)
        people.append(person)
        scene.addChild(person)
    }
}

createLandscape()
createHearts()
createPeople()

view.presentScene(scene)
PlaygroundPage.current.liveView = view







































