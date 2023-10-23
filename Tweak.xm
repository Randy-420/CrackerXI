#import <UIKit/UIKit.h>
#include "Tweak.h"
#include <objc/runtime.h>

%hook FirstViewController

- (void)getInstalledApplist {
%orig;
    Ivar ivar = class_getInstanceVariable([self class], "newAppsList");
    NSMutableArray *myInstanceArray = object_getIvar(self, ivar);

NSArray *sortedArray = [myInstanceArray sortedArrayUsingComparator: ^(RPVApplication* obj1, RPVApplication* obj2) {

    return [[obj1 applicationName] compare:[obj2 applicationName]];
}];

//NSLog(@"Randy420: %@", myInstanceArray);

object_setIvar(self, ivar, [NSMutableArray arrayWithArray:sortedArray]);
//myInstanceArray = [NSMutableArray arrayWithArray:sortedArray];
[self.tableView reloadData];
}
%end


