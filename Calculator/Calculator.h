#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign) int numberOnScreen;

-(void) pressKey:(char) theKey;

@end
