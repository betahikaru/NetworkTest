//
//  ViewController.m
//  NetworkTest
//
//  Created by 鈴木 光 on 2015/01/18.
//  Copyright (c) 2015年 betahikaru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Property
@synthesize label1, label2, label3;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)upButton:(id)sender {
    label1.text = [self getHttpDataWithUrl:@"http://api.tiqav.com/search/random.json"];
    label2.text = [self getHttpDataWithUrl:@"http://localhost:8000/test.json"];
    label3.text = [self getHttpDataWithUrl:@"https://google.com"];
}

#pragma mark - HttpRequest

- (NSString*)getHttpDataWithUrl:(NSString*)url {
    NSURL *nsUrl = [[NSURL alloc]initWithString:url];
    NSError *error;
    NSURLResponse *response;
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:nsUrl
                                 cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                             timeoutInterval:10];
    NSData *resData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSMutableString *value = [[NSMutableString alloc] init];
    [value appendString:url];
    [value appendString:@"\n"];
    if(error) {
        NSLog(@"error: %@", error);
        [value appendString:error.description];
        return value;
    } else {
        NSLog(@"resData: %@", resData);
        [value appendString:resData.description];
        return value;
    }
}

    /*
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
         if (error != nil) {
             NSLog(@"error:: %@", error);
             return;
         }
         NSArray ** = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingAllowFragments
                                                           error:nil];
         NSMutableArray *tiqavs = [[NSMutableArray alloc] init];
         for (id img in json) {
             NSString *imgId = img[@"id"];
             NSString *ext = img[@"ext"];
             NSMutableString *imageUrl = [[NSMutableString alloc] init];
             [imageUrl appendString:@"http://img.tiqav.com/"];
             [imageUrl appendString:imgId];
             [imageUrl appendString:@"."];
             [imageUrl appendString:ext];
             [tiqavs addObject:imageUrl];
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             NSMutableString *newStr = [[NSMutableString alloc] init];
             [newStr appendString:labelMain.text];
             [newStr appendString:@","];
             [newStr appendString:tiqavs[0]];
             labelMain.text = newStr;
         });
     }];
     
     */

@end
