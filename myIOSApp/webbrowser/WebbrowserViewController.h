//
//  WebbrowserViewController.h
//  myIOSApp
//
//  Created by 吕义丰 on 2022/6/11.
//
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebbrowserViewController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet WKWebView *webview;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic, retain) NSMutableArray *pastUrls;
@property (nonatomic, retain) NSMutableArray *autocompleteUrls;
@property (weak, nonatomic) IBOutlet UITableView *autocompleteTableView;

- (void)reloadAutocompleteTableViewWithSubstring:(NSString *)substring;


@end
