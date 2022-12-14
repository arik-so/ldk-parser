
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Error for PeerManager errors. If you get one of these, you must disconnect the socket and
			/// generate no further read_event/write_buffer_space_avail/socket_disconnected calls for the
			/// descriptor.
			public typealias PeerHandleError = Bindings.PeerHandleError

			extension Bindings {
		

				/// Error for PeerManager errors. If you get one of these, you must disconnect the socket and
				/// generate no further read_event/write_buffer_space_avail/socket_disconnected calls for the
				/// descriptor.
				public class PeerHandleError: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPeerHandleError?

					internal init(cType: LDKPeerHandleError) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKPeerHandleError, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PeerHandleError, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PeerHandleError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Used to indicate that we probably can't make any future connections to this peer (e.g.
					/// because we required features that our peer was missing, or vice versa).
					/// 
					/// While LDK's [`ChannelManager`] will not do it automatically, you likely wish to force-close
					/// any channels with this peer or check for new versions of LDK.
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					public func getNoConnectionPossible() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPeerHandleError>) in
				PeerHandleError_get_no_connection_possible(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Used to indicate that we probably can't make any future connections to this peer (e.g.
					/// because we required features that our peer was missing, or vice versa).
					/// 
					/// While LDK's [`ChannelManager`] will not do it automatically, you likely wish to force-close
					/// any channels with this peer or check for new versions of LDK.
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					public func setNoConnectionPossible(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPeerHandleError>) in
				PeerHandleError_set_no_connection_possible(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new PeerHandleError given each field
					public init(noConnectionPossibleArg: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PeerHandleError_new(noConnectionPossibleArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = PeerHandleError(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the PeerHandleError
					internal func clone() -> PeerHandleError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPeerHandleError>) in
				PeerHandleError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PeerHandleError(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> PeerHandleError {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PeerHandleError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> PeerHandleError {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> PeerHandleError {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> PeerHandleError {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing PeerHandleError \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing PeerHandleError \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		