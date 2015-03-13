require 'pusher'

pusher_app_id = '111083'
pusher_key = '54b6ac37e18c5fb6ce23'
pusher_secret = 'c9a599052500d150ea9f'

Pusher.url = "http://#{pusher_key}:#{pusher_secret}@api.pusherapp.com/apps/#{pusher_app_id}"
Pusher.logger = Rails.logger
