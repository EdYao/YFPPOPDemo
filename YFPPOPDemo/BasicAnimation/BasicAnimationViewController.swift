//
//  BasicAnimationViewController.swift
//  YFPPOPDemo
//
//  Created by Charles Yao on 2016/12/26.
//  Copyright © 2016年 Charles Yao. All rights reserved.
//

import UIKit

class BasicAnimationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let titles = [kCAMediaTimingFunctionLinear,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionDefault]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(1);
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DefaultTimingFucViewController(nibName: "DefaultTimingFucViewController", bundle: nil)
        vc.title = self.titles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
