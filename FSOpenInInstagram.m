//
//  FSOpenInInstagram.m
//  FSOpenInInstagram
//
//  Created by Felix Schulze on 27.06.2014
//  Copyright (c) 2014 Felix Schulze. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "FSOpenInInstagram.h"

#define INSTAGRAM_URL_SCHEME @"instagram://app"

@implementation FSOpenInInstagram {
    UIDocumentInteractionController *documentInteractionController;
}

- (void)dealloc {
    documentInteractionController.delegate = nil;
}

+ (BOOL)canSendInstagram {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:INSTAGRAM_URL_SCHEME]];
}

- (void)postImage:(UIImage *)image caption:(NSString *)caption inView:(UIView *)view {
    [self postImage:image caption:caption inView:view delegate:nil];
}

- (void)postImage:(UIImage *)image caption:(NSString *)caption inView:(UIView *)view delegate:(id<UIDocumentInteractionControllerDelegate>)delegate
{
    if (!image) {
        NSLog(@"ERROR: Image was nil");
        return;
    }

    NSString *filePath = [NSString stringWithFormat:@"%@/instagramshare.igo", NSTemporaryDirectory()];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];

    [UIImageJPEGRepresentation(image, 1.0) writeToFile:filePath atomically:YES];
    documentInteractionController.delegate = nil;
    documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    documentInteractionController.UTI = @"com.instagram.exclusivegram";
    documentInteractionController.delegate = delegate;
    if (caption) {
        documentInteractionController.annotation = [NSDictionary dictionaryWithObject:caption forKey:@"InstagramCaption"];
    }

    [documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:view animated:YES];
}

@end
