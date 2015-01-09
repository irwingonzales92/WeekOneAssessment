//
//  WebViewController.m
//  WeekOneAssesment
//
//  Created by Irwin Gonzales on 1/9/15.
//  Copyright (c) 2015 Irwin Gonzales. All rights reserved.
//

#import "WebViewController.h"
#import "ViewController.h"

@interface WebViewController () <UIWebViewDelegate, UIScrollViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *addressString = @"http://mobilemakers.co";
    NSURL *addressURL = [NSURL URLWithString:addressString];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
    [self.webView loadRequest:addressRequest];
    self.webView.scrollView.delegate = self;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *newAddressString = [[NSString alloc]init];
    
    if ([textField.text rangeOfString:@"http://"].location == NSNotFound)
    {
        newAddressString = [NSString stringWithFormat:@"http://%@", textField.text];
    }
    else
    {
        newAddressString = textField.text;
    }
    
    NSURL *addressURL = [NSURL URLWithString:newAddressString];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
    [self.webView loadRequest:addressRequest];
    return true;
}

// Controls the "Loading" Spinneer
// Start

-(void)webViewDidStartLoad:(UIWebView *)webView
    {
        [self.spinner startAnimating];
        self.spinner.hidden = false;
    }

-(void)webViewDidFinishLoad:(UIWebView *)webView
    {
        [self.spinner stopAnimating];
        self.spinner.hidden = true;
//Finsih
    }

@end
