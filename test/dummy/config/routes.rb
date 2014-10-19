Dummy::Application.routes.draw do
  get 'test/basic', :to => 'test#basic'
  get 'test/responding', :to => 'test#responding'
  get 'test/mobile_only', :to => 'test#mobile_only'
end
