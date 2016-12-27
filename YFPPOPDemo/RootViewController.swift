//
//  RootViewController.swift
//  YFPPOPDemo
//
//  Created by Charles Yao on 2016/12/26.
//  Copyright © 2016年 Charles Yao. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    let titles = ["POPBasicAnimation","PopSpringAnimation","PopDecayAnimation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView = UITableView(frame:CGRect(x: 0, y: 0, width: g_screenSize.width, height: g_screenSize.height))
        //        self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        cell.textLabel?.text = self.titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(1)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: UIViewController!
        if indexPath.row == 0 {
            vc = BasicAnimationViewController(nibName: "BasicAnimationViewController", bundle: nil)
        }else if indexPath.row == 1 {
            vc = SpringAnimationViewController(nibName: "SpringAnimationViewController", bundle: nil)
        }else if indexPath.row == 2 {
            vc = DecayAnimationViewController(nibName: "DecayAnimationViewController", bundle: nil)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
