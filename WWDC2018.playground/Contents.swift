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
    Wind created by Skyler Svendsen in Affinity Designer
    Hearts created by Skyler Svendsen in Affinity Designer
    Cursor provided in Kenney Asset packs.
    Apple logo® recreated by Skyler Svendsen in Affinity Designer -- Not to be used or distributed outside this project. Not intended to infringe on any copyright laws.
 
    Apple, iPad, iPhone, iPod, and iPod touch are trademarks of Apple Inc., registered in the U.S. and other countries. Swift and the Swift logo are trademarks of Apple Inc.
 
 All code written by author, Skyler Svendsen
 
 Thanks for taking the time to look at this, I hope you enjoy it!
 
 */


//present scene and display to liveView

let view = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
let scene = GameScene(size: view.frame.size)

view.presentScene(scene)
PlaygroundPage.current.liveView = view







































