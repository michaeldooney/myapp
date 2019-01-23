if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_FetXxzj3ObbCKvkel6z40MW3',
    secret_key: 'sk_test_iEarbg7YYNQiGNEZ5b46Y3Jv'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
