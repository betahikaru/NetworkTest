//
//  ViewController.h
//  NetworkTest
//
//  Created by 鈴木 光 on 2015/01/18.
//  Copyright (c) 2015年 betahikaru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

- (IBAction)upButton:(id)sender;

- (NSString*)getHttpDataWithUrl:(NSString*)url;
@end

