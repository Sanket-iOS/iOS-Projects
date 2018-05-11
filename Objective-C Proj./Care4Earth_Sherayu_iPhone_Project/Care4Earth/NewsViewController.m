//
//  NewsViewController.m
//  Care4Earth
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "NewsViewController.h"
#import "RSSDetailViewController.h"
@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize tblview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    feeds = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.allinahealth.org/ahs/news.nsf/rssfeed"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return feeds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" ];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey: @"title"];
    cell.textLabel.textColor=[UIColor whiteColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexPath = [self.tblview indexPathForSelectedRow];
    NSString *string = [feeds[indexPath.row] objectForKey: @"link"];
    RSSDetailViewController *rss=[[RSSDetailViewController alloc]init];
    rss.url=string;
    [self.navigationController pushViewController:rss animated:YES];
    
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        
        [feeds addObject:[item copy]];
        
    }
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.tblview reloadData];
}
- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
