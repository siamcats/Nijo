//
//  ViewController.m
//  Unuma
//
//  Created by 拓也 on 2017/01/15.
//  Copyright © 2017年 siamcats. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UISegmentedControl *conveniSwicher;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSourceSeven;
@property (nonatomic, strong) NSArray *dataSourceFami;
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign)NSInteger hiddenSection;
@property (nonatomic, strong)UIColor *color1;
@property (nonatomic, strong)UIColor *color2;
@property (nonatomic, strong)UIColor *color3;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataSourceSeven = @[@"セブン",@"イレブン",@"良い気分♪"];
    self.dataSourceFami = @[@"あなたと",@"コンビに",@"ファミリーマート♪"];
    
#ifdef SEVEN
    NSLog(@"Build Seven");
    self.hiddenSection = 1;
    self.color1=[UIColor colorWithRed:0.82 green:0.25 blue:0.00 alpha:1.0];
    self.color2=[UIColor colorWithRed:0.94 green:0.51 blue:0.00 alpha:1.0];
    self.color3=[UIColor colorWithRed:0.00 green:0.60 blue:0.27 alpha:1.0];
#endif
#ifdef FAMI
    NSLog(@"Build Fami");
    self.hiddenSection = 0;
    self.color1=[UIColor colorWithRed:0.00 green:0.66 blue:0.26 alpha:1.0];
    self.color2=[UIColor colorWithRed:0.00 green:0.57 blue:0.85 alpha:1.0];
    self.color3=[UIColor colorWithRed:0.00 green:0.58 blue:0.74 alpha:1.0];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * セクション数を決める
 * @return NSInteger: セクション数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
    // section 0 : セブン
    // section 1 : ファミ
}

/**
 * セクションごとの行数を決める
 * @return NSInteger: 行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count;
    switch(section) {
        case 0:
            count = self.dataSourceSeven.count;
            break;
        case 1:
            count = self.dataSourceFami.count;
            break;
        default:
            count = 0;
            break;
    }
    return count;
}

/**
 * 表示するセル内容を決める
 * @return UITableViewCell: セル
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //セルの再利用、無ければ新規作成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    //表示文字セット
    switch(indexPath.section) {
        case 0:
            cell.textLabel.text=self.dataSourceSeven[indexPath.row];
            break;
        case 1:
            cell.textLabel.text=self.dataSourceFami[indexPath.row];
            break;
        default:
            break;
    }
    return cell;
}

/**
 * セルの描写
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //ビルドターゲットに従い見せたくないセルはhiddenに
    if (indexPath.section == self.hiddenSection) {
        cell.hidden = YES;
    } else {
        cell.hidden = NO;
    }
    //色もつけとく
    switch(indexPath.row) {
        case 0:
            cell.backgroundColor = self.color1;
            break;
        case 1:
            cell.backgroundColor = self.color2;
            break;
        case 2:
            cell.backgroundColor = self.color3;
            break;
        default:
            break;
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    NSLog(@"Section %d - Row %d : hidden %d",(int)indexPath.section,(int)indexPath.row,cell.hidden);
}

/*
- (IBAction)changeConveni:(id)sender {
    //NSLog(@"Swicher %d",self.conveniSwicher.selectedSegmentIndex);
    NSInteger sections = self.tableView.numberOfSections;
    NSMutableArray *cells = [[NSMutableArray alloc]  init];
    for (int section = 0; section < sections; section++) {
        NSInteger rows =  [self.tableView numberOfRowsInSection:section];
        for (int row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            if (indexPath.section == self.conveniSwicher.selectedSegmentIndex) {
                cell.hidden = YES;
            } else {
                cell.hidden = NO;
            }
            [cells addObject:cell];
        }
    }
    [self.tableView reloadData];
}
*/
@end
