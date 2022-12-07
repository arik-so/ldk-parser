
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias NetAddress = Bindings.NetAddress

			extension Bindings {

				/// An address which can be used to connect to a remote peer
				public class NetAddress: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNetAddress?

					public init(cType: LDKNetAddress) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKNetAddress, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum NetAddressType {
						
						/// An IPv4 address/port on which the peer is listening.
						case IPv4
			
						/// An IPv6 address/port on which the peer is listening.
						case IPv6
			
						/// An old-style Tor onion address/port on which the peer is listening.
						/// 
						/// This field is deprecated and the Tor network generally no longer supports V2 Onion
						/// addresses. Thus, the details are not parsed here.
						case OnionV2
			
						/// A new-style Tor onion address/port on which the peer is listening.
						/// To create the human-readable \"hostname\", concatenate ed25519_pubkey, checksum, and version,
						/// wrap as base32 and append \".onion\".
						case OnionV3
			
						/// A hostname/port on which the peer is listening.
						case Hostname
			
					}

					public func getValueType() -> NetAddressType? {
						switch self.cType!.tag {
							case LDKNetAddress_IPv4:
								return .IPv4
			
							case LDKNetAddress_IPv6:
								return .IPv6
			
							case LDKNetAddress_OnionV2:
								return .OnionV2
			
							case LDKNetAddress_OnionV3:
								return .OnionV3
			
							case LDKNetAddress_Hostname:
								return .Hostname
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the NetAddress
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NetAddress_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the NetAddress
					internal func clone() -> NetAddress {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNetAddress>) in
			NetAddress_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NetAddress(cType: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new IPv4-variant NetAddress
					public init(addr: [UInt8], port: UInt16) {
						// native call variable prep
						
						let addrPrimitiveWrapper = FourBytes(value: addr)
				

						// native method call
						let nativeCallResult = NetAddress_ipv4(addrPrimitiveWrapper.cType!, port)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NetAddress(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new IPv6-variant NetAddress
					public init(addr: [UInt8], port: UInt16) {
						// native call variable prep
						
						let addrPrimitiveWrapper = SixteenBytes(value: addr)
				

						// native method call
						let nativeCallResult = NetAddress_ipv6(addrPrimitiveWrapper.cType!, port)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NetAddress(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new OnionV2-variant NetAddress
					public init(a: [UInt8]) {
						// native call variable prep
						
						let aPrimitiveWrapper = TwelveBytes(value: a)
				

						// native method call
						let nativeCallResult = NetAddress_onion_v2(aPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NetAddress(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new OnionV3-variant NetAddress
					public init(ed25519Pubkey: [UInt8], checksum: UInt16, version: UInt8, port: UInt16) {
						// native call variable prep
						
						let ed25519PubkeyPrimitiveWrapper = ThirtyTwoBytes(value: ed25519Pubkey)
				

						// native method call
						let nativeCallResult = NetAddress_onion_v3(ed25519PubkeyPrimitiveWrapper.cType!, checksum, version, port)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NetAddress(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new Hostname-variant NetAddress
					public init(hostname: Hostname, port: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NetAddress_hostname(hostname.cType!, port)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NetAddress(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Checks if two NetAddresss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKNetAddress>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKNetAddress>) in
			NetAddress_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the NetAddress object into a byte array which can be read by NetAddress_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNetAddress>) in
			NetAddress_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a NetAddress from a byte array, created by NetAddress_write
					public class func read(ser: [UInt8]) -> Result_NetAddressDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = NetAddress_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NetAddressDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					
					public func getValueAsIPv4() -> IPv4? {
						if self.cType?.tag != LDKNetAddress_IPv4 {
							return nil
						}

						return NetAddress_LDKIPv4_Body(cType: self.cType!.i_pv4)
					}
			
					public func getValueAsIPv6() -> IPv6? {
						if self.cType?.tag != LDKNetAddress_IPv6 {
							return nil
						}

						return NetAddress_LDKIPv6_Body(cType: self.cType!.i_pv6)
					}
			
					public func getValueAsOnionV2() -> [UInt8]? {
						if self.cType?.tag != LDKNetAddress_OnionV2 {
							return nil
						}

						return TwelveBytes(cType: self.cType!.onion_v2)
					}
			
					public func getValueAsOnionV3() -> OnionV3? {
						if self.cType?.tag != LDKNetAddress_OnionV3 {
							return nil
						}

						return NetAddress_LDKOnionV3_Body(cType: self.cType!.onion_v3)
					}
			
					public func getValueAsHostname() -> Hostname? {
						if self.cType?.tag != LDKNetAddress_Hostname {
							return nil
						}

						return NetAddress_LDKHostname_Body(cType: self.cType!.hostname)
					}
			

					internal func dangle() -> NetAddress {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> NetAddress {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing NetAddress \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NetAddress \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					

					/// 
					public class IPv4: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKNetAddress_LDKIPv4_Body?

						fileprivate init(cType: LDKNetAddress_LDKIPv4_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKNetAddress_LDKIPv4_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The 4-byte IPv4 address
						public func getAddr() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = FourBytes(cType: self.cType!.addr)

							return returnValue;
						}
		
						/// The port on which the node is listening
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

						internal func dangle() -> IPv4 {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class IPv6: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKNetAddress_LDKIPv6_Body?

						fileprivate init(cType: LDKNetAddress_LDKIPv6_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKNetAddress_LDKIPv6_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The 16-byte IPv6 address
						public func getAddr() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = SixteenBytes(cType: self.cType!.addr)

							return returnValue;
						}
		
						/// The port on which the node is listening
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

						internal func dangle() -> IPv6 {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class OnionV3: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKNetAddress_LDKOnionV3_Body?

						fileprivate init(cType: LDKNetAddress_LDKOnionV3_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKNetAddress_LDKOnionV3_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The ed25519 long-term public key of the peer
						public func getEd25519Pubkey() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.ed25519_pubkey)

							return returnValue;
						}
		
						/// The checksum of the pubkey and version, as included in the onion address
						public func getChecksum() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.checksum

							return returnValue;
						}
		
						/// The version byte, as defined by the Tor Onion v3 spec.
						public func getVersion() -> UInt8 {
							// return value (do some wrapping)
							let returnValue = self.cType!.version

							return returnValue;
						}
		
						/// The port on which the node is listening
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

						internal func dangle() -> OnionV3 {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class Hostname: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKNetAddress_LDKHostname_Body?

						fileprivate init(cType: LDKNetAddress_LDKHostname_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKNetAddress_LDKHostname_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The hostname on which the node is listening.
						public func getHostname() -> Hostname {
							// return value (do some wrapping)
							let returnValue = Hostname(cType: self.cType!.hostname)

							return returnValue;
						}
		
						/// The port on which the node is listening.
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

						internal func dangle() -> Hostname {
							self.dangling = true
							return self
						}

											

					}

					
		

				}

			}
		