class LogEveryMinuteJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Rails.logger.info "Log every minute at #{Time.now}"
    accounts = Account.all
    accounts.each do |account|
      account.update_balance
    end
  end
end
