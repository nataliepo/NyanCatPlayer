//
//  MainViewController.m
//  NyanCatPlayer
//
//  Created by Natalie Podrazik on 11/18/11.
//  Copyright (c) 2011 Auburn & Ivory. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

@synthesize  moviePlayer;

-(id)init {
    
    self = [super init];
    
    if (self) {
        
        moviePlayer = nil;
        
        [self.view setFrame:CGRectMake(0, 0, 768, 1024)];
        [self.view setBackgroundColor:[UIColor grayColor]]; 
        
        
        [self showVideoPlayer];

        
        
        UITextView * title = [[UITextView alloc] initWithFrame:CGRectMake(200, 50, 150, 25)];
        title.text = @"Nyan Cat Player";
        title.textColor = [UIColor blackColor];
        [title setBackgroundColor:[UIColor yellowColor]];
        [self.view addSubview:title];
        
        
        [title release];
        
    }
    
    return self;
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)showVideoPlayer {
    // add a webview player.
    
    /*
     UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 300, 768, 500)];
    [webView setBackgroundColor:[UIColor purpleColor]];
     
    [self.view addSubview:webView];
    
    [webView release];  
     */
    
    
    
    /*** SECOND ATTEMPT - From MoviePlayer sample code.
     ****
    NSURL * nyanURL = [NSURL URLWithString:@"http://www.youtube.com/watch?v=QH2-TGUlwu4"];
    
    // Create a new movie player object.
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:nyanURL];
    
    if (player) 
    {
        // Save the movie object.
        //[self setMoviePlayerController:player];
        
        // Register the current object as an observer for the movie notifications. 
        //[self installMovieNotificationObservers];
        
        // Specify the URL that points to the movie file. 
        [player setContentURL:nyanURL];        
        
        // If you specify the movie type before playing the movie it can result in faster load times. 
        //[player setMovieSourceType:sourceType];
        [player setMovieSourceType:MPMovieSourceTypeStreaming];
        
        // Apply the user movie preference settings to the movie player object. 
        //[self applyUserSettingsToMoviePlayer];
        player.scalingMode = MPMovieScalingModeAspectFit;    //[MoviePlayerUserPrefs scalingModeUserSetting];
        player.controlStyle = MPMovieControlStyleEmbedded; //[MoviePlayerUserPrefs controlStyleUserSetting];    
        player.backgroundView.backgroundColor = [UIColor cyanColor]; //[MoviePlayerUserPrefs backgroundColorUserSetting];
        player.repeatMode = MPMovieRepeatModeNone; //[MoviePlayerUserPrefs repeatModeUserSetting];
        player.useApplicationAudioSession = YES;   // [MoviePlayerUserPrefs audioSessionUserSetting];
    
        
        // Indicate the movie player allows AirPlay movie playback. 
        player.allowsAirPlay = YES;  
        
        
        // Add a background view as a subview to hide our other view controls underneath during movie playback. 
        //[self.view addSubview:self.backgroundView];
        
        CGRect viewInsetRect = CGRectInset ([self.view bounds],
                                            768, 500 );
        // Inset the movie frame in the parent view frame. 
        [[player view] setFrame:viewInsetRect];
        
        [player view].backgroundColor = [UIColor lightGrayColor];
        
        // To present a movie in your application, incorporate the view contained 
        //     in a movie player’s view property into your application’s view hierarchy. 
        // Be sure to size the frame correctly. 
        [self.view addSubview: [player view]];  
     
    }    
     
     */
    
        
  //      NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] 
  //                                           pathForResource:@"MOVIENAME" ofType:@"MOV"]];

    
    
    /// -- this works for playing full-screen local videos.
    
    /*
    UIView * videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
    
    //NSURL * nyanURL = [NSURL URLWithString:@"http://www.youtube.com/watch?v=QH2-TGUlwu4"];

    NSString * videoPath = [NSString stringWithFormat:@"%@/%@", 
                            [[NSBundle mainBundle] resourcePath], @"65174361.mov"];
    NSURL * nyanURL = [NSURL fileURLWithPath:videoPath];
    
    
    moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:nyanURL];

    [moviePlayer.moviePlayer pause];
    
    moviePlayer.moviePlayer.allowsAirPlay = YES;
    moviePlayer.moviePlayer.shouldAutoplay = NO;
    moviePlayer.moviePlayer.contentURL = nyanURL;
    
    
    [videoView addSubview:moviePlayer.view];
    
    [self.view addSubview:videoView];
    
    [videoView release];
     
     */
    
 //   UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
    UIWebView * webView = [[[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
    
    //NSString * nyanURL = @"http://www.youtube.com/watch?v=QH2-TGUlwu4";
    NSString * nyanURL = @"http://www.youtube.com/embed/QH2-TGUlwu4";

    NSString *youTubeVideoHTML = @"<html><head><body>\
    <iframe width=\"420\" height=\"315\" src=\"%@\" frameborder=\"0\" allowfullscreen></iframe>\
   </body></html>";
    
    NSString *html = [NSString stringWithFormat:youTubeVideoHTML, nyanURL, 768, 300];

    
    
    /*
     NSURL *url = [NSURL URLWithString:@"http://www.youtube.com/watch?v=QH2-TGUlwu4"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    */
    
    NSLog(@"Full HTML string = %@\n", html);
    
    [webView loadHTMLString:html baseURL:nil];
    
    [self.view addSubview:webView];
    
    
   
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)dealloc {
    [moviePlayer release];
    
    [super dealloc];
}

@end
