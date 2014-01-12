ImgGlyph
========

ImgGlyphLabel and ImgGlyphTextView are subclasses of (drop-in replacements for) UILabel and UITextView that allow for correctly sized in-line images (image glyphs) by replacing certain characters or strings with specified images. 


Purpose
-------

iOS has no built-in support for including images in-line with text within UILabels or UITextViews. These classes provide that, with an easy replace-search-string-with-auto-resized-image interface and a mapping configurable within Interface Builder. 


Demo
---
![ImgGlyph Example](http://i.imgur.com/H4yoFRM.png)

Supported iOS & SDK Versions
----------------------------
* Supported build target - iOS 7.0 (Xcode 5.0, Apple LLVM compiler 5.0)
* Supported deployment target - iOS 7.0

ImgGlyph takes advantage of the new Text Kit based rearchitecture of UILabel and UITextView and is incompatible with iOS versions prior to 7.0.


Usage
-----
For ease of use, ImgGlyph classes are configurable completely within Interface Builder. 

1. Replace a UILabel and/or UITextView class with DZGImgGlyphLabel and/or DZGImgGlyphTextView. Use the 'Custom Class' field within the Identity Inspector. This can be done in-place for existing views. 

2. Add a User Defined Runtime Attribute:
     Key Path: imgMapString
         Type: String
        Value: {"str1":"img1.png", "str2":"img2.png"}

    Value is a dictionary-like string of key-value pairs in the form of key_string:image_name. Whitespace (outside of quotes) is ignored. 
        Examples of Value parameter: 
            - {"[save]":"floppy.png"}
            - {"%c":"circle.png","%q":"sq.png"}
            - { ":)" : "smile.png", ":p" : "razz.png", "o_O" : "wtf.png" }

One may also set a dictionary directly via the `setImgMap' message to an ImgGlyph instance. 
