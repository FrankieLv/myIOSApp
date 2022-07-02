//
//  WebbrowserViewController.m
//  myIOSApp
//
//  Created by 吕义丰 on 2022/6/11.
//

#import "WebbrowserViewController.h"

@implementation WebbrowserViewController

-(void)dealloc{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

-(void) viewDidLoad{
    [super viewDidLoad];

    // deletegate - It can also be set by the storyboard: drag the "delegate" to connect to the viewcontroller in the board.
    self.urlTextField.delegate = self;
    self.autocompleteTableView.delegate = self;
    self.autocompleteTableView.dataSource = self;
    
    // default load page on the "webbrowser" tab.
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://developer.apple.com"]]];
    
    // http load progress observer setup.
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    
    //autocomplet text setup for url textfield.
    self.pastUrls = [[NSMutableArray alloc] initWithObjects:@"www.baidu.com", @"developer.apple.com", @"www.google.com", @"www.github.com", @"www.dictionary.com", @"dlang.org/", @"dunderdle.com/", nil];
    self.autocompleteUrls = [[NSMutableArray alloc] init];
    self.autocompleteTableView.hidden = YES;
}

- (void)loadRequest:(NSString *)url {
    [self.urlTextField resignFirstResponder];// pack up the keyboard.
    self.autocompleteTableView.hidden = YES;
    
    if (![url hasPrefix:@"https"]) {
        url = [@"https://" stringByAppendingString:url];
    }
    
    if (![self.pastUrls containsObject:url]) {
      [self.pastUrls addObject:url];
    }
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: url]]];
}

- (IBAction)go:(id)sender {
    [self loadRequest:_urlTextField.text];
}
    
// it should be called to refresh the matched url in the autocomplete tableview for any character change in the url textfield.
- (void)reloadAutocompleteTableViewWithSubstring:(NSString *)substring {
    [self.autocompleteUrls removeAllObjects];
    for(NSString *pastUrl in self.pastUrls) {
        NSRange substringRange = [pastUrl rangeOfString:substring];
        if (substringRange.location == 0) {
          [self.autocompleteUrls addObject:pastUrl];
        }
      }

    [self.autocompleteTableView reloadData];
    CGRect frame = self.autocompleteTableView.frame;
    frame.size.height = self.autocompleteTableView.contentSize.height;
    self.autocompleteTableView.frame = frame;
}
  


// uitextfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.urlTextField resignFirstResponder];
    [self loadRequest:textField.text];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    self.autocompleteTableView.hidden = NO;
         
    NSString *url = [NSString stringWithString:textField.text];
    url = [url stringByReplacingCharactersInRange:range withString:string];
    
    [self reloadAutocompleteTableViewWithSubstring:url];
    return YES;
}


// uitableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
  return self.autocompleteUrls.count;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  UITableViewCell *cell = nil;
  static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
  cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
  if (cell == nil) {
      cell = [[UITableViewCell alloc] init];
  }
  
  cell.textLabel.text = [self.autocompleteUrls objectAtIndex:indexPath.row];
  return cell;
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
  UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
  self.urlTextField.text = selectedCell.textLabel.text;
  
  [self loadRequest: self.urlTextField.text];
}

// disaply http load progress on the page
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.progressView.progress = self.webview.estimatedProgress;
}
@end
