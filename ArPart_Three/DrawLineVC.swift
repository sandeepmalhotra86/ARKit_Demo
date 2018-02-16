//
//  DrawLineVC.swift
//  ArPart_Three
//
//  Created by Gaurav Sharma on 2/15/18.
//  Copyright © 2018 Gaurav Sharma. All rights reserved.
//

import UIKit
import ARKit

class DrawLineVC: UIViewController, ARSCNViewDelegate {

    @IBOutlet var drawBtn: UIButton!
    @IBOutlet var mySceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        mySceneView.session.run(configuration)
        mySceneView.showsStatistics = true
        mySceneView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
    }
    
    @IBAction func drawBtn_Action(_ sender: Any) {
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        print("rendering")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
