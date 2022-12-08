
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An address which can be used to connect to a remote peer
			public typealias NetAddress_Tag = Bindings.NetAddress_Tag

			extension Bindings {

				/// An address which can be used to connect to a remote peer
				public enum NetAddress_Tag {

					
					/// An IPv4 address/port on which the peer is listening.
					case LDKNetAddress_IPv4
			
					/// An IPv6 address/port on which the peer is listening.
					case LDKNetAddress_IPv6
			
					/// An old-style Tor onion address/port on which the peer is listening.
					/// 
					/// This field is deprecated and the Tor network generally no longer supports V2 Onion
					/// addresses. Thus, the details are not parsed here.
					case LDKNetAddress_OnionV2
			
					/// A new-style Tor onion address/port on which the peer is listening.
					/// To create the human-readable \"hostname\", concatenate ed25519_pubkey, checksum, and version,
					/// wrap as base32 and append \".onion\".
					case LDKNetAddress_OnionV3
			
					/// A hostname/port on which the peer is listening.
					case LDKNetAddress_Hostname
			

					internal init (value: LDKNetAddress_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKNetAddress_Hostname

						
						// LDKNetAddress_IPv4
						if value.rawValue == 0 {
							self = .LDKNetAddress_IPv4
						}
			
						// LDKNetAddress_IPv6
						if value.rawValue == 1 {
							self = .LDKNetAddress_IPv6
						}
			
						// LDKNetAddress_OnionV2
						if value.rawValue == 2 {
							self = .LDKNetAddress_OnionV2
						}
			
						// LDKNetAddress_OnionV3
						if value.rawValue == 3 {
							self = .LDKNetAddress_OnionV3
						}
			
						// LDKNetAddress_Hostname
						if value.rawValue == 4 {
							self = .LDKNetAddress_Hostname
						}
			
					}

					internal func getCValue() -> LDKNetAddress_Tag {
						switch self {
							
							case .LDKNetAddress_IPv4:
								// return LDKNetAddress_IPv4
								return LDKNetAddress_Tag(0)
			
							case .LDKNetAddress_IPv6:
								// return LDKNetAddress_IPv6
								return LDKNetAddress_Tag(1)
			
							case .LDKNetAddress_OnionV2:
								// return LDKNetAddress_OnionV2
								return LDKNetAddress_Tag(2)
			
							case .LDKNetAddress_OnionV3:
								// return LDKNetAddress_OnionV3
								return LDKNetAddress_Tag(3)
			
							case .LDKNetAddress_Hostname:
								// return LDKNetAddress_Hostname
								return LDKNetAddress_Tag(4)
			
						}
					}

				}

			}
		