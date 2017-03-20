//
//  WebViewController.m
//  Week1Assessment-(Ard)
//
//  Created by ardMac on 20/03/2017.
//  Copyright © 2017 ardMac. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  self.webView.delegate = self;
    [self loadURL];
    // Do any additional setup after loading the view.
}

- (void)loadURL {
    
    NSURL *URL = [NSURL URLWithString:@"https://google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL]; //can just assign it directly if it's static
    
    
    [self.webView loadRequest:request];
    
}
//-(void)webView:(UIWebView*)webView didFailLoadWithError:(NSError *)error {
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GENIUS" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *dismissAction = [ UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:NULL];
//    [alert addAction:dismissAction];
//    [self presentViewController:alert animated:YES completion:NULL];
//    
//    if ([error code] == NSURLErrorCancelled) {return;}
//    
//}

@end
