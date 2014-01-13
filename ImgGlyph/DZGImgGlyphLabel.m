//
//  DZGImgGlyphLabel.m
//  ImgGlyph v1.0
//
//  Inline image-sourced font-sized glyphs.  Using new iOS 7 TextKit APIs.
//
//  Created by dzog on 1/11/14.
//  Copyright (c) 2014 dzog. All rights reserved.
//
//  http://dzog.io
//

#import "DZGImgGlyphLabel.h"
#import "DZGDictionaryStringParser.h"

@implementation DZGImgGlyphLabel

- (void)drawTextInRect:(CGRect)rect
{
    NSDictionary *imageMap;
    if(self.imgMapString) {
        imageMap = [[NSDictionary alloc] initWithDictionary:[DZGDictionaryStringParser stringDictionaryFromString:self.imgMapString]];
    } else {
        imageMap = self.imgMap;
    }
    
    for (NSString *keyString in imageMap) {
        
        NSString *imageName = [imageMap valueForKey:keyString];
        
        NSAttributedString *searchAttr = self.attributedText;
        NSMutableAttributedString *finalString = [NSMutableAttributedString new];
        
        NSRange range = [searchAttr.string rangeOfString:keyString];
        
        if(range.location == NSNotFound) {
            continue;
        }
        
        while(YES) {
                        
            NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
            
            UIImage *orig = [UIImage imageNamed:imageName];
            
            NSDictionary *charAttrs = [searchAttr attributesAtIndex:range.location effectiveRange:nil];
            UIFont *attrFont = [charAttrs valueForKey:@"NSFont"];
            CGFloat fontHeight = (attrFont ? attrFont.capHeight : self.font.capHeight);
               
            CGSize newSize = CGSizeMake(orig.size.width * (fontHeight / orig.size.height),fontHeight);
            
            UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0f);
            [orig drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            attachment.image = newImage;
            
            NSAttributedString *one = [searchAttr attributedSubstringFromRange:NSMakeRange(0, range.location)];
            
            NSAttributedString *two = [searchAttr attributedSubstringFromRange:NSMakeRange(range.location+range.length,searchAttr.string.length - (range.location+range.length))];
            
            NSMutableAttributedString *imageAttrString = [[NSAttributedString attributedStringWithAttachment:attachment] mutableCopy];
            
            //paragraph style can be used for centering and padding, but there are some issues
            /*
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init] ;
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            [paragraphStyle setParagraphSpacing:10];
            [imageAttrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [imageAttrString length])];
             */
            
            [finalString appendAttributedString:one];
            [finalString appendAttributedString:imageAttrString];
            
            searchAttr = two;
            range = [searchAttr.string rangeOfString:keyString];
            
            if(range.location == NSNotFound) {
                [finalString appendAttributedString:two];
                break;
            }
        }
        
        self.attributedText = finalString;
    }
    
    [super drawTextInRect:rect];
}

@end
