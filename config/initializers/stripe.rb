Rails.configuration.stripe = {
	:publishable_key => 'pk_test_14ViUGZ90Yda79AYPhEvOHsU',
	:secret_key 	=> 'sk_test_1890SuvkAUx1xiGI3FOt9dGP'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
