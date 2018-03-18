import UIKit
import PlaygroundSupport
import SpriteKit

let frame = CGRect(x: 0, y: 0, width: 500, height: 750)
let midpoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
let treePosition = CGPoint(x: midpoint.x, y: midpoint.y + frame.size.height * 0.25)

let view = SKView(frame: frame)
var scene = SKScene(size: frame.size)
scene.backgroundColor = UIColor.lightGray

func createTree() {
    let tree = SKSpriteNode(imageNamed: "Tree")

    tree.position = treePosition
    tree.setScale(0.2)
    scene.addChild(tree)
}

func createHearts() {
    var hearts = [SKSpriteNode]()

    for i in 0...6 {
        let heart = SKSpriteNode(imageNamed: "Heart")
        let heartPosition = CGPoint(x: treePosition.x + CGFloat(i), y: treePosition.y + CGFloat(i))
        heart.position = heartPosition
        heart.setScale(0.2)
        hearts.append(heart)
        scene.addChild(heart)
    }
}

createTree()
createHearts()

view.presentScene(scene)
PlaygroundPage.current.liveView = view







































