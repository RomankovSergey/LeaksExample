//
//  ZooKeepers.m
//  LeaksExample
//
//  Created by Сергей Романков on 22.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "ZooKeepers.h"



@interface ZooKeepers()
@property(strong, nonatomic)Animals* animals;

@end

@implementation ZooKeepers


- (instancetype)initWitnAnimals:(Animals*)animals
{
    self = [super init];
    if (self) {
        self.animals = animals;
    }
    return self;
}


-(void)needFeedAnimals{
    NSLog(@"Просьба покормить");
    [_animals feed];
}

-(void)dealloc{
    NSLog(@"the zookepers died");
}

@end
