//
//  ViewController.m
//  AsyncQuerySample
//
//  Created by kishikawakatsumi on 12/2/15.
//  Copyright © 2015 Realm. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>

@interface Book : RLMObject

@property NSString *title;

@end

@implementation Book

@end

@interface ViewController ()

@property (nonatomic) RLMNotificationToken *token;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonAction:(id)sender {
//    [self.token stop];
    self.token = [[Book allObjects] addNotificationBlock:^(RLMResults * _Nullable results, NSError * _Nullable error) {
        NSLog(@"%@", error);
        NSLog(@"%@", results);
    }];
}

@end
