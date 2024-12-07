class AccountController < ApplicationController
  skip_before_action :authenticate_user, only: [ :create ]
  before_action :find_user, only: [ :show ]

  def get
    @accounts = Account.all
    render json: @accounts, status: :ok
  end

  def show
    render json: @account, status: :ok
  end

  def create
    begin
      @account = Account.create!(account_params)

      render json: { error: false, message: "Account created", account: @account.as_json(except: :password_digest) }, status: :created
    rescue => e
      render json: { error: true, message: e.message }, status: :unprocessable_entity
    end
  end

  def account_balance
    begin
      recalculate_balance
      balance_info = @current_user.wallets.includes(:entity).map do |wallet|
        {
          wallet_entity: wallet.entity.entity_name,
          balance: wallet.balance.to_f
        }
      end


      render json: { error: false, account: @current_user, balance_info: balance_info }, status: :ok
    rescue => e
      render json: { error: true, message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.permit(:name, :email, :password)
  end

  def recalculate_balance
    @current_user.wallets.each { |wallet| wallet.update_balance }
  end

  def find_user
    @account = Account.find(params[:id])
  end
end
