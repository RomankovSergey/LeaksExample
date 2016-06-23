//
//  People.h
//  LeaksExample
//
//  Created by Сергей Романков on 23.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

- (instancetype)initWithName:(NSString*)name;
-(void)startEating:(void(^)(BOOL isLike))complete;

@end
