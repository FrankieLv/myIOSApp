#import "Practice.h"
#import "DataCreation.h"
#import "FileCreation.h"
#import "Converter.h"
@implementation Practice

- (void)start{
    DataCreation *dataCreation = [[DataCreation alloc]init];
    [dataCreation initData];
    NSString *jsonString = [dataCreation convertToJsonString];
    
    FileCreation *fileCreation = [[FileCreation alloc]init];
    [fileCreation saveDataToFile:jsonString];
    
    Converter *convert = [[Converter alloc]init];
    
    [convert convertToDictionary];
}

@end



