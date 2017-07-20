//
//  RunModel.h
//  JDTestRunTime
//
//  Created by judy on 2017/5/22.
//  Copyright © 2017年 judy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSMutableString *runName;

@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) NSMutableArray *runArray;

@property (nonatomic, strong) NSDictionary *dict;

@property (nonatomic, strong) NSMutableDictionary *runDict;

@property (nonatomic, strong) NSAttributedString *attStr;

@property (nonatomic, strong) NSMutableAttributedString *runAttStr;

@property (nonatomic, strong) NSData *data;

@property (nonatomic, strong) NSMutableData *runData;

@property (nonatomic, strong) NSSet *set;

@property (nonatomic, strong) NSMutableSet *runSet;

@property (nonatomic, strong) NSOrderedSet *orderedSet;

@property (nonatomic, strong) NSMutableOrderedSet *runOrderedSet;

@property (nonatomic, strong) NSIndexSet *indexSet;

@property (nonatomic, strong) NSMutableIndexSet *runIndexSet;

@end
