
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Intended destination of a failed HTLC as indicated in [`Event::HTLCHandlingFailed`].
			public typealias HTLCDestination_Tag = Bindings.HTLCDestination_Tag

			extension Bindings {

				/// Intended destination of a failed HTLC as indicated in [`Event::HTLCHandlingFailed`].
				public enum HTLCDestination_Tag {

					
					/// We tried forwarding to a channel but failed to do so. An example of such an instance is when
					/// there is insufficient capacity in our outbound channel.
					case LDKHTLCDestination_NextHopChannel
			
					/// Scenario where we are unsure of the next node to forward the HTLC to.
					case LDKHTLCDestination_UnknownNextHop
			
					/// Failure scenario where an HTLC may have been forwarded to be intended for us,
					/// but is invalid for some reason, so we reject it.
					/// 
					/// Some of the reasons may include:
					/// * HTLC Timeouts
					/// * Expected MPP amount to claim does not equal HTLC total
					/// * Claimable amount does not match expected amount
					case LDKHTLCDestination_FailedPayment
			

					internal init (value: LDKHTLCDestination_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKHTLCDestination_FailedPayment

						
						// LDKHTLCDestination_NextHopChannel
						if value.rawValue == 0 {
							self = .LDKHTLCDestination_NextHopChannel
						}
			
						// LDKHTLCDestination_UnknownNextHop
						if value.rawValue == 1 {
							self = .LDKHTLCDestination_UnknownNextHop
						}
			
						// LDKHTLCDestination_FailedPayment
						if value.rawValue == 2 {
							self = .LDKHTLCDestination_FailedPayment
						}
			
					}

					internal func getCValue() -> LDKHTLCDestination_Tag {
						switch self {
							
							case .LDKHTLCDestination_NextHopChannel:
								// return LDKHTLCDestination_NextHopChannel
								return LDKHTLCDestination_Tag(0)
			
							case .LDKHTLCDestination_UnknownNextHop:
								// return LDKHTLCDestination_UnknownNextHop
								return LDKHTLCDestination_Tag(1)
			
							case .LDKHTLCDestination_FailedPayment:
								// return LDKHTLCDestination_FailedPayment
								return LDKHTLCDestination_Tag(2)
			
						}
					}

				}

			}
		