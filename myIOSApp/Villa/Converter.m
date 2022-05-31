#import "Converter.h"
@implementation Converter

- (void)convertToDictionary{
    NSArray<NSString *> *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"Date.txt"];
    
    NSData *fileContent = [fileManager contentsAtPath:filePath];
    
    NSError *jsonError;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:fileContent options:0 error:&jsonError];
    
    NSLog(@"The dictionary:%@", data);
}

@end
