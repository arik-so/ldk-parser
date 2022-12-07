
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias APIError = Bindings.APIError

			extension Bindings {

				/// Indicates an error on the client's part (usually some variant of attempting to use too-low or
				/// too-high values)
				public class APIError: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKAPIError?

					public init(pointer: LDKAPIError) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKAPIError, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum APIErrorType {
						
						/// Indicates the API was wholly misused (see err for more). Cases where these can be returned
						/// are documented, but generally indicates some precondition of a function was violated.
						case APIMisuseError
			
						/// Due to a high feerate, we were unable to complete the request.
						/// For example, this may be returned if the feerate implies we cannot open a channel at the
						/// requested value, but opening a larger channel would succeed.
						case FeeRateTooHigh
			
						/// A malformed Route was provided (eg overflowed value, node id mismatch, overly-looped route,
						/// too-many-hops, etc).
						case RouteError
			
						/// We were unable to complete the request as the Channel required to do so is unable to
						/// complete the request (or was not found). This can take many forms, including disconnected
						/// peer, channel at capacity, channel shutting down, etc.
						case ChannelUnavailable
			
						/// An attempt to call [`chain::Watch::watch_channel`]/[`chain::Watch::update_channel`]
						/// returned a [`ChannelMonitorUpdateStatus::InProgress`] indicating the persistence of a
						/// monitor update is awaiting async resolution. Once it resolves the attempted action should
						/// complete automatically.
						/// 
						/// [`chain::Watch::watch_channel`]: crate::chain::Watch::watch_channel
						/// [`chain::Watch::update_channel`]: crate::chain::Watch::update_channel
						/// [`ChannelMonitorUpdateStatus::InProgress`]: crate::chain::ChannelMonitorUpdateStatus::InProgress
						case MonitorUpdateInProgress
			
						/// [`KeysInterface::get_shutdown_scriptpubkey`] returned a shutdown scriptpubkey incompatible
						/// with the channel counterparty as negotiated in [`InitFeatures`].
						/// 
						/// Using a SegWit v0 script should resolve this issue. If you cannot, you won't be able to open
						/// a channel or cooperatively close one with this peer (and will have to force-close instead).
						/// 
						/// [`KeysInterface::get_shutdown_scriptpubkey`]: crate::chain::keysinterface::KeysInterface::get_shutdown_scriptpubkey
						/// [`InitFeatures`]: crate::ln::features::InitFeatures
						case IncompatibleShutdownScript
			
					}

					public func getValueType() -> APIErrorType? {
						switch self.cType!.tag {
							case LDKAPIError_APIMisuseError:
								return .APIMisuseError
			
							case LDKAPIError_FeeRateTooHigh:
								return .FeeRateTooHigh
			
							case LDKAPIError_RouteError:
								return .RouteError
			
							case LDKAPIError_ChannelUnavailable:
								return .ChannelUnavailable
			
							case LDKAPIError_MonitorUpdateInProgress:
								return .MonitorUpdateInProgress
			
							case LDKAPIError_IncompatibleShutdownScript:
								return .IncompatibleShutdownScript
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the APIError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the APIError
					internal func clone() -> APIError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAPIError>) in
			APIError_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = APIError(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new APIMisuseError-variant APIError
					public init(err: String) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_apimisuse_error(err.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = APIError(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new FeeRateTooHigh-variant APIError
					public init(err: String, feerate: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_fee_rate_too_high(err.cType!, feerate)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = APIError(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new RouteError-variant APIError
					public init(err: String) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_route_error(err.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = APIError(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new ChannelUnavailable-variant APIError
					public init(err: String) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_channel_unavailable(err.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = APIError(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new MonitorUpdateInProgress-variant APIError
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_monitor_update_in_progress()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = APIError(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new IncompatibleShutdownScript-variant APIError
					public init(script: ShutdownScript) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_incompatible_shutdown_script(script.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = APIError(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Checks if two APIErrors contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKAPIError>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKAPIError>) in
			APIError_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					
					public func getValueAsApiMisuseError() -> APIMisuseError? {
						if self.cType?.tag != LDKAPIError_ApiMisuseError {
							return nil
						}

						return APIError_LDKAPIMisuseError_Body(pointer: self.cType!.api_misuse_error)
					}
			
					public func getValueAsFeeRateTooHigh() -> FeeRateTooHigh? {
						if self.cType?.tag != LDKAPIError_FeeRateTooHigh {
							return nil
						}

						return APIError_LDKFeeRateTooHigh_Body(pointer: self.cType!.fee_rate_too_high)
					}
			
					public func getValueAsRouteError() -> RouteError? {
						if self.cType?.tag != LDKAPIError_RouteError {
							return nil
						}

						return APIError_LDKRouteError_Body(pointer: self.cType!.route_error)
					}
			
					public func getValueAsChannelUnavailable() -> ChannelUnavailable? {
						if self.cType?.tag != LDKAPIError_ChannelUnavailable {
							return nil
						}

						return APIError_LDKChannelUnavailable_Body(pointer: self.cType!.channel_unavailable)
					}
			
					public func getValueAsIncompatibleShutdownScript() -> IncompatibleShutdownScript? {
						if self.cType?.tag != LDKAPIError_IncompatibleShutdownScript {
							return nil
						}

						return APIError_LDKIncompatibleShutdownScript_Body(pointer: self.cType!.incompatible_shutdown_script)
					}
			

					internal func dangle() -> APIError {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> APIError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing APIError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing APIError \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					

					/// 
					public class APIMisuseError: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKAPIMisuseError_Body?

						fileprivate init(pointer: LDKAPIError_LDKAPIMisuseError_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKAPIError_LDKAPIMisuseError_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(pointer: self.cType!.err)

							return returnValue;
						}
		

						internal func dangle() -> APIMisuseError {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class FeeRateTooHigh: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKFeeRateTooHigh_Body?

						fileprivate init(pointer: LDKAPIError_LDKFeeRateTooHigh_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKAPIError_LDKFeeRateTooHigh_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(pointer: self.cType!.err)

							return returnValue;
						}
		
						/// The feerate which was too high.
						public func getFeerate() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.feerate

							return returnValue;
						}
		

						internal func dangle() -> FeeRateTooHigh {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class RouteError: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKRouteError_Body?

						fileprivate init(pointer: LDKAPIError_LDKRouteError_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKAPIError_LDKRouteError_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(pointer: self.cType!.err)

							return returnValue;
						}
		

						internal func dangle() -> RouteError {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class ChannelUnavailable: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKChannelUnavailable_Body?

						fileprivate init(pointer: LDKAPIError_LDKChannelUnavailable_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKAPIError_LDKChannelUnavailable_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(pointer: self.cType!.err)

							return returnValue;
						}
		

						internal func dangle() -> ChannelUnavailable {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class IncompatibleShutdownScript: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKIncompatibleShutdownScript_Body?

						fileprivate init(pointer: LDKAPIError_LDKIncompatibleShutdownScript_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKAPIError_LDKIncompatibleShutdownScript_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The incompatible shutdown script.
						public func getScript() -> ShutdownScript {
							// return value (do some wrapping)
							let returnValue = ShutdownScript(pointer: self.cType!.script)

							return returnValue;
						}
		

						internal func dangle() -> IncompatibleShutdownScript {
							self.dangling = true
							return self
						}

											

					}

					
		

				}

			}
		