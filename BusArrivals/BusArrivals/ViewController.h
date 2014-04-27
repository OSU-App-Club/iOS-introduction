//
//  ViewController.h
//  BusArrivals
//
//  Created by Chris Vanderschuere on 4/27/14.
//  Copyright (c) 2014 OSU App Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSNumber* stopID;

@end
