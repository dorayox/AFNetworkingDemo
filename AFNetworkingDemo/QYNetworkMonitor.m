//
//  QYNetworkMonitor.m
//  AFNetworkingDemo
//
//  Created by qingyun on 15-3-19.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYNetworkMonitor.h"
#import "AFNetworkReachabilityManager.h"

@interface QYNetworkMonitor ()
@property (weak, nonatomic) IBOutlet UIButton *monitorBtn;
@property (nonatomic, strong) AFNetworkReachabilityManager *manager;

@end

@implementation QYNetworkMonitor

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

     _manager = [AFNetworkReachabilityManager sharedManager];
    
    [_manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *statusStr = AFStringFromNetworkReachabilityStatus(status);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络状态" message:statusStr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
    }];
}


- (IBAction)networkMonitoring:(UIButton *)button {
    
    if (!button.selected) {
        [_manager startMonitoring];
        button.selected = YES;
    } else {
        [_manager stopMonitoring];
        button.selected = NO;
    }
}






@end
