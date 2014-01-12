//
//  DZGDictionaryStringParser.h
//
//  Parse a string representing a String->String dictionary into an NSDictionary
//  (e.g. {"key1","val1", "key2","val2"})
//
//  Useful for IB-driven attributes and more
//
//  Created by dzog on 1/12/14.
//  Copyright (c) 2014 dzog. All rights reserved.
//
//  http://dzog.io
//

#import <Foundation/Foundation.h>

@interface DZGDictionaryStringParser : NSObject

+ (NSDictionary *)stringDictionaryFromString:(NSString *)string;

@end
