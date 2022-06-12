# myIOSApp
IOS APP Practice
1. UIWindow -> UINavigationController -> UITabBarViewController -> WebbrowserViewController / ViewController2 / ViewController3 ...
myIOSApp Practice: "webbrowser", "demo 2"(pending), "demo 3"(pending) ...

2. AppDelegate: didFinishLaunchingWithOptions
  + The existing pattern is to set self.window.rootViewController = navigationController; The root viewcontroller of navigationController is to set the tabbarviewcontroller which is created in the storyboard
  + TODO - A demo to create both the navigationcontroller and tabbarcontroller in the storyboard.

3. TODO -> Another option is to use the pattern UIWindow -> UITabBarViewController -> UINavigationController1 / UINavigationController2 / UINavigationController3 -> Each NavigationController has its own viewController.

# Demo 1 - Webbrowser
+ WebbrowserViewController: It's first tab view of tabbar.
  - URL UITextField: WebbrowserViewController is set as the delegate for it.
  - Go Button: It's used to trigger the http request per the URL. Another way is to implement the method "textFieldShouldReturn" of the URL UITextField delegate to trigger the http request per the URL value.
  - WKWebview: it's used to load the page with the http url of url textfield.
  - UIProgressView + (WKWebview: addObserver): To display the http load progress on the  page.
  - UITableView: To implement the autocomplete text in the URL text field.
    * pastUrls: Any new url will be added into by clicking the "return" keyword in the keyboard or click "Go" button.
    * autocompleteUrls: Any change in the URL Textfield will find the matched the past url and add this past URL into the autocompleteUrls, then the UITableView is to reload it to display all the possible autocomplete urls on the page for user. A http request wil be sent to load the page per the selected url in the UITableView. The UITableView should never be displayed on the page(autCompleteUrls is empty) at the beginning since user has no any post url yet.
 # Demo 2 - Pending
