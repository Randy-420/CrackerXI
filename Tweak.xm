#include "Tweak.h"

%hook FirstViewController
- (void)getInstalledApplist {
	%orig;
	Ivar ivar = class_getInstanceVariable([self class], "newAppsList");

	NSMutableArray *myInstanceArray = object_getIvar(self, ivar);

	NSArray *sortedArray = [myInstanceArray sortedArrayUsingComparator: ^(RPVApplication* obj1, RPVApplication* obj2) {

		return [[obj1 applicationName] compare:[obj2 applicationName]];
	}];

	object_setIvar(self, ivar, [NSMutableArray arrayWithArray:sortedArray]);

	[self.tableView reloadData];
}
%end