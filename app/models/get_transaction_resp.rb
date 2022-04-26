class GetTransactionResp
    @status_code
    @status
    @message
    @transactions
    def initialize(trans_status_code, trans_status, trans_message, trans)
        @status_code = trans_status_code
        @status = trans_status
        @message = trans_message
        @transactions = trans
    end
  end