//
//  InviteRoomViewController.m
//  Music
//
//  Created by Final on 3/7/15.
//  Copyright (c) 2015 Asheer Tanveer. All rights reserved.
//

#import "InviteRoomViewController.h"

@interface InviteRoomViewController ()

@end

@implementation InviteRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    UIImage *background = [UIImage imageNamed:@"chat.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"chat.png"] drawInRect:self.view.bounds];
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
