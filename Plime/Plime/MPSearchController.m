//
//  MPSearchController.m
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import "MPSearchController.h"
#import "UISearchBar+MAdd.h"
@interface MPSearchController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *customSearchBar;
- (IBAction)back:(id)sender;

@end


@implementation MPSearchController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSearchBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupSearchBar
{
    self.customSearchBar.delegate = self;
    self.customSearchBar.placeholder = @"Search to you want ";
    NSLog(@"设置了 customSearchBar 取消按钮文字");
    //1. 设置背景颜色
    //设置背景图是为了去掉上下黑线
    self.customSearchBar.backgroundImage = [[UIImage alloc] init];
    // 设置SearchBar的颜色主题为白色
    self.customSearchBar.barTintColor = [UIColor whiteColor];
    
    //2. 设置圆角和边框颜色
    UITextField *searchField = [self.customSearchBar valueForKey:@"searchField"];
    if (searchField)
    {
        [searchField setBackgroundColor:[UIColor whiteColor]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
    }
    
    //3. 设置按钮文字和颜色
    [self.customSearchBar m_setCancelButtonTitle:@"Cancel"];
    
    self.customSearchBar.tintColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1];
    
    //设置取消按钮字体
    [self.customSearchBar m_setCancelButtonFont:[UIFont systemFontOfSize:14]];

    //修正光标颜色
    [searchField setTintColor:[UIColor blackColor]];
    
    //4. 设置输入框文字颜色和字体
    [self.customSearchBar m_setTextColor:[UIColor blackColor]];
    [self.customSearchBar m_setTextFont:[UIFont systemFontOfSize:14]];
    
    //5. 设置搜索Icon
    [self.customSearchBar setImage:[UIImage imageNamed:@"Search_Icon"]
                  forSearchBarIcon:UISearchBarIconSearch
                             state:UIControlStateNormal];

}

#pragma mark .....:::::: UISearchBarDelegate ::::::.....

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar endEditing:YES];
}


//监控文本变化
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    self.voiceButton.hidden = searchText.length > 0;
}

- (IBAction)back:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
