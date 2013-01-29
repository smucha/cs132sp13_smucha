/**
 @file main.m
 @author Prof. Adams
 @date 2013 01 18
 */

#import <Foundation/Foundation.h>

/**
 @brief Entry point for the program - sets up objects and puts everything in motion
 @returns EXIT_SUCCESS if all went well
 */
int main(void)
{
    
    @autoreleasepool {
        
        
        NSMutableArray* words = nil;
        words = [[NSMutableArray alloc] init];
        
        NSLog(@"words, Uninitialized: (null)");
        
        NSLog(@"words, Initialized: %@", words);
        
        [words addObject:(@", ")];
        NSLog(@"words, one added: %@", words);
        
        [words addObject:(@"Hello")];
        NSLog(@"words, two added: %@", words);
        
        [words addObject:(@"world")];
        NSLog(@"words, all added: %@", words);
        
        [words sortUsingSelector: @selector(localizedCaseInsensitiveCompare:)];
        NSLog(@"words, sorted using localizedCaseInsensitiveCompare: %@", words);
        
    }
    return EXIT_SUCCESS;
}