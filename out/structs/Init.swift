
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Init = Bindings.Init

			extension Bindings {
		

				/// An init message to be sent or received from a peer
				public class Init: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInit?

					public init(cType: LDKInit) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKInit, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Init, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Init_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The relevant features which the sender supports
					public func getFeatures() -> InitFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInit>) in
				Init_get_features(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = InitFeatures(cType: nativeCallResult)

						return returnValue
					}
		
					/// The relevant features which the sender supports
					public func setFeatures(val: InitFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKInit>) in
				Init_set_features(thisPtrPointer, val.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The receipient's network address. This adds the option to report a remote IP address
					/// back to a connecting peer using the init message. A node can decide to use that information
					/// to discover a potential update to its public IPv4 address (NAT) and use
					/// that for a node_announcement update message containing the new address.
					public func getRemoteNetworkAddress() -> NetAddress? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInit>) in
				Init_get_remote_network_address(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Option_NetAddressZ(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The receipient's network address. This adds the option to report a remote IP address
					/// back to a connecting peer using the init message. A node can decide to use that information
					/// to discover a potential update to its public IPv4 address (NAT) and use
					/// that for a node_announcement update message containing the new address.
					public func setRemoteNetworkAddress(val: NetAddress?) {
						// native call variable prep
						
						let valOption = Option_NetAddressZ(some: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKInit>) in
				Init_set_remote_network_address(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new Init given each field
					public init(featuresArg: InitFeatures, remoteNetworkAddressArg: NetAddress?) {
						// native call variable prep
						
						let remoteNetworkAddressArgOption = Option_NetAddressZ(some: remoteNetworkAddressArg)
				

						// native method call
						let nativeCallResult = Init_new(featuresArg.cType!, remoteNetworkAddressArgOption.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Init(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the Init
					internal func clone() -> Init {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInit>) in
				Init_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Init(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two Inits contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKInit>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKInit>) in
				Init_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the Init object into a byte array which can be read by Init_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInit>) in
				Init_write(objPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a Init from a byte array, created by Init_write
					public class func read(ser: [UInt8]) -> Result_InitDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = Init_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_InitDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> Init {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Init {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Init \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Init \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		