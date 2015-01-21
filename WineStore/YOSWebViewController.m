//
//  YOSWebViewController.m
//  WineStore
//
//  Created by Yosnier on 10/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "YOSWebViewController.h"



@interface YOSWebViewController ()

@end

@implementation YOSWebViewController

#pragma mark - Init

-(id) initWithModel:(YOSWineModel *) pModel
{
    
    if ( self  =  [super initWithNibName:nil
                                  bundle:nil])
    {
        _model = pModel;
        self.title = pModel.wineCompanyName;
    }
    return self;
}


#pragma mark - Ciclo de vida

// Mantiene sincronizado modelo y vista.
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self syncModelToView];
}


#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}


#pragma mark - Util

-(void) syncModelToView
{
    self.title = self.model.wineCompanyName;
    self.browserView.delegate = self;
    [self.browserView loadRequest:[NSURLRequest requestWithURL:self.model.webCompany]];
}


@end
