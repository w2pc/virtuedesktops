/******************************************************************************
* 
* Virtue 
*
* A desktop extension for MacOS X
*
* Copyright 2004, Thomas Staller playback@users.sourceforge.net
* Copyright 2005-2006, Tony Arnold tony@tonyarnold.com
*
* See COPYING for licensing details
* 
*****************************************************************************/ 

#import "VTPrimitiveDesktopColorLabelInspector.h"
#import "VTDesktopColorLabelPrimitive.h"
#import <Zen/Zen.h> 


@implementation VTPrimitiveDesktopColorLabelInspector

- (id) init {
	if (self = [super init]) {
		[NSBundle loadNibNamed: @"PrimitiveDesktopColorLabelInspector" owner: self]; 
		// and assign main view 
		mMainView = [[mWindow contentView] retain]; 
		
		return self; 
	}
	
	return nil; 
}

- (void) dealloc {
	ZEN_RELEASE(mMainView); 
	
	[super dealloc]; 
}

- (void) awakeFromNib {
}

@end
