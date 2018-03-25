import UIKit
import PlaygroundSupport
import SpriteKit

/*
 
 Skyler Svendsen's WWDC - 2018 Scholarship Application Playground
 
 Asset attribution:
    People created with use of Kenney Asset packs.
        www.kenney.nl
    Wheelchair created by Skyler Svendsen in Affinity Designer
    Landscape created by Skyler Svendsen in Affinity Designer
    Wind created by
    Hearts created by Skyler Svendsen in Affinity Designer
    Apple logo® recreated by Skyler Svendsen in Affinity Designer -- Not to be used or distributed outside this project. Not intended to infringe on any copyright laws.
 
    Apple, iPad, iPhone, iPod, and iPod touch are trademarks of Apple Inc., registered in the U.S. and other countries. Swift and the Swift logo are trademarks of Apple Inc.
 
 All code written by author, Skyler Svendsen
 
 Thanks for taking the time to look at this, I hope you enjoy it!
 
 */

//variables
let frame = CGRect(x: 0, y: 0, width: 600, height: 800)
let midpoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

let view = SKView(frame: frame)
var scene = SKScene(size: frame.size)

var allChildren = [SKSpriteNode]()
var hearts = [SKSpriteNode]()
var people = [SKSpriteNode]()
var peopleGlow = [SKSpriteNode]()
var wind = SKSpriteNode()
var totalLogo = [SKSpriteNode]()

//functions
func createLandscape() {
    let landscape = SKSpriteNode(imageNamed: "Landscape")
    
    //landscape.setScale(0.6)
    landscape.position = CGPoint(x: midpoint.x, y: midpoint.y)
    allChildren.append(landscape)
    scene.addChild(landscape)
}

func createHearts() {

    for i in 0...5 {
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
            heartPosition = CGPoint(x: midpoint.x + 30, y: midpoint.y + 60)
            heart.name = "heart3"
        case 3:
            heartPosition = CGPoint(x: midpoint.x - 10, y: midpoint.y + 20)
            heart.name = "heart4"
        case 4:
            heartPosition = CGPoint(x: midpoint.x + 30, y: midpoint.y + 105)
            heart.name = "heart5"
        case 5:
            heartPosition = CGPoint(x: midpoint.x - 40, y: midpoint.y + 115)
            heart.name = "heart6"
        case 6:
            heartPosition = CGPoint(x: midpoint.x + 70, y: midpoint.y + 20)
            heart.name = "heart7"
        default:
            heartPosition = CGPoint(x: midpoint.x, y: midpoint.y)
        }
        
        heart.position = heartPosition
        //heart.setScale(0.6)
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
            personPosition = CGPoint(x: midpoint.x + 60, y: midpoint.y - 240)
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
        //person.setScale(0.6)
        people.append(person)
        allChildren.append(person)
        scene.addChild(person)
    }
}

func createIlluminatedShirts() {
    for i in 0...5 {
        var person: SKSpriteNode
        var personPosition: CGPoint
        
        switch i {
        case 0:
            person = SKSpriteNode(imageNamed: "Person1-glow")
            person.name = "Person1-glow"
            personPosition = CGPoint(x: midpoint.x - 207, y: midpoint.y)
            person.alpha = 0
            
            let logoGreenTexture = SKTexture(imageNamed: "Apple-Green")
            let logoGreen = SKSpriteNode(texture: logoGreenTexture)
            
            logoGreen.position = CGPoint(x: midpoint.x, y: midpoint.y + 240)
            logoGreen.alpha = 0
            
            scene.addChild(logoGreen)
            totalLogo.append(logoGreen)
        case 1:
            person = SKSpriteNode(imageNamed: "Person2-glow")
            person.name = "Person2-glow"
            personPosition = CGPoint(x: midpoint.x - 200, y: midpoint.y - 170)
            person.alpha = 0
            
            let logoYellowTexture = SKTexture(imageNamed: "Apple-Yellow")
            let logoYellow = SKSpriteNode(texture: logoYellowTexture)
            
            logoYellow.position = CGPoint(x: midpoint.x - 14, y: midpoint.y + 150)
            logoYellow.alpha = 0
            
            scene.addChild(logoYellow)
            totalLogo.append(logoYellow)
        case 2:
            person = SKSpriteNode(imageNamed: "Person3-glow")
            person.name = "Person3-glow"
            personPosition = CGPoint(x: midpoint.x - 80, y: midpoint.y - 230)
            person.alpha = 0
            
            let logoOrangeTexture = SKTexture(imageNamed: "Apple-Orange")
            let logoOrange = SKSpriteNode(texture: logoOrangeTexture)
            
            logoOrange.position = CGPoint(x: midpoint.x - 25, y: midpoint.y + 104)
            logoOrange.alpha = 0
            
            scene.addChild(logoOrange)
            totalLogo.append(logoOrange)
        case 3:
            person = SKSpriteNode(imageNamed: "Person4-glow")
            person.name = "Person4-glow"
            personPosition = CGPoint(x: midpoint.x + 60, y: midpoint.y - 240)
            person.alpha = 0
            
            let logoRedTexture = SKTexture(imageNamed: "Apple-Red")
            let logoRed = SKSpriteNode(texture: logoRedTexture)
            
            logoRed.position = CGPoint(x: midpoint.x - 2, y: midpoint.y + 59)
            logoRed.alpha = 0
            
            scene.addChild(logoRed)
            totalLogo.append(logoRed)
        case 4:
            person = SKSpriteNode(imageNamed: "Person5-glow")
            person.name = "Person5-glow"
            personPosition = CGPoint(x: midpoint.x + 200, y: midpoint.y - 170)
            person.alpha = 0
            
            let logoPurpleTexture = SKTexture(imageNamed: "Apple-Purple")
            let logoPurple = SKSpriteNode(texture: logoPurpleTexture)
            
            logoPurple.position = CGPoint(x: midpoint.x + 3, y: midpoint.y + 11)
            logoPurple.alpha = 0
            
            scene.addChild(logoPurple)
            totalLogo.append(logoPurple)
        case 5:
            person = SKSpriteNode(imageNamed: "Person6-glow")
            person.name = "Person6-glow"
            personPosition = CGPoint(x: midpoint.x + 210, y: midpoint.y)
            person.alpha = 0
            
            let logoBlueTexture = SKTexture(imageNamed: "Apple-Blue")
            let logoBlue = SKSpriteNode(texture: logoBlueTexture)
            
            logoBlue.position = CGPoint(x: midpoint.x + 2, y: midpoint.y - 38)
            logoBlue.alpha = 0
            
            scene.addChild(logoBlue)
            totalLogo.append(logoBlue)
        default:
            person = SKSpriteNode(imageNamed: "Person1")
            person.name = "Person7-glow"
            personPosition = CGPoint(x: midpoint.x, y: midpoint.y)
            person.alpha = 0
        }
        
        person.position = personPosition
        //person.setScale(0.6)
        peopleGlow.append(person)
        allChildren.append(person)
        scene.addChild(person)
    }
}

func createWind() {
    //create
    let windTexture = SKTexture(imageNamed: "Wind")
    wind = SKSpriteNode(texture: windTexture)
    
    //wind.setScale(0.6)
    wind.position = CGPoint(x: -150, y: midpoint.y + 150)
    allChildren.append(wind)
    scene.addChild(wind)
}

//animation methods
func moveWind() {
    let endPosition = frame.width + 300
    let moveBy = SKAction.moveBy(x: endPosition, y: 0, duration: 4.0)
    let wait = SKAction.wait(forDuration: 3)
    let warp = SKAction.moveTo(x: CGFloat(-150), duration: 0)
    
    let sequence = SKAction.sequence([moveBy, wait, warp, moveBy])
    wind.run(sequence)
}

func wiggleHearts() {
    for heart in hearts {
        let startPosition = CGPoint(x: heart.position.x, y: heart.position.y)
        let endPosition = CGPoint(x: heart.position.x + 5, y: heart.position.y)

        let wiggleTo = SKAction.moveTo(x: endPosition.x, duration: 0.3)
        let wiggleBack = SKAction.moveTo(x: startPosition.x, duration: 0.3)

        let sequence = SKAction.sequence([wiggleTo, wiggleBack])
        let repeatAction = SKAction.repeat(sequence, count: 7)
        heart.run(repeatAction)
    }
}

//moveHearts helper method
func getMoveNodes(for heart: SKSpriteNode) -> [SKAction] {
    
    var nodesArray = [CGPoint]()
    
    let node1 = CGPoint(x: heart.position.x + 250, y: heart.position.y + 80)
    let node2 = CGPoint(x: node1.x - 50, y: node1.y + 50)
    let node3 = CGPoint(x: node2.x - 50, y: node2.y + 50)
    let node4 = CGPoint(x: node3.x - 40, y: node3.y - 25)
    let node5 = CGPoint(x: node4.x - 40, y: node4.y - 25)
    
    nodesArray.append(node1)
    nodesArray.append(node2)
    nodesArray.append(node3)
    nodesArray.append(node4)
    nodesArray.append(node5)
    
    var returnSequence = [SKAction]()
    
    let moveTo1 = SKAction.move(to: nodesArray[0], duration: 0.6)
    let moveTo2 = SKAction.move(to: nodesArray[1], duration: 0.6)
    let moveTo3 = SKAction.move(to: nodesArray[2], duration: 0.6)
    let moveTo4 = SKAction.move(to: nodesArray[3], duration: 0.6)
    let moveTo5 = SKAction.move(to: nodesArray[4], duration: 0.6)
    
    returnSequence.append(moveTo1)
    returnSequence.append(moveTo2)
    returnSequence.append(moveTo3)
    returnSequence.append(moveTo4)
    returnSequence.append(moveTo5)
    
    switch heart.name {
    case "heart1"?:
        let endPosition = CGPoint(x: people[0].position.x + 3, y: people[0].position.y)
        
        let moveTo6 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 1)
        
        returnSequence.append(moveTo6)
    case "heart2"?:
        let endPosition = CGPoint(x: people[1].position.x, y: people[1].position.y)
        
        let moveTo6 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 2)
        
        returnSequence.append(moveTo6)
    case "heart3"?:
        let endPosition = CGPoint(x: people[2].position.x, y: people[2].position.y)
        
        let moveTo6 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 3)
        
        returnSequence.append(moveTo6)
    case "heart4"?:
        let endPosition = CGPoint(x: people[3].position.x, y: people[3].position.y)
        
        let moveTo6 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 4)
        
        returnSequence.append(moveTo6)
    case "heart5"?:
        let endPosition = CGPoint(x: people[4].position.x, y: people[4].position.y)
        
        let moveTo6 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 5)
        
        returnSequence.append(moveTo6)
    case "heart6"?:
        let endPosition = CGPoint(x: people[5].position.x, y: people[5].position.y)
        
        let moveTo6 = SKAction.move(to: CGPoint(x: endPosition.x, y: endPosition.y), duration: 6)
        
        returnSequence.append(moveTo6)
    default:
        break
    }
    
    return returnSequence
}

func moveHearts() {
    
    let disappear = SKAction.fadeAlpha(to: 0, duration: 2)
    
    for heart in hearts{
        switch heart.name {
        case "heart1"?:
            
            var moveToArray = [SKAction]()
            moveToArray = getMoveNodes(for: heart)
            let sequenceHeart = SKAction.sequence([moveToArray[0], moveToArray[1], moveToArray[2], moveToArray[3], moveToArray[4], moveToArray[5], disappear])
            heart.run(sequenceHeart)
            
            let waitTime = SKAction.wait(forDuration: 4)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[0].run(sequenceGlow)
            totalLogo[0].run(sequenceGlow)
            
        case "heart2"?:
            
            var moveToArray = [SKAction]()
            moveToArray = getMoveNodes(for: heart)
            let sequenceHeart = SKAction.sequence([moveToArray[0], moveToArray[1], moveToArray[2], moveToArray[3], moveToArray[4], moveToArray[5], disappear])
            heart.run(sequenceHeart)
            
            let waitTime = SKAction.wait(forDuration: 5)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[1].run(sequenceGlow)
            totalLogo[1].run(sequenceGlow)
            
        case "heart3"?:
            
            var moveToArray = [SKAction]()
            moveToArray = getMoveNodes(for: heart)
            let sequenceHeart = SKAction.sequence([moveToArray[0], moveToArray[1], moveToArray[2], moveToArray[3], moveToArray[4], moveToArray[5], disappear])
            heart.run(sequenceHeart)
            
            let waitTime = SKAction.wait(forDuration: 6)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[2].run(sequenceGlow)
            totalLogo[2].run(sequenceGlow)
            
        case "heart4"?:
            
            var moveToArray = [SKAction]()
            moveToArray = getMoveNodes(for: heart)
            let sequenceHeart = SKAction.sequence([moveToArray[0], moveToArray[1], moveToArray[2], moveToArray[3], moveToArray[4], moveToArray[5], disappear])
            heart.run(sequenceHeart)
            
            let waitTime = SKAction.wait(forDuration: 7)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[3].run(sequenceGlow)
            totalLogo[3].run(sequenceGlow)
            
        case "heart5"?:
            
            var moveToArray = [SKAction]()
            moveToArray = getMoveNodes(for: heart)
            let sequenceHeart = SKAction.sequence([moveToArray[0], moveToArray[1], moveToArray[2], moveToArray[3], moveToArray[4], moveToArray[5], disappear])
            heart.run(sequenceHeart)
            
            let waitTime = SKAction.wait(forDuration: 8)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[4].run(sequenceGlow)
            totalLogo[4].run(sequenceGlow)
            
        case "heart6"?:
            
            var moveToArray = [SKAction]()
            moveToArray = getMoveNodes(for: heart)
            let sequenceHeart = SKAction.sequence([moveToArray[0], moveToArray[1], moveToArray[2], moveToArray[3], moveToArray[4], moveToArray[5], disappear])
            heart.run(sequenceHeart)
            
            let waitTime = SKAction.wait(forDuration: 9)
            let appear = SKAction.fadeAlpha(to: 1, duration: 1)
            let sequenceGlow = SKAction.sequence([waitTime, appear])
            peopleGlow[5].run(sequenceGlow)
            totalLogo[5].run(sequenceGlow)
            
        default:
            break
        }
    }
}

func fadeIntoLogo() {
    let fadeOut = SKAction.fadeOut(withDuration: 4)
    
    for child in allChildren {
        child.run(fadeOut)
    }

}


//combining methods
func create() {
    createLandscape()
    createPeople()
    createIlluminatedShirts()
    createHearts()
    createWind()
//    createLogo()
}

func animate() {
    //spacer actions
    let shortPause = SKAction.wait(forDuration: 1)
    let pause = SKAction.wait(forDuration: 3)
    let longPause = SKAction.wait(forDuration: 8)
    let longerPause = SKAction.wait(forDuration: 12)
    let fadeOut = SKAction.fadeOut(withDuration: 3)
    let fadeIn = SKAction.fadeIn(withDuration: 3)

    //function call actions
    let wind = SKAction.run {
        moveWind()
    }
    
    let wiggle = SKAction.run {
        wiggleHearts()
    }
    
    let move = SKAction.run {
        moveHearts()
    }
    
    let childrenFade = SKAction.run {
        for child in allChildren {
            child.run(fadeOut)
        }
    }
    
    let logoFade = SKAction.run {
        for child in totalLogo {
            child.run(fadeIn)
        }
    }
    
    //sequence
    let sequence = SKAction.sequence([pause, wind, shortPause, wiggle, longPause, move, longerPause, childrenFade, pause, logoFade])
    
    //putting it all together
    scene.run(sequence)
}

//create scene and actions

create()
animate()

view.presentScene(scene)
PlaygroundPage.current.liveView = view







































