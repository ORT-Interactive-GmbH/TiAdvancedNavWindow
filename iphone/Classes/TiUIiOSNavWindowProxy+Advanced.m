//
//  TiUIiOSNavWindowProxy+Advanced.m
//  TiAdvancedNavWindow
//
//  Created by Marcel Pociot on 15.01.15.
//
//

#import "TiUIiOSNavWindowProxy+Advanced.h"

@implementation TiUIiOSNavWindowProxy (Advanced)

/**
 * Pop to the root view controller
 */
-(void)popToRoot:(id)args
{
    TiThreadPerformOnMainThread(^{
        [navController popToRootViewControllerAnimated:[TiUtils boolValue:[(NSDictionary*)args objectForKey:@"animated"] def:YES]];
    }, YES);
}

/**
 * Pops the current visible controller from the stack
 */
-(void)pop:(id)args
{
    TiThreadPerformOnMainThread(^{
        [navController popViewControllerAnimated:[TiUtils boolValue:[(NSDictionary*)args objectForKey:@"animated"] def:YES]];
    }, YES);
}

/**
 * Returns the number of active viewcontrollers
 */
-(id)numViewControllers
{
    return NUMINT( navController.viewControllers.count );
}

/**
 * Hides the navigation bar
 */
-(void)hideNavBar:(id)args
{
    TiThreadPerformOnMainThread(^{
        [navController
         setNavigationBarHidden:YES
         animated:[TiUtils boolValue:[(NSDictionary*)args objectForKey:@"animated"] def:YES]];
    }, NO);
}


-(void)showNavBar:(id)args
{
    TiThreadPerformOnMainThread(^{
        [navController
         setNavigationBarHidden:NO
         animated:[TiUtils boolValue:[(NSDictionary*)args objectForKey:@"animated"] def:YES]];
    }, NO);
}

@end
