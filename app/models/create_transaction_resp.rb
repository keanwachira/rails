class CreateTransactionResp
    @status_code
    @status
    @message
    def initialize(trans_status_code, trans_status, trans_message)
        @status_code = trans_status_code
        @status = trans_status
        @message = trans_message
    end
  end