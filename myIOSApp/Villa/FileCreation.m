#import "FileCreation.h"

@implementation FileCreation

- (void)saveDataToFile:(NSString *)jsonString{
    NSArray<NSString *> *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"Date.txt"];
    [fileManager createFileAtPath:filePath contents:jsonString attributes:nil];
}


@end

