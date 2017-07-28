//
//  RunTimeObject.m
//  JDTestRunTime
//
//  Created by judy on 2017/5/22.
//  Copyright © 2017年 judy. All rights reserved.
//

#import "RunTimeObject.h"
#import <objc/runtime.h>

#import <math.h>

@implementation RunTimeObject

+ (id)getCopyWithClass:(id)cla {
    u_int               count;
    
    objc_property_t*    properties= class_copyPropertyList([cla class], &count);
    
    id retModel = [[[cla class] alloc] init];
    if (count) {
        for (int i = 0; i < count ; i++) {
            const char* char_f =property_getName(properties[i]);
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            id propertyValue = [cla valueForKey:(NSString *)propertyName];
            Class class = [propertyValue class];
            
            if ([class isSubclassOfClass:[NSMutableArray class]]) {
                NSMutableArray *arr = [NSMutableArray arrayWithArray:propertyValue];
                [retModel setValue:arr forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableString class]]) {
                NSMutableString *str = [[NSMutableString alloc] initWithString:propertyValue];
                [retModel setValue:str forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableDictionary class]]) {
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:propertyValue];
                [retModel setValue:dic forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableData class]]) {
                NSMutableData *data = [[NSMutableData alloc] initWithData:propertyValue];
                [retModel setValue:data forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableAttributedString class]]) {
                NSMutableAttributedString *muAttStr = [[NSMutableAttributedString alloc] initWithAttributedString:propertyValue];
                [retModel setValue:muAttStr forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableSet class]]) {
                NSMutableSet *set = [[NSMutableSet alloc] initWithSet:propertyValue];
                [retModel setValue:set forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableIndexSet class]]) {
                NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] initWithIndexSet:propertyValue];
                [retModel setValue:indexSet forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableOrderedSet class]]) {
                NSMutableOrderedSet *orderedSet = [[NSMutableOrderedSet alloc] initWithOrderedSet:propertyValue];
                [retModel setValue:orderedSet forKey:propertyName];
            }
        }
    } else {
        if ([cla isKindOfClass:[NSMutableDictionary class]]) {
            retModel = [[NSMutableDictionary alloc] initWithDictionary:cla];
        } else if ([cla isKindOfClass:[NSMutableArray class]]) {
            retModel = [NSMutableArray arrayWithArray:cla];
        } else if ([cla isKindOfClass:[NSMutableString class]]) {
            retModel = [[NSMutableString alloc] initWithString:cla];
        } else if ([cla isKindOfClass:[NSMutableData class]]) {
            retModel = [NSMutableData dataWithData:cla];
        } else if ([cla isKindOfClass:[NSMutableAttributedString class]]) {
            retModel = [[NSMutableAttributedString alloc] initWithAttributedString:cla];
        } else if ([cla isKindOfClass:[NSMutableSet class]]) {
            retModel = [[NSMutableSet alloc] initWithSet:cla];
        } else if ([cla isKindOfClass:[NSMutableIndexSet class]]) {
            retModel = [[NSMutableIndexSet alloc] initWithIndexSet:cla];
        } else if ([cla isKindOfClass:[NSMutableOrderedSet class]]) {
            retModel = [[NSMutableOrderedSet alloc] initWithOrderedSet:cla];
        }
    }
    return retModel;
}

@end
