import UIKit
import PlaygroundSupport
import SpriteKit
import GameplayKit

/*
 
 Skyler Svendsen's WWDC - 2018 Scholarship Application Playground
 
 Asset attribution:
    People created with use of Kenney Asset packs, assembled by Skyler Svendsen in Affinity Designer.
        Kenney Asset credit: www.kenney.nl
    Wheelchair created by Skyler Svendsen in Affinity Designer
    Landscape created with use of Kenney Asset packs, assembled by Skyler Svendsen in Affinity Designer.
        Kenney Asset credit: www.kenney.nl
    Wind created by Skyler Svendsen in Affinity Designer
    Hearts created by Skyler Svendsen in Affinity Designer
    Apple logo® recreated by Skyler Svendsen in Affinity Designer -- Not to be used or distributed outside this project. Not intended to infringe on any copyright laws.
 
    Apple, iPad, iPhone, iPod, and iPod touch are trademarks of Apple Inc., registered in the U.S. and other countries. Swift and the Swift logo are trademarks of Apple Inc.
 
 All code written by author, Skyler Svendsen
 
 Thanks for taking the time to look at this, I hope you enjoy it!
 
 */

class GameScene: SKScene {

    //variables
//    let frame = CGRect(x: 0, y: 0, width: 600, height: 800)
    let midpoint = CGPoint(x: 300, y: 400)
    var allChildren = [SKSpriteNode]()
    var hearts = [SKSpriteNode]()
    var people = [SKSpriteNode]()
    var peopleGlow = [SKSpriteNode]()
    var wind = SKSpriteNode()
    var cursor = SKSpriteNode()
    var totalLogo = [SKSpriteNode]()
    var animationCount: Int = 0
    var isAnimating = false

    //functions
    override func sceneDidLoad() {
        super.sceneDidLoad()
        create()
    }
    
    //scene setup functions
    func createLandscape() {
        let landscape = SKSpriteNode(imageNamed: "Landscape")
        landscape.position = CGPoint(x: midpoint.x, y: midpoint.y)
        allChildren.append(landscape)
        self.addChild(landscape)
    }

    //might have to implement as a heart...
    func createHearts() {
        for i in 0...5 {
            let heartTexture = SKTexture(imageNamed: "Heart")
            let heart = SKSpriteNode(texture: heartTexture)
            
            var heartPosition: CGPoint
            switch i {
            case 0:
                heartPosition = CGPoint(x: midpoint.x - 40, y: midpoint.y + 115)
                heart.name = "heart1"
            case 1:
                heartPosition = CGPoint(x: midpoint.x, y: midpoint.y + 150)
                heart.name = "heart2"
            case 2:
                heartPosition = CGPoint(x: midpoint.x + 30, y: midpoint.y + 105)
                heart.name = "heart3"
            case 3:
                heartPosition = CGPoint(x: midpoint.x + 30, y: midpoint.y + 60)
                heart.name = "heart4"
            case 4:
                heartPosition = CGPoint(x: midpoint.x - 10, y: midpoint.y + 20)
                heart.name = "heart5"
            case 5:
                heartPosition = CGPoint(x: midpoint.x - 40, y: midpoint.y + 70)
                heart.name = "heart6"
            default:
                heartPosition = CGPoint(x: midpoint.x, y: midpoint.y)
            }
            
            heart.position = heartPosition
            hearts.append(heart)
            allChildren.append(heart)
            self.addChild(heart)
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
            people.append(person)
            allChildren.append(person)
            self.addChild(person)
        }
    }

    func createIlluminatedShirtsAndLogo() {
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
                
                self.addChild(logoGreen)
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
                
                self.addChild(logoYellow)
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
                
                self.addChild(logoOrange)
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
                
                self.addChild(logoRed)
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
                
                self.addChild(logoPurple)
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
                
                self.addChild(logoBlue)
                totalLogo.append(logoBlue)
            default:
                person = SKSpriteNode(imageNamed: "Person1")
                person.name = "Person7-glow"
                personPosition = CGPoint(x: midpoint.x, y: midpoint.y)
                person.alpha = 0
            }
            
            person.position = personPosition
            peopleGlow.append(person)
            allChildren.append(person)
            self.addChild(person)
        }
    }

    func createWind() {
        //create
        let windTexture = SKTexture(imageNamed: "Wind")
        wind = SKSpriteNode(texture: windTexture)
        wind.position = CGPoint(x: -150, y: midpoint.y + 150)
        
        allChildren.append(wind)
        self.addChild(wind)
    }
    
    func createCursor() {
        let cursorTexture = SKTexture(imageNamed: "Cursor")
        cursor = SKSpriteNode(texture: cursorTexture)
        cursor.position = CGPoint(x: frame.maxX - 25, y: frame.maxY - 25)
        cursor.alpha = 0
        
        allChildren.append(cursor)
        self.addChild(cursor)
    }

    //animation methods
    func moveWind(speed: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: midpoint.y + 200))
        path.addQuadCurve(to: CGPoint(x: frame.maxX + 300, y: frame.maxY + 200), controlPoint: CGPoint(x: frame.maxX * 0.75, y: 200))
        let pathAction = SKAction.follow(path.cgPath, asOffset: false, orientToPath: false, speed: speed)

        wind.run(pathAction)
        wind.position = CGPoint(x: -150, y: midpoint.y + 150)
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

    func moveHeart(_ heart: SKSpriteNode) {
        let appear = SKAction.fadeAlpha(to: 1, duration: 1)
        
//        for heart in hearts {
            switch heart.name {
            case "heart1"?:
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: -(heart.position.x - people[0].position.x) + 3, y: -(heart.position.y - people[0].position.y)), controlPoint1: CGPoint(x: -100, y: 100), controlPoint2: CGPoint(x: -midpoint.x, y: midpoint.y))
                
                let pathAction = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, duration: 4)
                heart.run(pathAction)
                
                let waitTime = SKAction.wait(forDuration: 4)
                let sequenceGlow = SKAction.sequence([waitTime, appear])
                peopleGlow[0].run(sequenceGlow)
                totalLogo[0].run(sequenceGlow)
                
            case "heart2"?:
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: -(heart.position.x - people[1].position.x) + 2, y: -(heart.position.y - people[1].position.y) + 2), controlPoint1: CGPoint(x: -100, y: 100), controlPoint2: CGPoint(x: -midpoint.x, y: midpoint.y))
                
                let pathAction = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, duration: 4)
                heart.run(pathAction)
                
                let waitTime = SKAction.wait(forDuration: 4)
                let sequenceGlow = SKAction.sequence([waitTime, appear])
                peopleGlow[1].run(sequenceGlow)
                totalLogo[1].run(sequenceGlow)
                
            case "heart3"?:
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: -(heart.position.x - people[2].position.x), y: -(heart.position.y - people[2].position.y) + 2), controlPoint1: CGPoint(x: -100, y: 100), controlPoint2: CGPoint(x: -midpoint.x, y: midpoint.y))
                
                let pathAction = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, duration: 4)
                heart.run(pathAction)
                
                let waitTime = SKAction.wait(forDuration: 4)
                let sequenceGlow = SKAction.sequence([waitTime, appear])
                peopleGlow[2].run(sequenceGlow)
                totalLogo[2].run(sequenceGlow)
                
            case "heart4"?:
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: -(heart.position.x - people[3].position.x) + 2, y: -(heart.position.y - people[3].position.y) + 2), controlPoint1: CGPoint(x: -100, y: 100), controlPoint2: CGPoint(x: midpoint.x, y: midpoint.y))
                
                let pathAction = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, duration: 4)
                heart.run(pathAction)
                
                let waitTime = SKAction.wait(forDuration: 4)
                let sequenceGlow = SKAction.sequence([waitTime, appear])
                peopleGlow[3].run(sequenceGlow)
                totalLogo[3].run(sequenceGlow)
                
            case "heart5"?:
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: -(heart.position.x - people[4].position.x) + 2, y: -(heart.position.y - people[4].position.y) + 2), controlPoint1: CGPoint(x: -100, y: 100), controlPoint2: CGPoint(x: midpoint.x, y: midpoint.y))
                
                let pathAction = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, duration: 4)
                heart.run(pathAction)
                
                let waitTime = SKAction.wait(forDuration: 4)
                let sequenceGlow = SKAction.sequence([waitTime, appear])
                peopleGlow[4].run(sequenceGlow)
                totalLogo[4].run(sequenceGlow)
                
            case "heart6"?:
                let path = UIBezierPath()
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: -(heart.position.x - people[5].position.x) + 1, y: -(heart.position.y - people[5].position.y) + 2), controlPoint1: CGPoint(x: -100, y: 100), controlPoint2: CGPoint(x: midpoint.x, y: midpoint.y))
                
                let pathAction = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, duration: 4)
                heart.run(pathAction)
                
                let waitTime = SKAction.wait(forDuration: 4)
                let sequenceGlow = SKAction.sequence([waitTime, appear])
                peopleGlow[5].run(sequenceGlow)
                totalLogo[5].run(sequenceGlow)
                
            default:
                break
            }
//        }
    }

    //combining methods into creation and animate sections
    func create() {
        createLandscape()
        createPeople()
        createIlluminatedShirtsAndLogo()
        createHearts()
        createWind()
        createCursor()
        
        let cursorFadeIn = SKAction.fadeIn(withDuration: 1)
        let cursorWait = SKAction.wait(forDuration: 1)
        let cursorFadeOut = SKAction.fadeOut(withDuration: 1)
        
        let sequence = SKAction.sequence([cursorWait, cursorFadeIn, cursorWait, cursorFadeOut])
        cursor.run(sequence)
    }

    func animate() {
        
        //spacer actions
        let fadeOut = SKAction.fadeOut(withDuration: 3)
        let pause1 = SKAction.wait(forDuration: 2)
        let pause2 = SKAction.wait(forDuration: 1.5)
        let pause3 = SKAction.wait(forDuration: 4)

        let wind = SKAction.run {
            self.moveWind(speed: 200)
        }

        let wiggle = SKAction.run {
            self.wiggleHearts()
        }

        let childrenFade = SKAction.run {
            for child in self.allChildren {
                child.run(fadeOut)
            }
        }
        
        let animationSwitch = SKAction.run {
            self.isAnimating = false
        }

        //putting it all together
        switch animationCount {
        case 0:
            isAnimating = true
            
            let sequence = SKAction.sequence([wind, pause1, wiggle, pause3, animationSwitch])
            self.run(sequence)

            animationCount += 1
        case 1:
            isAnimating = true
            
            let move = SKAction.run {
                self.moveHeart(self.hearts[0])
            }
            let sequence = SKAction.sequence([wind, pause2, move, pause3, animationSwitch])
            self.run(sequence)

            animationCount += 1
        case 2:
            isAnimating = true
            
            let move = SKAction.run {
                self.moveHeart(self.hearts[1])
            }
            let sequence = SKAction.sequence([wind, pause2, move, pause3, animationSwitch])
            self.run(sequence)

            animationCount += 1
        case 3:
            isAnimating = true
            
            let move = SKAction.run {
                self.moveHeart(self.hearts[2])
            }
            let sequence = SKAction.sequence([wind, pause2, move, pause3, animationSwitch])
            self.run(sequence)

            animationCount += 1
        case 4:
            isAnimating = true
            
            let move = SKAction.run {
                self.moveHeart(self.hearts[3])
            }
            let sequence = SKAction.sequence([wind, pause2, move, pause3, animationSwitch])
            self.run(sequence)

            animationCount += 1
        case 5:
            isAnimating = true
            
            let move = SKAction.run {
                self.moveHeart(self.hearts[4])
            }
            let sequence = SKAction.sequence([wind, pause2, move, pause3, animationSwitch])
            self.run(sequence)

            animationCount += 1
        case 6:
            isAnimating = true
            
            let move = SKAction.run {
                self.moveHeart(self.hearts[5])
            }
            let sequence = SKAction.sequence([wind, pause2, move, pause3, childrenFade])
            self.run(sequence)

            animationCount += 1
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !isAnimating {
            animate()
        }
        
    }
}

//present scene and display to liveView

let view = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
let scene = GameScene(size: view.frame.size)

view.presentScene(scene)
PlaygroundPage.current.liveView = view







































