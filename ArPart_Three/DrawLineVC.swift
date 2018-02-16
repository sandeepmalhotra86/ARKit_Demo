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
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func drawBtn_Action(_ sender: Any) {
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        print("rendering")
        
        
        DispatchQueue.main.async {
            guard let pointofView = self.mySceneView.pointOfView else{
                return
            }
            let transform = pointofView.transform
            
            // 3rd column is for orientation
            
            // where your phone is facing or how is oriented
            let orientation = SCNVector3(-transform.m31,-transform.m32,-transform.m33)
            
            // where your phone is located relative scenview, how its moving translationly
            let location = SCNVector3(transform.m41,transform.m42,transform.m43)
            let currentPositiionOfCamera = orientation + location
            print(orientation.x, orientation.y, orientation.z)
            if self.drawBtn.isHighlighted{
                print("Draw is pressed")
                let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.02))
                sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
                sphereNode.position = currentPositiionOfCamera
                self.mySceneView.scene.rootNode.addChildNode(sphereNode)
                
                
            }
            else{
                let pointer = SCNNode(geometry: SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0))
                pointer.geometry?.firstMaterial?.diffuse.contents = UIColor.red
                pointer.position = currentPositiionOfCamera
                
                self.mySceneView.scene.rootNode.enumerateChildNodes({ (node, _) in
                    if node.geometry is SCNBox{
                        node.removeFromParentNode()

                    }
                    
                })
                self.mySceneView.scene.rootNode.addChildNode(pointer)
            }
            
        }
        
        
        
        
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

func +(left: SCNVector3, right: SCNVector3 ) -> SCNVector3{
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
