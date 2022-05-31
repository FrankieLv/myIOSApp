//
//  PracticeTask1.m
//  myIOSApp
//
//  Created by 吕义丰 on 2022/5/27.
//
#import "PracticeTask1.h"
@implementation PracticeTask1

- (void)convertAndSaveData{
    // 1. init data
    NSDictionary * userInfo1 = @{@"name":@"frankie", @"sex": @"male", @"address":@"dalian"};
    NSLog(@"1.init a dictionary successfully");
    
    // 2. convert data to string with json format
    NSError *jsonError;
    id jsonData = [NSJSONSerialization dataWithJSONObject:userInfo1 options:0 error:&jsonError];

    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:(NSUTF8StringEncoding)];
    
    NSLog(@"2.convert the dictionary to the jsonstring:%@", jsonString);
    
    // 3. save json string into a file
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPatch = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [documentPatch stringByAppendingPathComponent:@"userinfo.txt"];
    [fileManager createFileAtPath:filePath contents:jsonData attributes:nil];
    NSLog(@"3.save the string into the json file successfully");
    
    // 4. read file content and covert it to a dictionary
    BOOL isFileExist = [fileManager fileExistsAtPath:filePath];

    if(isFileExist){
        NSData *fileContent = [fileManager contentsAtPath:filePath];
        NSDictionary *userInfo2 = [NSJSONSerialization JSONObjectWithData:fileContent options:0 error:&jsonError];
        NSLog(@"4.read the json file and convert to dictionary:%@", userInfo2);
        
        [fileManager removeItemAtPath:filePath error:&jsonError];
        NSLog(@"5.remove the json file");
    }
}

@end
