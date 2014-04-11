//
//  AccountEditViewController.m
//  TiCheck
//
//  Created by 黄泽彪 on 14-4-9.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "AccountEditViewController.h"
#import "AccountEditDetailViewController.h"
@interface AccountEditViewController ()

@end

@implementation AccountEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"账号信息";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button event

- (IBAction)LogoutButtonEvent:(id)sender
{
    NSLog(@"log out");
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //
    [self setExtraCellLineHidden:tableView];
    [tableView setScrollEnabled:NO];
    //
    return 1;
}

//delete useless lines
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    //[view release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AccountInfoCell";
    
    //初始化cell并指定其类型，也可自定义cell
    
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil)
    {
        //当没有可复用的空闲的cell资源时(第一次载入,没翻页)
        cell=[[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //UITableViewCellStyleDefault 只能显示一张图片，一个字符串，即本例样式
        //UITableViewCellStyleSubtitle 可以显示一张图片，两个字符串，上面黑色，下面的灰色
        //UITableViewCellStyleValue1 可以显示一张图片，两个字符串，左边的黑色，右边的灰色
        //UITableViewCellStyleValue2 可以显示两个字符串，左边的灰色，右边的黑色
        
    }
    
    NSString* cellTitle=@"tt";
    NSString* cellContent=@"tt";
    
    if(indexPath.row==0)
    {
        cellTitle=@"用户名";
        cellContent=@"某某";
    }
    else if(indexPath.row==1)
    {
        cellTitle=@"邮箱";
        cellContent=@"TiCheck@gmail.com";
    }
    else if(indexPath.row==2)
    {
        cellTitle=@"密码";
        cellContent=@"******";
    }
    
    //cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text=cellTitle;
    //cell.textLabel.textColor=[[UIColor alloc] initWithRed:33/255 green:44/255 blue:11/255 alpha:1];
    //cell.textLabel.textAlignment=NSTextAlignmentLeft;
    cell.detailTextLabel.text=cellContent;
    
    //cell.detailTextLabel.textAlignment=NSTextAlignmentRight;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editDetail"]) {
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AccountEditDetailViewController* tempController= [segue destinationViewController];
        [tempController setEditDetailType:indexPath.row];
        if(indexPath.row==0)
        {
            NSLog(@"change name");
            tempController.navigationItem.title=@"修改用户名";
            
            
        }
        else if(indexPath.row==1)
        {
            //e-mail
        }
        else if(indexPath.row==2)
        {
            tempController.navigationItem.title=@"修改密码";
        }
    }
}
@end
