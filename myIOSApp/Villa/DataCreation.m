#import "DataCreation.h"
@implementation DataCreation

- (void)initData{
    data = @{@"Year":@"2022", @"Month": @"June", @"Date":@"1st"};
}

- (NSString *)convertToJsonString{
    NSError *jsonError;
    id jsonData = [NSJSONSerialization dataWithJSONObject:data options:0 error:&jsonError];

    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:(NSUTF8StringEncoding)];
    return jsonString;
}

@end

