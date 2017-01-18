//
//  ViewController2.m
//  Unuma
//
//  Created by 拓也 on 2017/01/16.
//  Copyright © 2017年 siamcats. All rights reserved.
//

#import "ViewController2.h"
#import "Shoyu-Swift.h"

@interface ViewController2 ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.tableView.source = [[Source alloc]init];
    self.tableView.source = [Source new];
    
    NSInteger *foo = "1";
    
/* SWIFT SAMPLE
tableView.source = Source()
        .createSection()
            source.createSection { section in
                section.createRow { row in
                    row.reuseIdentifier = "Cell"
                    row.height = 52
                    row.configureCell = { cell, _ in
                        cell.textLabel?.text = "row 1"
                        }
                }
            }
        }
    }
*/
}

@end
