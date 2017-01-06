/********* AmILate.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface AmILate : CDVPlugin {
  // Member variables go here.
}

- (void)getNextAppointment:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    int minutes = [[command.arguments objectAtIndex:0] intValue];

    if (minutes > 0) {
        /**
            Code to retrieve name, time of next appointment goes here
        **/
        if (foundAppointment) {
            NSMutableDictionary *appointment = [NSMutableDictionary dictionaryWithCapacity:2];
            [appointment setObject:appointmentName forKey:@"title"];
            [appointment setObject:appointmentDate forKey:@"date"];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:appointment];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
        }
    } else {
        // Indicate an error result
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
