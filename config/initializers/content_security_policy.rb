Rails.application.config.content_security_policy do |policy|
  if Rails.env.development?
    policy.script_src :self, :https, :unsafe_eval, :unsafe_inline
  else
    policy.script_src :self, :https
  end
end