//
//  VCLeaksBlocks.m
//  LeaksExample
//
//  Created by Сергей Романков on 23.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "VCLeaksBlocks.h"
#import "People.h"

@interface VCLeaksBlocks()
- (IBAction)onCreatePeople:(id)sender;


@end


@implementation VCLeaksBlocks{
    NSMutableArray* _arrayPeople;
    NSString* _messageISLike;
    NSString* _messageUnLike;
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    _arrayPeople = [NSMutableArray new];
    _messageISLike = @"Костя покушал, ему понравилось.";
    _messageUnLike = @"Костя покушал, ему не понравилось.";
    
}

#pragma mark - action
- (IBAction)onCreatePeople:(id)sender {
    [self createPeople];
}

-(void)createPeople{
    People* people = [[People alloc] initWithName:@"Костя"];
    [_arrayPeople addObject:people];
    
    [people startEating:^(BOOL isLike) {
        NSString* message = (isLike) ? _messageISLike : _messageUnLike;
        [self showAlertWithMessage:message];
    }];
}

-(void)showAlertWithMessage:(NSString*)message{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)dealloc{
    NSLog(@"VCLeaksBlocks died");
}


@end
