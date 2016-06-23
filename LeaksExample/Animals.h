//
//  Animals.h
//  LeaksExample
//
//  Created by Сергей Романков on 22.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnimalsDelegate <NSObject>

-(void)feed;

@end

@interface Animals : NSObject <AnimalsDelegate>

- (instancetype)initWithName:(NSString*)name;
-(void)startRoam;
-(NSString*)getNameAnimals;

@end
