//
//  Animals.m
//  LeaksExample
//
//  Created by Сергей Романков on 22.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "Animals.h"
#import "ZooKeepers.h"


@interface Animals()
@property(strong, nonatomic)ZooKeepers* zookepers;
@property(strong, nonatomic)NSString* name;

@end

@implementation Animals


- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.zookepers = [[ZooKeepers alloc] initWitnAnimals:self];
        self.name = name;
        NSLog(@"Создали %@", name);
    }
    return self;
}

-(NSString*)getNameAnimals{
    return self.name;
}

-(void)feed{
    NSLog(@"%@ покормили", self.name);
}

-(void)startRoam{
    [self performSelector:@selector(_startRoam) withObject:self afterDelay:3.f];
}

#pragma mark - private

-(void)_startRoam{
    NSLog(@"%@ гуляет",self.name);
    
    BOOL flagEat = [self getYesOrNo];
    if(flagEat){
        [self.zookepers needFeedAnimals];
    }
    [self startRoam];
}


-(BOOL) getYesOrNo
{
    int tmp = (arc4random() % 30)+1;
    if(tmp % 5 == 0)
        return YES;
    return NO;
}

-(void)dealloc{
    NSLog(@"%@ died",self.name);
}


@end
