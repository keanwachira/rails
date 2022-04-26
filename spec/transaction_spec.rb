require 'rails_helper'
RSpec.describe 'transactions api', type: :request do
        describe "GET /transactions" do
            it "returns list successfully" do
                get '/transactions'
                puts response.body
                expect(JSON.parse(response.body)['status_code']).to eql(0)
                expect(response).to have_http_status(:success)
                # expect(JSON.parse(reponse.body)['transactions'].count).to eql(1)
                expect(JSON.parse(response.body)['status']).to eql('SUCCESS')
            end        
        end
        describe "GET /transactions/7643767224" do
            it "returns the transaction successfully" do
                              
                get '/transactions/7643767224'
                puts response.body
                expect(JSON.parse(response.body)['status_code']).to eql(0)
                expect(response).to have_http_status(:success)                
                expect(JSON.parse(response.body)['status']).to eql('SUCCESS')
            end        
        end
        describe "POST /transactions", params:{transaction: {transaction_ref: "AB234VB54",
            transaction_id: "7643767225",
            status:"Pending",
            source_amount:140,
            source_currency:"USD",
            destination_amount:15500,
            destination_currency:"KES",
            customer_id:1,
            exchange_rate:115,
            transaction_date:"26-04-2022"}} do
           it "inserts record sucessfully" do
            post '/transactions'
            puts response.body  
           end
        end
end