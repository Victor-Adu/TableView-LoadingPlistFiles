//
//  ViewController.m
//  LoadingPlistDemo
//
//  Created by Victor  Adu on 4/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController {
    NSDictionary *courseDetails;
    NSArray *justCourseNames;
    
    NSDictionary *webCourseDetails;
    NSArray *webCourseNames;
    

}

//Number of Sections to appear in TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"iOS Courses";
    } else {
        return @"Web Courses";
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //'if' 'section == 0', return 'courseDetails' in the course.plist for first section row.
    if (section == 0) {
        return courseDetails.count; //or you can use justCourseNames.countreturn justCourseNames.count;
    } else {
        return webCourseDetails.count; //'else' load 'webCourseDetails' (this pulls from the second plist file (courses_web.plist). It becomes the second row section.
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //create cell
    //UITableView *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

   
    //create cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //Retrieve an image
    UIImage *myImage = [UIImage imageNamed:@"DemoCellImage"];
    [cell.imageView setImage:myImage];
    
      //fill cell
    if (indexPath.section == 0) {//If the 'indexPath.section == 0', set and fill the cells for the first row in first array.
        cell.textLabel.text = justCourseNames[indexPath.row];
        cell.detailTextLabel.text = courseDetails[justCourseNames[indexPath.row]];//'detailTextLabel' will show authors for each course in each cell row.
    } else {
        cell.textLabel.text = webCourseNames[indexPath.row]; //'else' set the cell to whatever contents in second array.
        cell.detailTextLabel.text = webCourseDetails[webCourseNames[indexPath.row]];
    }
    
   
    
    return cell;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //The NSURL class will basically grab our courses.plist
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"courses" withExtension:@"plist"];
    
    //load the plist into the dictionary
    courseDetails = [NSDictionary dictionaryWithContentsOfURL:url];
    
    //create am array with just the keys
    justCourseNames = courseDetails.allKeys;
    
    NSURL *urlWeb = [[NSBundle mainBundle] URLForResource:@"courses_web" withExtension:@"plist"];
    webCourseDetails = [NSDictionary dictionaryWithContentsOfURL:urlWeb];
    webCourseNames = webCourseDetails.allKeys;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
