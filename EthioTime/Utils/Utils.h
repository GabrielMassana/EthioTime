//
//  Utils.h
//  EthioTime
//
//  Created by Gabriel Massana on 1/8/14.
//  Copyright (c) 2014 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//#define UI_USER_INTERFACE_IDIOM() \ ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] ? \ [[UIDevice currentDevice] userInterfaceIdiom] : \ UIUserInterfaceIdiomPhone)

#define IPAD                    UIUserInterfaceIdiomPad

@end
