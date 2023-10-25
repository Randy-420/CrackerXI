#include "Tweak.h"

%hook FirstViewController
- (void)getInstalledApplist {
	%orig;
	Ivar ivar = class_getInstanceVariable([self class], "newAppsList");

	NSMutableArray *myInstanceArray = object_getIvar(self, ivar);
NSLog(@"Randy420: %@", myInstanceArray);
	myInstanceArray = [[myInstanceArray sortedArrayUsingComparator: ^(RPVApplication* obj1, RPVApplication* obj2) {

		return [[obj1 applicationName] compare:[obj2 applicationName]];
	}] mutableCopy];

	object_setIvar(self, ivar, myInstanceArray);

	[self.tableView reloadData];
}
%end