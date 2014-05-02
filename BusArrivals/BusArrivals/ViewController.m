//
//  ViewController.m
//  BusArrivals
//
//  Created by Chris Vanderschuere on 4/27/14.
//  Copyright (c) 2014 OSU App Club. All rights reserved.
//

#import "ViewController.h"
#import "Arrival.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *arrivals;

@end

@implementation ViewController


- (void) setStopID:(NSNumber *)stopID{
    _stopID = stopID;
    
    [self updateArrivalsWithStopID:stopID];
    self.title = stopID.stringValue;
}

- (void) setArrivals:(NSArray *)arrivals{
    _arrivals = arrivals;
    
    // UI Operations should always be called on main thread
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.tableView reloadData];
    }];
}

- (void) viewDidLoad{
    [super viewDidLoad];
    
    //[self updateArrivalsWithStopID:@(13731)];
}

- (void) updateArrivalsWithStopID:(NSNumber*) stopID{
    // Create path for this stop
    NSString *urlString = [NSString stringWithFormat:@"http://corvallis-bus.appspot.com/arrivals?stops=%@",stopID.stringValue];
    
    // Make HTTP Request -- async
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // Completion block -- called whenever request finishes on unknown thread
        
        // Convert json to foundation types
        NSDictionary *stops = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // Get object for this stop
        NSArray *arrivals = stops[stopID.stringValue];
        NSMutableArray *newArrivals = [NSMutableArray arrayWithCapacity:arrivals.count];
        
        // Convert to Arrival object type
        for (NSDictionary *arrivalDict in arrivals) {
            [newArrivals addObject:[Arrival arrivalWithJSON:arrivalDict]];
        }
        
        // Store to property -- causes UI refresh
        self.arrivals = newArrivals;
        
    }] resume];
}


#pragma mark - UITableView Datasource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrivals.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"arrivalCell" forIndexPath:indexPath];
    
    // Get corresponding arrival object
    Arrival *currArrival = self.arrivals[indexPath.row];
    
    // Customize cell
    cell.textLabel.text = [NSDateFormatter localizedStringFromDate:currArrival.expected dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = currArrival.route;
    
    return cell;
}

@end
