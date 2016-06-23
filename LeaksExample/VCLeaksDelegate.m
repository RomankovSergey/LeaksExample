//
//  VCLeaksDelegate.m
//  LeaksExample
//
//  Created by Сергей Романков on 22.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "VCLeaksDelegate.h"
#import "Animals.h"

@interface VCLeaksDelegate ()
@property(strong, nonatomic)NSMutableArray* arrayAnimals;
@property(strong, nonatomic)NSArray* arrayNames;
- (IBAction)onCleateAnimals:(id)sender;
- (IBAction)onDeleteAnimals:(id)sender;



@end

@implementation VCLeaksDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayAnimals = [NSMutableArray new];
    self.arrayNames = @[@"Вася", @"Петя", @"Костя", @"Гриша", @"Настя"];
}

#pragma mark - action

- (IBAction)onCleateAnimals:(id)sender {
    [self createAnimals];
}

- (IBAction)onDeleteAnimals:(id)sender {
    [self deleteLastAnimals];
}


-(void)createAnimals{
    NSInteger index = arc4random()%self.arrayNames.count;
    NSString* name = self.arrayNames[index];
    Animals* animals = [[Animals alloc] initWithName:name];
    [self.arrayAnimals addObject:animals];
    [self showAlertWithMessage:[NSString stringWithFormat:@"Создали %@", name]];
}

-(void)deleteLastAnimals{
    Animals* animals = [self.arrayAnimals lastObject];
    [self showAlertWithMessage:[NSString stringWithFormat:@"Удалили %@", [animals getNameAnimals]]];
    [self.arrayAnimals removeLastObject];
}

-(void)showAlertWithMessage:(NSString*)message{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertView show];
}

@end
