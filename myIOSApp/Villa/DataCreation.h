//
//  DataCreation.h
//  myIOSApp
//
//  Created by 吕义丰 on 2022/5/31.
//

#import <Foundation/Foundation.h>
@interface DataCreation : NSObject{
    NSDictionary * data;
}

- (void)initData;
- (NSString *)convertToJsonString;

@end
