//
//  VNTDViewController.h
//  ViNoMania
//
//  Created by Mikhail Lomibao Basbas on 11/27/12.
//
//

#import <UIKit/UIKit.h>

@interface VNTDViewController : UIViewController
{
    IBOutlet UIImageView *PImageView;
    IBOutlet UIImageView *AImageView;
}
@property (nonatomic, retain) NSMutableArray *obstacle;
@property (nonatomic, retain) NSMutableArray *towers;
@property (nonatomic, assign) float spacingHorizontal;
@property (nonatomic, assign) float spacingVertical;
@property (nonatomic, assign) NSInteger maxPerRow;

@end
