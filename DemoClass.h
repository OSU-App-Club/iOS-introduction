//
//  Arrival.h

// .h file: header file (same as in c)
//
//  Header files are where you put public details (interface) for your class [methods, properties, supported protocols]


// #import is used to incorperate other libraries
//  C-analogy: #include
//
// The foundation library is the root library of Objective-C
//      contains key objects like: NSObject, NSArray, NSDate, NSDictionary, NSNumber, NSSet, NSString, etc.
//
#import <Foundation/Foundation.h>

//
// This declares a new class, Arrival, that is a subclass of NSObject and conforms the NSObject protocol
//      Arrival thus inherits all properties and methods from NSObject by default
//      Arrival also states that it conforms to the NSObject protocol
//          * Redundent to inherit and conform to NSObject -- just for example
//          * Protocols are used heavily in classes such as UICollectionView
//
//  Information between @interface and @end represent the public declaration of the Arrival class
//
@interface Arrival : NSObject <NSObject>

//
// Properties
//

// Declaring a property of the Arrival class (Example: age would be a property of a Person class)
//      Property attributes:
//          nonatomic: property is not thread safe; the counter (atomic) adds unneeded complexity with a mutex
//          strong: memory for this object will be preserved for the entirety of the Arrival Object (increase reference count) [almost always use string]
//
//      Property type: NSNumber pointer
//          all properties will be pointers as they are always stored on the heap in objective-c
//
//      Property name: stopID
//          This property can be get/set in two ways
//              method: [arrivalInstance stopID] and [arrivalInstance setStopID:exampleStopID]
//              dot notation: arrivalInstance.stopID and arrivalInstance.stopID = exampleStopID

@property (nonatomic, strong) NSNumber  *stopID;


// Additional properties in the same form as above
@property (nonatomic, strong) NSString  *routeName;
@property (nonatomic, strong) NSDate    *scheduled;
@property (nonatomic, strong) NSDate    *expected;

//
// Methods
//

// Instance methods start with the - symbol [methods are almost always instance methods]
//      Method name: isLate
//      Return type: BOOL (true/false)
//
//  Example: BOOL returnValue = [arrivalInstance isLate]

- (BOOL) isLate;

// Class methods start with the + symbol
//      Method name: arrivalWithDictionary:
//      Return type: Arrival *
//
//  Example: Arrival *newArrival = [Arrival arrivalWithDictionary:exampleDict]

+ (instancetype) arrivalWithDictionary:(NSDictionary*) arrivalDictionary;

@end
