//
//  ViewController.m
//  DCZNerdfeed
//
//  Created by Christine Gornall on 4/6/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZCoursesViewController.h"

@interface DCZCoursesViewController ()

@property NSURLSession *session;

@end

@implementation DCZCoursesViewController

- (void)fetchFeed{
    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          NSLog(@"%@", json);
                                      }];
                                      
    [dataTask resume];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        self.navigationItem.title = @"Courses";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
