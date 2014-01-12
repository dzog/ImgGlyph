//
//  DZGDictionaryStringParser.m
//
//  Created by dzog on 1/12/14.
//  Copyright (c) 2014 dzog. All rights reserved.
//

#import "DZGDictionaryStringParser.h"

@implementation DZGDictionaryStringParser

+ (NSDictionary *)stringDictionaryFromString:(NSString *)string
{
    NSString *DICT_OPEN = @"{";
    NSString *DICT_CLOSE = @"}";
    NSString *QUOTE = @"\"";
    NSString *COLON = @":";
    NSString *COMMA = @",";
    
    NSMutableDictionary *theDictionary = [NSMutableDictionary new];

    NSScanner *theScanner = [NSScanner scannerWithString:string];
    
    if([theScanner scanString:DICT_OPEN intoString:NULL]) {
        NSString *key;
        NSString *value;
        
        while(![theScanner isAtEnd]) {
            if([theScanner scanString:QUOTE intoString:NULL] &&
               [theScanner scanUpToString:QUOTE intoString:&key] &&
               [theScanner scanString:QUOTE intoString:NULL] &&
               [theScanner scanString:COLON intoString:NULL] &&
               [theScanner scanString:QUOTE intoString:NULL] &&
               [theScanner scanUpToString:QUOTE intoString:&value] &&
               [theScanner scanString:QUOTE intoString:NULL]) {
                
                [theDictionary setObject:value forKey:key];
                
                if([theScanner scanString:COMMA intoString:NULL]) {
                    continue; //another pair
                } else if([theScanner scanString:DICT_CLOSE intoString:NULL]) {
                    break; //clean end
                } else {
                    break; //error
                }
            } else {
                break; //error or empty dictionary
            }
        }
    } else {
        //error
    }
    
    return theDictionary;
}

@end
