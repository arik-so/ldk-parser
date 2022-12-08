//
//  UtilMethods.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/19/21.
//

#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public class UtilMethods {

    /**
     * Read a C2Tuple_BlockHashChannelManagerZ from a byte array, created by C2Tuple_BlockHashChannelManagerZ_write
     */
    public class func constructor_BlockHashChannelManagerZ_read(ser: [UInt8], arg_keys_manager: KeysInterface, arg_fee_estimator: FeeEstimator, arg_chain_monitor: Watch, arg_tx_broadcaster: BroadcasterInterface, arg_logger: Logger, arg_default_config: UserConfig, arg_channel_monitors: [ChannelMonitor]) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
        let args = ChannelManagerReadArgs(keysManager: arg_keys_manager, feeEstimator: arg_fee_estimator, chainMonitor: arg_chain_monitor, txBroadcaster: arg_tx_broadcaster, logger: arg_logger, defaultConfig: arg_default_config, channelMonitors: arg_channel_monitors)
        args.dangle()

        let result = Bindings.readBlockHashChannelManager(ser: ser, arg: args)
        return result
    }

    /**
     * Read a C2Tuple_BlockHashChannelMonitorZ from a byte array, created by C2Tuple_BlockHashChannelMonitorZ_write
     */
    public class func constructor_BlockHashChannelMonitorZ_read(ser: [UInt8], arg: KeysInterface) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
        return Bindings.readBlockHashChannelMonitor(ser: ser, arg: arg)
    }


}
