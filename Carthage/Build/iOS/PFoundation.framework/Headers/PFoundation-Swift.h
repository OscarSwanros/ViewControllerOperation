// Generated by Apple Swift version 2.1.1 (swiftlang-700.1.101.15 clang-700.1.81)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSError;

SWIFT_CLASS("_TtC11PFoundation9Operation")
@interface Operation : NSOperation
@property (nonatomic, readonly, getter=isReady) BOOL ready;
@property (nonatomic) BOOL userInitiated;
@property (nonatomic, readonly, getter=isExecuting) BOOL executing;
@property (nonatomic, readonly, getter=isFinished) BOOL finished;
- (void)addDependency:(NSOperation * __nonnull)operation;
- (void)start;
- (void)main;
- (void)execute;
- (void)produceOperation:(NSOperation * __nonnull)operation;
- (void)finishWithError:(NSError * __nullable)error;
- (void)finish:(NSArray<NSError *> * __nonnull)errors;
- (void)waitUntilFinished;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class OperationQueue;


/// GroupOperation is a subclass of Operation that represents a group of Operations that together repesent a whole operation.
SWIFT_CLASS("_TtC11PFoundation14GroupOperation")
@interface GroupOperation : Operation
@property (nonatomic, readonly, strong) OperationQueue * __nonnull internalQueue;

/// Designated initializer that takes an array of NSOperations and adds them to an internal OperationQueue instance that is in a "suspended" state.
///
/// The <code>NSOperation
/// </code>s in the internal queue won't start executing until the
/// <code>GroupOperation
/// </code> instance is added to an instance of <code>OperationQueue
/// </code>
/// itself.
- (nonnull instancetype)initWithOperations:(NSArray<NSOperation *> * __nullable)operations OBJC_DESIGNATED_INITIALIZER;

/// Cancels all the operations on the internal queue.
- (void)cancel;
- (void)execute;
- (void)addOperation:(NSOperation * __nonnull)operation;
- (void)aggregateError:(NSError * __nonnull)error;
- (void)operationDidFinish:(NSOperation * __nonnull)operation withErrors:(NSArray<NSError *> * __nonnull)errors;
- (void)addOperations:(NSArray<NSOperation *> * __nonnull)operations;
@end


@interface GroupOperation (SWIFT_EXTENSION(PFoundation))
@end


@interface NSError (SWIFT_EXTENSION(PFoundation))
@end


@interface NSLock (SWIFT_EXTENSION(PFoundation))
@end


@interface NSOperation (SWIFT_EXTENSION(PFoundation))
- (void)addCompletionBlock:(void (^ __nonnull)(void))block;
- (void)addDependencies:(NSArray<NSOperation *> * __nonnull)dependencies;
@end


@interface NSURL (SWIFT_EXTENSION(PFoundation))
- (NSURL * __nullable)URLWithParams:(NSDictionary<NSString *, NSString *> * __nonnull)params;
@end




/// OperationQueue is a generalization of NSOperationQueue that works with instances of Operation.
///
/// To use <code>OperationQueue
/// </code> you just need to call its designated initializer.
///
/// <code>let queue = OperationQueue()
/// 
/// </code>
/// Then, you can add instances of <code>Operation
/// </code> or <code>NSOperation
/// </code> to it using the <code>addOperation(_:)
/// </code> method.
///
/// <code>let op = Operation()
/// queue.addOperation(op)
/// 
/// </code>\Attention 
/// 
///
/// <code>OperationQueue
/// </code> can also be used as a singleton.
///
/// <code>OperationQueue.sharedQueue.addOperation(op)
/// 
/// </code>
SWIFT_CLASS("_TtC11PFoundation14OperationQueue")
@interface OperationQueue : NSOperationQueue

/// Singleton object for OperationQueue. Use carefully.
+ (OperationQueue * __nonnull)sharedQueue;
- (void)addOperation:(NSOperation * __nonnull)operation;
- (void)addOperations:(NSArray<NSOperation *> * __nonnull)ops waitUntilFinished:(BOOL)wait;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
