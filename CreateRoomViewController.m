//
//  CreateRoomViewController.m
//  Music
//
//  Created by Final on 3/7/15.
//  Copyright (c) 2015 Asheer Tanveer. All rights reserved.
//

#import "CreateRoomViewController.h"

@interface CreateRoomViewController ()

@end

@implementation CreateRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    UIImage *background = [UIImage imageNamed:@"roomCreate.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"roomCreate.png"] drawInRect:self.view.bounds];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    /*
    if(tableView ==
       
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Fajr";
                cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.fajrTime];
                break;
            case 1:
                cell.textLabel.text = @"Sunrise";
                cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.sunriseTime];
                break;
            case 2:
                cell.textLabel.text = @"Dhuhr";
                cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.dhuhrTime];
                break;
            case 3:
                cell.textLabel.text = @"Asr";
                cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.asrTime];
                break;
            case 4:
                cell.textLabel.text = @"Maghrib";
                cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.maghribTime];
                break;
            case 5:
                cell.textLabel.text = @"Isha";
                cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.ishaTime];
                break;
            case 6:
                cell.textLabel.text = @"Fajr Tomorrow";
                cell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.prayerTimes.tomorrowFajrTime];
                break;
        }
    }
     */
    return cell;
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
