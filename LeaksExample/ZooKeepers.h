//
//  ZooKeepers.h
//  LeaksExample
//
//  Created by Сергей Романков on 22.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animals.h"

@protocol ZooKeepersDelegate <NSObject>

-(void)needFeedAnimals;

@end

@interface ZooKeepers : NSObject <ZooKeepersDelegate>

- (instancetype)initWitnAnimals:(Animals*)animals;


@end
