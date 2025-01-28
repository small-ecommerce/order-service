require "grpc"
require "apis/payment_services_pb"

class OrderPayment
def self.process_payment(order_id,  customer_id, amount, payment_method)
    stub = Payment::PaymentService::Stub.new("0.0.0.0:50051", :this_channel_is_insecure)

  request = Payment::PaymentRequest.new(
      order_id: order_id,
      customer_id: customer_id,
      amount: amount,
      payment_method: payment_method
    )

    response = stub.process_payment(request)

    response
  rescue GRPC::BadStatus => e
    puts "gRPC Error: #{e.message}"
    nil
  end
end
