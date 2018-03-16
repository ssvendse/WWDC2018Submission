import UIKit
import PlaygroundSupport
import SpriteKit

//class WWDCMasterViewController: UITableViewController {
//
//    var reasons = ["the labs are great", "the sessions teach new things", "the people are inspiring"]
//    override func viewDidLoad() {
//        title = "Reasons I should attend WWDC"
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return reasons.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell: UITableViewCell!
//        cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//            cell?.accessoryType = .disclosureIndicator
//        }
//
//        let reason = reasons[indexPath.row]
//        cell.detailTextLabel?.text = "I want to attend because \(reason)"
//        cell.textLabel?.text = "Reason #\(indexPath.row + 1)"
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let text = tableView.cellForRow(at: indexPath)?.detailTextLabel?.text else { return }
//
//        let detail = WWDCDetailViewController()
//        detail.message = text
//        navigationController?.pushViewController(detail, animated: true)
//    }
//
//
//}
//
//class WWDCDetailViewController: UIViewController {
//    var message = ""
//    var animator: UIDynamicAnimator?
//
//    override func loadView() {
//        title = "Please let me go!"
//        view = UIView()
//        view.backgroundColor = UIColor.white
//    }
//
//    override func viewDidLayoutSubviews() {
//        guard animator == nil else { return }
//
//        let words = message.components(separatedBy: " ")
//
//        var labels = [UILabel]()
//
//        for (index, word) in words.enumerated() {
//            let label = UILabel()
//            label.font = UIFont.preferredFont(forTextStyle: .title1)
//
//            label.center = CGPoint(x: view.frame.midX, y: 50 + CGFloat(30 * index))
//            label.text = word
//            label.sizeToFit()
//            view.addSubview(label)
//
//            labels.append(label)
//        }
//
//        let gravity = UIGravityBehavior(items: labels)
//        animator = UIDynamicAnimator(referenceView: view)
//        animator?.addBehavior(gravity)
//
//        let collisions = UICollisionBehavior(items: labels)
//
//        collisions.translatesReferenceBoundsIntoBoundary = true
//        animator?.addBehavior(collisions)
//    }
//}
//
//let master = WWDCMasterViewController()
//let navigation = UINavigationController(rootViewController: master)
//PlaygroundPage.current.liveView = navigation




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







































