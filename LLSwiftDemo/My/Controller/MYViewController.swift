//
//  MYViewController.swift
//  LLSwiftDemo
//
//  Created by Keith on 16/8/3.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class MYViewController: UITableViewController {

    var datas : NSArray!

    override init(style: UITableViewStyle) {
        super.init(style: UITableViewStyle.Grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "发现"
        
        let path = NSBundle.mainBundle().pathForResource("my", ofType: "json")
        let data = NSData(contentsOfFile:path!)
        let json = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
        datas = NSArray(array: json as! [AnyObject])
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return datas.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr:NSArray! = datas[section] as! NSArray
        return arr.count
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80;
        }
        return 44;
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "myCell"
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
            cell.clipsToBounds = true
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
            if indexPath.section == 0 {
                let imageView = UIImageView(frame: CGRectMake(0, 0, 60, 60))
                imageView.tag = 100001;
                imageView.layer.cornerRadius = 5;
                imageView.clipsToBounds = true
                imageView.contentMode = UIViewContentMode.ScaleAspectFill;
                cell.imageView?.addSubview(imageView)
                cell.imageView?.image = UIImage(named: "empty")
            }
        }
        let selections = datas[indexPath.section] as! [AnyObject]
        let dict:NSDictionary! = selections[indexPath.row] as! NSDictionary
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["detail"] as? String
        if indexPath.section == 0 {
            let imageView = cell.imageView?.viewWithTag(100001) as! UIImageView
            imageView.image = UIImage(named: dict["icon"] as! String)
        }else{
            cell.imageView?.image = UIImage(named: dict["icon"] as! String)
        }
        
        return cell
    }
 

}
