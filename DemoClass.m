//
//  Arrival.m
//

#import "Arrival.h"

// Private interface of Arrival allows you to declare properties and methods only accessible to the implementation
// This is actually an Objective-C category, but that is a topic we won't have time to cover
//
//   Further reading:
//    https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/CustomizingExistingClasses/CustomizingExistingClasses.html
//
@interface Arrival ()
// Properties are declared the same as in the .h
@property (nonatomic, strong) NSNumber* internalcount; // Unused property: just for example

@end

// .m is where the method implementations exist
//      c-analogy: .c
@implementation Arrival

//
//
// Property getter/setter methods
//
//      Automatically generated to be propertyName and setPropertyName:
//          Methods are called both directly and from dot notation
//
//      Overriding these is often used to give custom behavior

// Getter method
- (NSNumber*) stopID{
    // Return the backing instance variable for the property (default: _propertyName)
    return _stopID;
}

// Setter method
- (void) setStopID:(NSNumber*) stopID{
    // Must save the passed parameter to the backing instance variable
    _stopID = stopID;
}

//
// All other properties will have their getters/setters automatically created
//

- (BOOL) isLate{
    // Uses methods of the NSDate class to determine number of seconds between the scheduled and expected property
    return [self.scheduled timeIntervalSinceDate:self.expected] > 0;
}

// instancetype is a special keyword that translates into Arrival * in this case
//
+ (instancetype) arrivalWithDictionary:(NSDictionary*) arrivalDictionary{
    // Make a new Arrival instance using the very common alloc-init pattern
    Arrival *newArrival = [[Arrival alloc] init];
    
    // Set the values of newArrival based on values in the dictionary
    //      c-analogy: dictionaries are like maps in c++
    //
    // Below shows 4 different ways to match a value from a dictionary to a property of an Arrival instance
    //
    
    [newArrival setRouteName: [arrivalDictionary objectForKey:@"Route"]]; // Using the objectForKey: method of NSDictionary
    [newArrival setStopID: arrivalDictionary[@"StopID"]]; // Using shorthand for accessing object in dictionary
    newArrival.scheduled = [arrivalDictionary objectForKey:@"Scheduled"]; // Using dot notation -- identical to above
    newArrival.expected = arrivalDictionary[@"Expected"]; // Shortest form -- same result as any above methods
    
    return newArrival;
}

@end
