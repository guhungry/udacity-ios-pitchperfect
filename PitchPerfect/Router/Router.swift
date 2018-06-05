//
//  Router.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

class Router: NSObject {
    class func showRecordScreen() -> UIViewController {
        if let view = mainStoryboard().instantiateInitialViewController() as? UINavigationController {
            if let record = view.topViewController as? RecordViewController {
                record.viewModel = RecordViewModel()
                record.viewModel.view = record
            }
            return view
        }
        return UIViewController()
    }
    
    private class func pushScreen(from: UIViewController, to: UIViewController) {
        from.navigationController?.pushViewController(to, animated: true)
    }
    
    private class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
