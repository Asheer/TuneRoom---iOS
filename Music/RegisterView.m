//
//  RegisterView.m
//  Music
//
//  Created by Final on 3/7/15.
//  Copyright (c) 2015 Asheer Tanveer. All rights reserved.
//

#import "RegisterView.h"
#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>

@interface RegisterView ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UITextField *passAgain;



@end

@implementation RegisterView
- (IBAction)back:(id)sender {
    [self performSegueWithIdentifier:@"loginScreen" sender:self];
}
- (IBAction)backLogin:(id)sender {
    [self performSegueWithIdentifier:@"loginScreen" sender:self];
}
- (IBAction)register:(id)sender {
    if([self.name.text isEqualToString:@""] || [self.email.text isEqualToString:@""] || [self.pass.text isEqualToString:@""] || [self.passAgain.text isEqualToString:@""]) {
      
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Fields Empty." message:@"Please fill in all fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    if(![self.pass.text isEqualToString:self.passAgain.text]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Passwords do not match." message:@"Invalid." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        PFUser *user = [PFUser user];
        user.username = self.email.text;
        user.password = self.pass.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                [self performSegueWithIdentifier:@"logged" sender:self];
            } else {
                NSString *errorString = [error userInfo][@"error"];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error." message:@"There was a problem logging in." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }]; 
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Doany additional setup after loading the view.
    [self.name setBorderStyle:UITextBorderStyleNone];    [self.email setBorderStyle:UITextBorderStyleNone];
    [self.pass setBorderStyle:UITextBorderStyleNone];
    [self.passAgain setBorderStyle:UITextBorderStyleNone];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    UIImage *background = [UIImage imageNamed:@"signup.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"signup.png"] drawInRect:self.view.bounds];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.name resignFirstResponder];
    [self.email resignFirstResponder];
    [self.passAgain resignFirstResponder];
    [self.pass resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
