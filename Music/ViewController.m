//
//  ViewController.m
//  Music App
//
//  Created by Final on 3/7/15.
//  Copyright (c) 2015 Asheer Tanveer. All rights reserved.
//

#import "ViewController.h"
#import "OnlineScreen.h"
#import <Parse/Parse.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UIButton *log;
@property (weak, nonatomic) IBOutlet UIButton *registerAccount;
@end

@implementation ViewController
- (IBAction)login:(id)sender {
    [PFUser logInWithUsernameInBackground:self.username.text password:self.pass.text block:^(PFUser *user, NSError *error) {
        if(!error) {
            NSLog(@"logging in..");
           [self performSegueWithIdentifier:@"logged" sender:self];
        } else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error." message:@"There was a problem logging in." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self login:self];
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.username.delegate = self;
    self.pass.delegate = self;

    self.username.borderStyle = UITextBorderStyleRoundedRect;
    [self.pass setSecureTextEntry:YES];
    [self.pass setBorderStyle:UITextBorderStyleNone];
    [self.username setBorderStyle:UITextBorderStyleNone];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    UIImage *background = [UIImage imageNamed:@"signin.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"signin.png"] drawInRect:self.view.bounds];
    background = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:background];
    
    CGRect rect = CGRectMake(0,0,screenWidth,screenHeight);
    UIGraphicsBeginImageContext( rect.size );
    [background drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    
    
    //[self.view addSubview:backgroundImage];
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:img];

    [self.view endEditing:YES];
    
    
    NSLog(@"width: %f height: %f",screenWidth,screenHeight);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.username resignFirstResponder];
    [self.pass resignFirstResponder];
}

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
