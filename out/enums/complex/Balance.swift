
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Balance = Bindings.Balance

			extension Bindings {

				/// Details about the balance(s) available for spending once the channel appears on chain.
				/// 
				/// See [`ChannelMonitor::get_claimable_balances`] for more details on when these will or will not
				/// be provided.
				public class Balance: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBalance?

					public init(cType: LDKBalance) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKBalance, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum BalanceType {
						
						/// The channel is not yet closed (or the commitment or closing transaction has not yet
						/// appeared in a block). The given balance is claimable (less on-chain fees) if the channel is
						/// force-closed now.
						case ClaimableOnChannelClose
			
						/// The channel has been closed, and the given balance is ours but awaiting confirmations until
						/// we consider it spendable.
						case ClaimableAwaitingConfirmations
			
						/// The channel has been closed, and the given balance should be ours but awaiting spending
						/// transaction confirmation. If the spending transaction does not confirm in time, it is
						/// possible our counterparty can take the funds by broadcasting an HTLC timeout on-chain.
						/// 
						/// Once the spending transaction confirms, before it has reached enough confirmations to be
						/// considered safe from chain reorganizations, the balance will instead be provided via
						/// [`Balance::ClaimableAwaitingConfirmations`].
						case ContentiousClaimable
			
						/// HTLCs which we sent to our counterparty which are claimable after a timeout (less on-chain
						/// fees) if the counterparty does not know the preimage for the HTLCs. These are somewhat
						/// likely to be claimed by our counterparty before we do.
						case MaybeTimeoutClaimableHTLC
			
						/// HTLCs which we received from our counterparty which are claimable with a preimage which we
						/// do not currently have. This will only be claimable if we receive the preimage from the node
						/// to which we forwarded this HTLC before the timeout.
						case MaybePreimageClaimableHTLC
			
						/// The channel has been closed, and our counterparty broadcasted a revoked commitment
						/// transaction.
						/// 
						/// Thus, we're able to claim all outputs in the commitment transaction, one of which has the
						/// following amount.
						case CounterpartyRevokedOutputClaimable
			
					}

					public func getValueType() -> BalanceType? {
						switch self.cType!.tag {
							case LDKBalance_ClaimableOnChannelClose:
								return .ClaimableOnChannelClose
			
							case LDKBalance_ClaimableAwaitingConfirmations:
								return .ClaimableAwaitingConfirmations
			
							case LDKBalance_ContentiousClaimable:
								return .ContentiousClaimable
			
							case LDKBalance_MaybeTimeoutClaimableHTLC:
								return .MaybeTimeoutClaimableHTLC
			
							case LDKBalance_MaybePreimageClaimableHTLC:
								return .MaybePreimageClaimableHTLC
			
							case LDKBalance_CounterpartyRevokedOutputClaimable:
								return .CounterpartyRevokedOutputClaimable
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the Balance
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Balance_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the Balance
					internal func clone() -> Balance {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBalance>) in
				Balance_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Balance(cType: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new ClaimableOnChannelClose-variant Balance
					public init(claimableAmountSatoshis: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Balance_claimable_on_channel_close(claimableAmountSatoshis)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Balance(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new ClaimableAwaitingConfirmations-variant Balance
					public init(claimableAmountSatoshis: UInt64, confirmationHeight: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Balance_claimable_awaiting_confirmations(claimableAmountSatoshis, confirmationHeight)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Balance(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new ContentiousClaimable-variant Balance
					public init(claimableAmountSatoshis: UInt64, timeoutHeight: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Balance_contentious_claimable(claimableAmountSatoshis, timeoutHeight)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Balance(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new MaybeTimeoutClaimableHTLC-variant Balance
					public init(claimableAmountSatoshis: UInt64, claimableHeight: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Balance_maybe_timeout_claimable_htlc(claimableAmountSatoshis, claimableHeight)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Balance(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new MaybePreimageClaimableHTLC-variant Balance
					public init(claimableAmountSatoshis: UInt64, expiryHeight: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Balance_maybe_preimage_claimable_htlc(claimableAmountSatoshis, expiryHeight)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Balance(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new CounterpartyRevokedOutputClaimable-variant Balance
					public init(claimableAmountSatoshis: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Balance_counterparty_revoked_output_claimable(claimableAmountSatoshis)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Balance(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Checks if two Balances contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKBalance>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKBalance>) in
				Balance_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					
					public func getValueAsClaimableOnChannelClose() -> ClaimableOnChannelClose? {
						if self.cType?.tag != LDKBalance_ClaimableOnChannelClose {
							return nil
						}

						return Balance_LDKClaimableOnChannelClose_Body(cType: self.cType!.claimable_on_channel_close)
					}
			
					public func getValueAsClaimableAwaitingConfirmations() -> ClaimableAwaitingConfirmations? {
						if self.cType?.tag != LDKBalance_ClaimableAwaitingConfirmations {
							return nil
						}

						return Balance_LDKClaimableAwaitingConfirmations_Body(cType: self.cType!.claimable_awaiting_confirmations)
					}
			
					public func getValueAsContentiousClaimable() -> ContentiousClaimable? {
						if self.cType?.tag != LDKBalance_ContentiousClaimable {
							return nil
						}

						return Balance_LDKContentiousClaimable_Body(cType: self.cType!.contentious_claimable)
					}
			
					public func getValueAsMaybeTimeoutClaimableHtlc() -> MaybeTimeoutClaimableHTLC? {
						if self.cType?.tag != LDKBalance_MaybeTimeoutClaimableHtlc {
							return nil
						}

						return Balance_LDKMaybeTimeoutClaimableHTLC_Body(cType: self.cType!.maybe_timeout_claimable_htlc)
					}
			
					public func getValueAsMaybePreimageClaimableHtlc() -> MaybePreimageClaimableHTLC? {
						if self.cType?.tag != LDKBalance_MaybePreimageClaimableHtlc {
							return nil
						}

						return Balance_LDKMaybePreimageClaimableHTLC_Body(cType: self.cType!.maybe_preimage_claimable_htlc)
					}
			
					public func getValueAsCounterpartyRevokedOutputClaimable() -> CounterpartyRevokedOutputClaimable? {
						if self.cType?.tag != LDKBalance_CounterpartyRevokedOutputClaimable {
							return nil
						}

						return Balance_LDKCounterpartyRevokedOutputClaimable_Body(cType: self.cType!.counterparty_revoked_output_claimable)
					}
			

					internal func dangle() -> Balance {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Balance {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Balance \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Balance \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					internal typealias Balance_LDKClaimableOnChannelClose_Body = ClaimableOnChannelClose
			

					/// 
					public class ClaimableOnChannelClose: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBalance_LDKClaimableOnChannelClose_Body?

						fileprivate init(cType: LDKBalance_LDKClaimableOnChannelClose_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKBalance_LDKClaimableOnChannelClose_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The amount available to claim, in satoshis, excluding the on-chain fees which will be
						/// required to do so.
						public func getClaimableAmountSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.claimable_amount_satoshis

							return returnValue;
						}
		

						internal func dangle() -> ClaimableOnChannelClose {
							self.dangling = true
							return self
						}

											

					}

					
		
					
					internal typealias Balance_LDKClaimableAwaitingConfirmations_Body = ClaimableAwaitingConfirmations
			

					/// 
					public class ClaimableAwaitingConfirmations: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBalance_LDKClaimableAwaitingConfirmations_Body?

						fileprivate init(cType: LDKBalance_LDKClaimableAwaitingConfirmations_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKBalance_LDKClaimableAwaitingConfirmations_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The amount available to claim, in satoshis, possibly excluding the on-chain fees which
						/// were spent in broadcasting the transaction.
						public func getClaimableAmountSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.claimable_amount_satoshis

							return returnValue;
						}
		
						/// The height at which an [`Event::SpendableOutputs`] event will be generated for this
						/// amount.
						public func getConfirmationHeight() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.confirmation_height

							return returnValue;
						}
		

						internal func dangle() -> ClaimableAwaitingConfirmations {
							self.dangling = true
							return self
						}

											

					}

					
		
					
					internal typealias Balance_LDKContentiousClaimable_Body = ContentiousClaimable
			

					/// 
					public class ContentiousClaimable: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBalance_LDKContentiousClaimable_Body?

						fileprivate init(cType: LDKBalance_LDKContentiousClaimable_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKBalance_LDKContentiousClaimable_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The amount available to claim, in satoshis, excluding the on-chain fees which will be
						/// required to do so.
						public func getClaimableAmountSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.claimable_amount_satoshis

							return returnValue;
						}
		
						/// The height at which the counterparty may be able to claim the balance if we have not
						/// done so.
						public func getTimeoutHeight() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.timeout_height

							return returnValue;
						}
		

						internal func dangle() -> ContentiousClaimable {
							self.dangling = true
							return self
						}

											

					}

					
		
					
					internal typealias Balance_LDKMaybeTimeoutClaimableHTLC_Body = MaybeTimeoutClaimableHTLC
			

					/// 
					public class MaybeTimeoutClaimableHTLC: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body?

						fileprivate init(cType: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The amount potentially available to claim, in satoshis, excluding the on-chain fees
						/// which will be required to do so.
						public func getClaimableAmountSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.claimable_amount_satoshis

							return returnValue;
						}
		
						/// The height at which we will be able to claim the balance if our counterparty has not
						/// done so.
						public func getClaimableHeight() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.claimable_height

							return returnValue;
						}
		

						internal func dangle() -> MaybeTimeoutClaimableHTLC {
							self.dangling = true
							return self
						}

											

					}

					
		
					
					internal typealias Balance_LDKMaybePreimageClaimableHTLC_Body = MaybePreimageClaimableHTLC
			

					/// 
					public class MaybePreimageClaimableHTLC: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBalance_LDKMaybePreimageClaimableHTLC_Body?

						fileprivate init(cType: LDKBalance_LDKMaybePreimageClaimableHTLC_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKBalance_LDKMaybePreimageClaimableHTLC_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The amount potentially available to claim, in satoshis, excluding the on-chain fees
						/// which will be required to do so.
						public func getClaimableAmountSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.claimable_amount_satoshis

							return returnValue;
						}
		
						/// The height at which our counterparty will be able to claim the balance if we have not
						/// yet received the preimage and claimed it ourselves.
						public func getExpiryHeight() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.expiry_height

							return returnValue;
						}
		

						internal func dangle() -> MaybePreimageClaimableHTLC {
							self.dangling = true
							return self
						}

											

					}

					
		
					
					internal typealias Balance_LDKCounterpartyRevokedOutputClaimable_Body = CounterpartyRevokedOutputClaimable
			

					/// 
					public class CounterpartyRevokedOutputClaimable: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body?

						fileprivate init(cType: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The amount, in satoshis, of the output which we can claim.
						/// 
						/// Note that for outputs from HTLC balances this may be excluding some on-chain fees that
						/// were already spent.
						public func getClaimableAmountSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.claimable_amount_satoshis

							return returnValue;
						}
		

						internal func dangle() -> CounterpartyRevokedOutputClaimable {
							self.dangling = true
							return self
						}

											

					}

					
		

				}

			}
		