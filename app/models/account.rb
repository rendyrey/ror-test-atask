class Account < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  after_create :create_wallets

  # has_many :wallets, -> { select("id, account_id, entity_id, balance") }, dependent: :destroy
  has_many :wallets

  def update_balance
    wallets.each do |wallet|
      wallet.update_balance
    end
  end

  private

  def create_wallets
    entities = Entity.all
    entities.each do |entity|
      Wallet.create!(account_id: self.id, entity_id: entity.id, balance: 0)
    end
  end
end
