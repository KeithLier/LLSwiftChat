//
//  DiscoverViewController.swift
//  LLSwiftDemo
//
//  Created by Keith on 16/7/16.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView!
    var discovers : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "发现"
        
        let path = NSBundle.mainBundle().pathForResource("discover", ofType: "json")
        let data = NSData(contentsOfFile:path!)
        let json = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
        discovers = NSArray(array: json as! [AnyObject])
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return discovers.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr:NSArray! = discovers[section] as! NSArray
        return arr.count
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "homeCell"
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
            cell.clipsToBounds = true
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        let selections = discovers[indexPath.section] as! [AnyObject]
        let dict:NSDictionary! = selections[indexPath.row] as! NSDictionary
        cell.textLabel?.text = dict["name"] as? String
        cell.imageView?.image = UIImage(named: dict["icon"] as! String);
        return cell
    }
}
