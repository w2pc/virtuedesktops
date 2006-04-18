/******************************************************************************
* 
* Virtue 
*
* A desktop extension for MacOS X
*
* Copyright 2004, Thomas Staller 
* playback@users.sourceforge.net
*
* See COPYING for licensing details
* 
*****************************************************************************/ 

#import "VTDecorationPrimitiveTextInspector.h"
#import <Virtue/VTDecorationPrimitiveText.h>
#import <Zen/Zen.h> 

@implementation VTDecorationPrimitiveTextInspector

- (id) init {
	if (self = [super init]) {
		[NSBundle loadNibNamed: @"PrimitiveTextInspector" owner: self]; 
		// and assign main view 
		mMainView = [[mWindow contentView] retain];
		mPreviousResponder = nil; 
		
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

- (IBAction) showFontPanel: (id) sender {
	if ([[[NSFontManager sharedFontManager] fontPanel: YES] isVisible]) 
		return; 
	
	// set the selected font 
	[[NSFontManager sharedFontManager] setSelectedFont: [(VTDecorationPrimitiveText*)mInspectedObject font] isMultiple: NO]; 
	[[NSFontManager sharedFontManager] setDelegate: self]; 
	
	mPreviousResponder = [[[mMainView window] firstResponder] retain]; 
	[[mMainView window] makeFirstResponder: self]; 
	
	// and show the panel 
	[[NSFontManager sharedFontManager] orderFrontFontPanel: sender]; 
}

- (void) changeFont: (id) sender {
	NSFont* oldFont = [(VTDecorationPrimitiveText*)mInspectedObject font]; 
	NSFont* newFont = [sender convertFont: oldFont]; 
	
	// and set it in our object 
	[(VTDecorationPrimitiveText*)mInspectedObject setFont: newFont]; 
}

- (void) windowWillClose: (NSNotification*) aNotification {
	// reset the first responder 
	[[mMainView window] makeFirstResponder: mPreviousResponder]; 
	ZEN_RELEASE(mPreviousResponder); 
}

@end