//
//  QHandler.m
//  SweetFM
//
//  Created by Q on 12.05.09.
//
//
//  Permission is hereby granted, free of charge, to any person 
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, 
//  merge, publish, distribute, sublicense, and/or sell copies of 
//  the Software, and to permit persons to whom the Software is 
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be 
//  included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
//  ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "QHandler.h"

#import "SynthesizeSingleton.h"


NSString * const QHandlerProtocolErrorNotification = @"QHandlerProtocolErrorNotification";
NSString * const QHandlerMinorProtocolErrorNotification = @"QHandlerMinorProtocolErrorNotification";

@implementation QHandler

@synthesize delegate, messageQueue, lastErrorMessage;
//@synthesize scrobbleSession, radioSession, station, playlist, track;

SYNTHESIZE_SINGLETON_FOR_CLASS(QHandler, instance);

- (id)init
{
	if(self = [super init])
	{
		srandom(time(NULL));
		
		NSOperationQueue *queue = [[NSOperationQueue alloc] init];
		[queue setMaxConcurrentOperationCount:1];
		self.messageQueue = queue;
		[queue release];
	}
	
	return self;
}

+ (NSOperationQueue *)messages
{
	return [QHandler	instance].messageQueue;
}

+ (long)randomLong
{
	return random();
}

- (NSString *)lastErrorMessage
{
	NSString *msg = [lastErrorMessage copy];
	self.lastErrorMessage = nil;
	
	return [msg autorelease];
}

@end
