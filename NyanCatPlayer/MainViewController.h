//
//  MainViewController.h
//  NyanCatPlayer
//
//  Created by Natalie Podrazik on 11/18/11.
//  Copyright (c) 2011 Auburn & Ivory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface MainViewController : UIViewController {
    MPMoviePlayerViewController * moviePlayer;
}

-(id)init;
-(void)showVideoPlayer;


@property(nonatomic, strong) MPMoviePlayerViewController * moviePlayer;

@end
