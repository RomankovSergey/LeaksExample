//
//  People.m
//  LeaksExample
//
//  Created by Сергей Романков on 23.06.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "People.h"
#import "UiKit/UIImage.h"



@implementation People{
   __strong void(^_completeEat)(BOOL isLike);
    NSString* _name;
    UIImage* _image;
}

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        _name = name;
        _image = [UIImage imageNamed:@"molekulyarnoe-oblako-ro.jpg"];
        NSLog(@"Создали, %@",_name);
    }
    return self;
}


-(void)startEating:(void(^)(BOOL isLike))complete{
    _completeEat = complete;
    [self _startEating];
}

#pragma mark - private

-(void)_startEating{
    [self performSelector:@selector(_completeEating) withObject:self afterDelay:3.f];
    NSLog(@"%@ Начал кушать", _name);
}

-(void)_completeEating{
    _completeEat([self getYesOrNo]);
}

-(BOOL) getYesOrNo
{
    int tmp = (arc4random() % 30)+1;
    if(tmp % 5 == 0)
        return YES;
    return NO;
}

-(void)dealloc{
    NSLog(@"%@ died",_name);
}

@end
