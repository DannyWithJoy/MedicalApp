//
//  SkinExaminationReportViewController.m
//  Medical
//
//  Created by 许冬 on 2019/5/18.
//  Copyright © 2019 Danny. All rights reserved.
//

#import "SkinExaminationReportViewController.h"
#import <UIKit/UIKit.h>


@interface SkinExaminationReportViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation SkinExaminationReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.contentView.layer.borderWidth = 0.5;
    self.contentView.layer.borderColor = [[UIColor darkGrayColor] CGColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
