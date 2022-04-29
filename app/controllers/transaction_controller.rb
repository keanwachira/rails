require "openssl"
require "slack"
include ActionController::HttpAuthentication::Digest::ControllerMethods
class TransactionController < ApplicationController
  REALM = "SuperSecret"
  USERS = {"user" => "password",
           "dap" => OpenSSL::Digest::MD5.hexdigest(["dap",REALM,"secret"].join(":"))}
  before_action :authenticate #, except: [:list]

  #initialize slack client
  @@client = Slack::Web::Client.new(token: "xoxb-3462556498257-3450270069891-PE3IpLZUUBkjgU6nfXAe98wS")
  
  
  
  #method to create new transaction
  def create
    #transactiontosave = transaction_params

    fxrate = calculatefxrate(params[:destination_amount].to_d,params[:source_amount].to_d)
    
    source_amount = params[:source_amount].to_d
    



    @transactiontosave = Transaction.new(destination_amount: params[:destination_amount],source_amount:params[:source_amount],
      transaction_ref: params[:transaction_ref],transaction_id: params[:transaction_id],
       status: params[:status],source_currency: params[:source_currency], destination_amount: params[:destination_amount],
      destination_currency: params[:destination_currency],customer_id: params[:customer_id],transaction_date: params[:transaction_date],
    exchange_rate: fxrate)  
    
  
    if @transactiontosave.save # if successful
      resp = CreateTransactionResp.new(0,"SUCCESS","Transaction Successfully created")
      render json: resp, status: 201    
    else #bad request, respond with errors
      resp = CreateTransactionResp.new(1,"FAILED", @transactiontosave.errors.full_messages)
      render json: resp, status: 400
    end
  rescue Exception=> e  #log exception   
    @@client.chat_postMessage(channel: '#rails', text: "Create Function Error:" + e.message+'\n'+e.backtrace.inspect, as_user: true)
    resp = CreateTransactionResp.new(2, "FAILED",e.message+' '+e.backtrace.inspect)
    render json: resp, status: 500   
    
  end

  # get transactions with params [page, count] as filtering options
  def list  
    @page = params[:page]||1
    @count = params[:count]||20  
    @transaction = Transaction.all.limit(@count.to_i).offset((@page.to_i-1)*@count.to_i).order(id: :desc)
    resp = TransactionListResp.new(0,"SUCCESS","Get Transactions Successfully",@transaction)
    render json: resp,status: 200
  rescue Exception=> e #log exception
    @@client.chat_postMessage(channel: '#rails', text: "List Function Error:" + e.message+'\n'+e.backtrace.inspect, as_user: true)
    resp = TransactionListResp.new(2, "FAILED",e.message,nil)
    render json: resp, status: 500
  end 
  
  # get single transaction by id
  def show
    @transaction = Transaction.find_by(transaction_id: params[:id])
     if @transaction!=nil #if transaction found
      resp = GetTransactionResp.new(0,"SUCCESS","Get Transactions Successfully",@transaction)
      render json: resp, status:200
     else  #transaction not found
       resp = GetTransactionResp.new(1,"FAILED","Transaction Not Found",@transaction)
       render json: resp, status:404
     end
  rescue Exception=> e  # log exception
    @@client.chat_postMessage(channel: '#rails', text: "List Function Error:" + e.message+'\n'+e.backtrace.inspect, as_user: true)
    resp = GetTransactionResp.new(2, "FAILED",e.message)
    render json: resp, status: 500
  end
  def calculatefxrate(destinationamt, sourceamt)
    return destinationamt/sourceamt
  end

  private
   def transaction_params
     params.require(:transaction)
     .permit(:transaction_ref, :transaction_id, :status, :source_amount, :source_currency, :destination_amount, :destination_currency,:customer_id,:transaction_date)
   end
  private
    def authenticate
      authenticate_or_request_with_http_digest(REALM) do |username|
        USERS[username]
      end
    end
  
end

