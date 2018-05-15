//
//  EchoHandler.swift
//  EchoServer
//
//  Created by Jonathan Wong on 4/25/18.
//

import Foundation
import NIO

class EchoHandler: ChannelInboundHandler {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer
    
    func channelRead(ctx: ChannelHandlerContext, data: NIOAny) {
        var buffer = unwrapInboundIn(data)
        let readableBytes = buffer.readableBytes
        if let received = buffer.readString(length: readableBytes) {
            print(received)
        }
        
        ctx.write(data, promise: nil)
    }
    
    func channelReadComplete(ctx: ChannelHandlerContext) {
        ctx.flush()
    }
    
    func errorCaught(ctx: ChannelHandlerContext, error: Error) {
        print("error: \(error.localizedDescription)")
        ctx.close(promise: nil)
    }
}
