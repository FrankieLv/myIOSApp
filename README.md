# myIOSApp
IOS APP Practice:
A TabBar is used to manage all the demos in each tab.

1. UIWindow -> UINavigationController -> UITabBarViewController -> WebbrowserViewController / ViewController2 / ViewController3 ...
myIOSApp Practice: "webbrowser", "demo 2"(pending), "demo 3"(pending) ...

2. AppDelegate: didFinishLaunchingWithOptions
  + The current pattern is to set self.window.rootViewController = navigationController; The root viewcontroller of navigationController is been associated with the tabbarviewcontroller which is created in the storyboard.
  + TODO - A demo to create both the navigationcontroller and tabbarcontroller in the storyboard.

3. TODO -> Another option is to use the pattern UIWindow -> UITabBarViewController -> UINavigationController1 / UINavigationController2 / UINavigationController3 -> Each NavigationController has its own viewController.
4. No demo of UINavigationController yet. It's been prepared for the future demo.

# Demo 1 - Webbrowser
User can input the url in the UITextField and WKWebView can load the website per the url
+ WebbrowserViewController:
  - URL UITextField: The WebbrowserViewController is set as the delegate for it.
  - Go Button: It's used to trigger the http request per the URL. Another way is to implement the method "textFieldShouldReturn" of the URL UITextField delegate to trigger the http request per the URL value.
  - WKWebview: it's used to load the page per the url in the UITextField.
  - UIProgressView + (WKWebview: addObserver): To display the http load progress on the page.
  - UITableView: To implement the autocomplete text in the URL UITextField.
    * pastUrls: Any new url will be added into by clicking the "return" keyword in the keyboard or click "Go" button.
    * autocompleteUrls: Any change in the URL Textfield will try to match the past url and add this past URL into the autocompleteUrls, then the UITableView is to reload it to display all the available autocomplete urls on the page for user. If user selects a specific url in the UITableView, A http request wil be sent to load the page per the selected url. The UITableView should never be displayed on the page(autCompleteUrls is empty) at the beginning since user has no any post url yet.
    * datasource/delegate: The WebbrowserViewController is set as the delegate for it.
 # Demo 2 - Pending
 # Demo 3 - ...
