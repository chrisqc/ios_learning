//
//  MJViewController.m
//  03-LOL英雄
//
//  Created by MJ Lee on 14-3-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJHero.h"
#import "MJExtension.h"

@interface MJViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *heros;
@end

@implementation MJViewController
- (NSArray *)heros
{
    if (_heros == nil) {
        _heros = [MJHero modelArrayWithFilename:@"heros.plist"];
    }
    return _heros;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    MJHero *hero = self.heros[indexPath.row];
    
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end
