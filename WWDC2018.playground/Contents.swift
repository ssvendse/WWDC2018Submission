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

var allChildren = [SKSpriteNode]()
var hearts = [SKSpriteNode]()
var people = [SKSpriteNode]()
var peopleGlow = [SKSpriteNode]()
var wind = SKSpriteNode()

//functions
func createLandscape() {
    let landscape = SKSpriteNode(imageNamed: "Landscape")
    
    landscape.setScale(0.6)
    landscape.position = CGPoint(x: midpoint.x, y: midpoint.y)
    allChildren.append(landscape)
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
            heart.name = "heart7"
        default:
            heartPosition = CGPoint(x: midpoint.x, y: midpoint.y)
        }
        
        heart.position = heartPosition
        heart.setScale(0.6)
        hearts.append(heart)
        allChildren.append(heart)
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
            person.name = "Person7"
            personPosition = CGPoint(x: midpoint.x, y: midpoint.y)
        }
        
        person.position = personPosition
        person.setScale(0.6)
        people.append(person)
        allChildren.append(person)
        scene.addChild(person)
    }
}

func createWind() {
    //create
    let windTexture = SKTexture(imageNamed: "Wind")
    wind = SKSpriteNode(texture: windTexture)
    
    wind.setScale(0.6)
    wind.position = CGPoint(x: 0, y: midpoint.y + 150)
    allChildren.append(wind)
    scene.addChild(wind)

    //actions
    let endPosition = frame.width + 150
    let moveBy = SKAction.moveBy(x: endPosition, y: 0, duration: 4.0)
    let wait = SKAction.wait(forDuration: 3)
    let warp = SKAction.moveTo(x: CGFloat(-100), duration: 0)
    
    let sequence = SKAction.sequence([moveBy, wait, warp])
    let repeatAction = SKAction.repeat(sequence, count: 3)
    wind.run(repeatAction)
}

func wiggleHearts() {
    for heart in hearts {
        let startPosition = CGPoint(x: heart.position.x, y: heart.position.y)
        let endPosition = CGPoint(x: heart.position.x + 3, y: heart.position.y)

        let wiggleTo = SKAction.moveTo(x: endPosition.x, duration: 0.3)
        let wiggleBack = SKAction.moveTo(x: startPosition.x, duration: 0.3)

        let sequence = SKAction.sequence([wiggleTo, wiggleBack])
        let repeatAction = SKAction.repeat(sequence, count: 5)
        heart.run(repeatAction)
    }
}

func moveHearts() {
    for heart in hearts{
        switch heart.name {
        case "heart1"?:
            
            let mid1Pos = CGPoint(x: midpoint.x + 300, y: midpoint.y + 200)
            let mid2Pos = CGPoint(x: mid1Pos.x - 100, y: mid1Pos.y + 150)
            let mid3Pos = CGPoint(x: mid2Pos.x - 100, y: mid2Pos.y - 50)
            let endPosition = CGPoint(x: people[0].position.x, y: people[0].position.y)
            
            let moveTo1 = SKAction.move(to: CGPoint(x: mid1Pos.x, y: mid1Pos.y), duration: 1)
            let moveTo2 = SKAction.move(to: CGPoint(x: mid2Pos.x, y: mid2Pos.y), duration: 1)
            let moveTo3 = SKAction.move(to: CGPoint(x: mid3Pos.x, y: mid3Pos.y), duration: 1)
            let moveTo4 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 1)
            
            let disappear = SKAction.fadeAlpha(to: 0, duration: 2)
            
            let sequenceHeart = SKAction.sequence([moveTo1, moveTo2, moveTo3, moveTo4, disappear])
            heart.run(sequenceHeart)
            
            let waitTime = SKAction.wait(forDuration: 4)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[0].run(sequenceGlow)
            
        case "heart2"?:
            
            let mid1Pos = CGPoint(x: midpoint.x + 260, y: midpoint.y + 250)
            let mid2Pos = CGPoint(x: mid1Pos.x - 80, y: mid1Pos.y + 100)
            let mid3Pos = CGPoint(x: mid2Pos.x - 200, y: mid2Pos.y - 150)
            let endPosition = CGPoint(x: people[1].position.x, y: people[1].position.y)
            
            let moveTo1 = SKAction.move(to: CGPoint(x: mid1Pos.x, y: mid1Pos.y), duration: 1)
            let moveTo2 = SKAction.move(to: CGPoint(x: mid2Pos.x, y: mid2Pos.y), duration: 1)
            let moveTo3 = SKAction.move(to: CGPoint(x: mid3Pos.x, y: mid3Pos.y), duration: 1)
            let moveTo4 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 2)
            
            let disappear = SKAction.fadeAlpha(to: 0, duration: 2)
            let sequence = SKAction.sequence([moveTo1, moveTo2, moveTo3, moveTo4, disappear])
            heart.run(sequence)
            
            let waitTime = SKAction.wait(forDuration: 5)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[1].run(sequenceGlow)
            
        case "heart3"?:
            
            let mid1Pos = CGPoint(x: midpoint.x + 200, y: midpoint.y + 150)
            let mid2Pos = CGPoint(x: mid1Pos.x - 50, y: mid1Pos.y + 100)
            let mid3Pos = CGPoint(x: mid2Pos.x - 180, y: mid2Pos.y - 170)
            let endPosition = CGPoint(x: people[2].position.x, y: people[2].position.y)
            
            let moveTo1 = SKAction.move(to: CGPoint(x: mid1Pos.x, y: mid1Pos.y), duration: 1)
            let moveTo2 = SKAction.move(to: CGPoint(x: mid2Pos.x, y: mid2Pos.y), duration: 1)
            let moveTo3 = SKAction.move(to: CGPoint(x: mid3Pos.x, y: mid3Pos.y), duration: 1)
            let moveTo4 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 3)
            
            let disappear = SKAction.fadeAlpha(to: 0, duration: 2)
            let sequence = SKAction.sequence([moveTo1, moveTo2, moveTo3, moveTo4, disappear])
            heart.run(sequence)
            
            let waitTime = SKAction.wait(forDuration: 6)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[2].run(sequenceGlow)
            
        case "heart4"?:
            
            let mid1Pos = CGPoint(x: midpoint.x + 180, y: midpoint.y + 60)
            let mid2Pos = CGPoint(x: mid1Pos.x - 50, y: mid1Pos.y + 100)
            let mid3Pos = CGPoint(x: mid2Pos.x - 180, y: mid2Pos.y - 170)
            let endPosition = CGPoint(x: people[3].position.x, y: people[3].position.y)
            
            let moveTo1 = SKAction.move(to: CGPoint(x: mid1Pos.x, y: mid1Pos.y), duration: 1)
            let moveTo2 = SKAction.move(to: CGPoint(x: mid2Pos.x, y: mid2Pos.y), duration: 1)
            let moveTo3 = SKAction.move(to: CGPoint(x: mid3Pos.x, y: mid3Pos.y), duration: 1)
            let moveTo4 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 4)
            
            let disappear = SKAction.fadeAlpha(to: 0, duration: 2)
            let sequence = SKAction.sequence([moveTo1, moveTo2, moveTo3, moveTo4, disappear])
            heart.run(sequence)
            
            let waitTime = SKAction.wait(forDuration: 7)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[3].run(sequenceGlow)
            
        case "heart5"?:
            
            let mid1Pos = CGPoint(x: midpoint.x + 150, y: midpoint.y + 160)
            let mid2Pos = CGPoint(x: mid1Pos.x - 10, y: mid1Pos.y + 100)
            let mid3Pos = CGPoint(x: mid2Pos.x - 20, y: mid2Pos.y - 70)
            let endPosition = CGPoint(x: people[4].position.x, y: people[4].position.y)
            
            let moveTo1 = SKAction.move(to: CGPoint(x: mid1Pos.x, y: mid1Pos.y), duration: 1)
            let moveTo2 = SKAction.move(to: CGPoint(x: mid2Pos.x, y: mid2Pos.y), duration: 1)
            let moveTo3 = SKAction.move(to: CGPoint(x: mid3Pos.x, y: mid3Pos.y), duration: 1)
            let moveTo4 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 5)
            
            let disappear = SKAction.fadeAlpha(to: 0, duration: 2)
            let sequence = SKAction.sequence([moveTo1, moveTo2, moveTo3, moveTo4, disappear])
            heart.run(sequence)
            
            let waitTime = SKAction.wait(forDuration: 8)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[4].run(sequenceGlow)
            
        case "heart6"?:
            
            let mid1Pos = CGPoint(x: midpoint.x + 180, y: midpoint.y + 180)
            let mid2Pos = CGPoint(x: mid1Pos.x - 10, y: mid1Pos.y + 100)
            let mid3Pos = CGPoint(x: mid2Pos.x - 20, y: mid2Pos.y - 70)
            let endPosition = CGPoint(x: people[5].position.x, y: people[5].position.y)
            
            let moveTo1 = SKAction.move(to: CGPoint(x: mid1Pos.x, y: mid1Pos.y), duration: 1)
            let moveTo2 = SKAction.move(to: CGPoint(x: mid2Pos.x, y: mid2Pos.y), duration: 1)
            let moveTo3 = SKAction.move(to: CGPoint(x: mid3Pos.x, y: mid3Pos.y), duration: 1)
            let moveTo4 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 6)
            
            let disappear = SKAction.fadeAlpha(to: 0, duration: 2)
            let sequence = SKAction.sequence([moveTo1, moveTo2, moveTo3, moveTo4, disappear])
            heart.run(sequence)
            
            let waitTime = SKAction.wait(forDuration: 9)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[5].run(sequenceGlow)
            
        default:
            break
        }
    }
}

func illuminateShirts() {
    for i in 0...5 {
        var person: SKSpriteNode
        var personPosition: CGPoint
        
        switch i {
        case 0:
            person = SKSpriteNode(imageNamed: "Person1-glow")
            person.name = "Person1-glow"
            personPosition = CGPoint(x: midpoint.x - 210, y: midpoint.y)
            person.alpha = 0
        case 1:
            person = SKSpriteNode(imageNamed: "Person2-glow")
            person.name = "Person2-glow"
            personPosition = CGPoint(x: midpoint.x - 200, y: midpoint.y - 170)
            person.alpha = 0
        case 2:
            person = SKSpriteNode(imageNamed: "Person3-glow")
            person.name = "Person3-glow"
            personPosition = CGPoint(x: midpoint.x - 80, y: midpoint.y - 230)
            person.alpha = 0
        case 3:
            person = SKSpriteNode(imageNamed: "Person4-glow")
            person.name = "Person4-glow"
            personPosition = CGPoint(x: midpoint.x + 60, y: midpoint.y - 230)
            person.alpha = 0
        case 4:
            person = SKSpriteNode(imageNamed: "Person5-glow")
            person.name = "Person5-glow"
            personPosition = CGPoint(x: midpoint.x + 200, y: midpoint.y - 170)
            person.alpha = 0
        case 5:
            person = SKSpriteNode(imageNamed: "Person6-glow")
            person.name = "Person6-glow"
            personPosition = CGPoint(x: midpoint.x + 210, y: midpoint.y)
            person.alpha = 0
        default:
            person = SKSpriteNode(imageNamed: "Person1")
            person.name = "Person7-glow"
            personPosition = CGPoint(x: midpoint.x, y: midpoint.y)
            person.alpha = 0
        }
        
        person.position = personPosition
        person.setScale(0.6)
        peopleGlow.append(person)
        allChildren.append(person)
        scene.addChild(person)
    }
}

func showLogo() {
    let fadeOut = SKAction.fadeOut(withDuration: 4)
    let fadeIn = SKAction.fadeIn(withDuration: 4)

    for child in allChildren {
        child.run(fadeOut)
    }
    
    let logo = SKSpriteNode(imageNamed: "AppleLogo")
    logo.position = CGPoint(x: midpoint.x, y: midpoint.y)
    logo.alpha = 0
    
    scene.addChild(logo)
    logo.run(fadeIn)
}

//create scene and actions
createLandscape()
createHearts()
createPeople()
illuminateShirts()
createWind()
wiggleHearts()
moveHearts()
showLogo()

view.presentScene(scene)
PlaygroundPage.current.liveView = view







































