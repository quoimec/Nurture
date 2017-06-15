//
//  CustomSegue01.swift
//  Nurture
//
//  Created by Charlie on 26/5/17.
//  Copyright © 2017 Charlie Schacher. All rights reserved.
//

import UIKit

class CustomSegue01: UIStoryboardSegue {

	override func perform(){

        let slideView = destination.view

        source.view.addSubview(slideView!)
        slideView?.transform = CGAffineTransform(translationX: source.view.frame.size.width, y: 0)

        UIView.animate(withDuration: 0.25,
                               delay: 0.0,
                               options: UIViewAnimationOptions.curveEaseInOut,
                               animations: {
                               slideView?.transform = CGAffineTransform.identity
        }, completion: { finished in

            self.source.present(self.destination, animated: false, completion: nil)
            slideView?.removeFromSuperview()
        })
    }

}
