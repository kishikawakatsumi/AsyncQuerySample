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

    [[RLMRealm defaultRealm] transactionWithBlock:^{
        [[RLMRealm defaultRealm] deleteAllObjects];
    }];

    [[RLMRealm defaultRealm] transactionWithBlock:^{
        for (int i = 0; i < 2; i++) {
            Book *book = [Book new];
            book.title = @"Realm";
            [[RLMRealm defaultRealm] addObject:book];
        }
    }];
}

- (IBAction)buttonAction:(id)sender {
    self.token = [[Book objectsWhere:@"title CONTAINS %@", @"Realm"] addNotificationBlock:^(RLMResults * _Nullable results, NSError * _Nullable error) {
        NSLog(@"%@", error);
        NSLog(@"%@", results);
    }];
    self.token = [[Book objectsWhere:@"title CONTAINS %@", @"Realm"] addNotificationBlock:^(RLMResults * _Nullable results, NSError * _Nullable error) {
        NSLog(@"%@", error);
        NSLog(@"%@", results);
    }];
}

@end
