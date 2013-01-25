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
        
        //NSLog is mostly like printf
        NSLog(@"Hello, World!");
        
        //Special characters still work
        NSLog(@"Hello\nWorld!");
        
        //Old tokens still work
        NSLog(@"String: [%s] Character: [%c] Decimal: [%d]", "string", 'c', 19);
        
        //You can also use the %@ token for NSStrings like @"Hi"
        NSLog(@"%@, World!", @"Howdy");
        
        //And for NSNumbers like @42
        NSLog(@"Hello, %@ world.", @42);
        
        //And for other, stranger things
        NSLog(@"Hello, %@ world.", [NSDictionary dictionaryWithObjectsAndKeys:
                                    @20, @"Age",
                                    @"F", @"First Initial",
                                    @"Last", @"Last Name",
                                    @3.4, @"GPA",
                                    nil]);
        
        //String variables need to be pointers. Object pointers are initialized to nil (nut NULL)
        NSString* ihw = nil;
        
        //Which can also be used with the %@ token, even when nil!
        NSLog(@"Hello, [%@] world.", ihw);
        
        //A string literals *means* "a pointer to that string"
        ihw = @"Non-nil";
        NSLog(@"Hello, [%@] world.", ihw);
        
        //They can also be pre-assembled, printf-style
        ihw = [[NSString alloc] initWithFormat:@"%d bottles of %@ on the wall", 99, @"beer"];
        NSLog(@"Hello, [%@] world.", ihw);
        
        //There's also a "Mutable" kind of string, that you can "mutate" (change)
        NSMutableString* mhw = nil;
        NSLog(@"Mutable [%@] world.", mhw);
        
        //We'll make one based on our existing string
        mhw = [NSMutableString stringWithString:ihw];
        NSLog(@"Mutable [%@] world.", mhw);
        
        //Going to change the string...
        [mhw insertString:@"!!frobnozz!!" atIndex:6];
        NSLog(@"Mutable [%@] world.", mhw);
        
        //Immutable strings can't be mutated - that's a compile error!
        //[ihw insertString:@"!!frobnozz!!" atIndex:5];
        
    }
    return EXIT_SUCCESS;
}