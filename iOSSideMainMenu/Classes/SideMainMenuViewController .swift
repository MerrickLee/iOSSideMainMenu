//
//  SideMainMenuViewController .swift
//  Pods
//
//  Created by Juan Morillo on 20/5/17.
//  Updates by Merrick Lee on 4/8/17.
//
//

import Foundation
import UIKit


//The width of your menu
var startingWidthPosition:CGFloat = -207

//Allow Bouncing = TRUE
//Remove Boucing = FALSE
var bouncingON = true



public class SideMainMenuViewController : UIViewController {
    
    //IBOulets
    @IBOutlet var leftContraings: NSLayoutConstraint!
    @IBOutlet var leftMainMenu: UIView!
    @IBOutlet var viewTap: UIView!
    
    //vars
    var mainMenuActive = false
    var tapGesture = UITapGestureRecognizer()
    

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //Properties of Views
        leftMainMenu.layer.shadowOpacity = 1
        leftMainMenu.layer.shadowRadius = 6
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(Tapped))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
        
        
    }
    
    func Tapped() {
        // do something cool here
        print ("tapped")
        closeMenu(self)
        
    }
    
    
    
    //Actions
    @IBAction func openMainMenu(_ sender: Any) {
        if (mainMenuActive) {
            leftContraings.constant = startingWidthPosition
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layoutIfNeeded()
            })
            
            if(bouncingON){
                
                leftContraings.constant = leftContraings.constant + 15
                UIView.animate(withDuration: 0.55, delay: 0.1, animations: {
                    self.view.layoutIfNeeded()
                })
                leftContraings.constant  = startingWidthPosition
                UIView.animate(withDuration: 0.25, delay: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        } else {
            leftContraings.constant = 0
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layoutIfNeeded()
            })
            if(bouncingON){
                leftContraings.constant = leftContraings.constant - 40
                UIView.animate(withDuration: 0.55, animations: {
                    self.view.layoutIfNeeded()
                })
                leftContraings.constant = 0
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.layoutIfNeeded()
                })
            }
            
        }
        mainMenuActive = !mainMenuActive
    }
    
}
