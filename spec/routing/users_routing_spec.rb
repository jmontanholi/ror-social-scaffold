require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users').to route_to('users#index')
    end

    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #add_friend' do
      expect(post: '/add_friend').to route_to('users#add_friend')
    end

    it 'routes to #accept_friendship' do
      expect(post: '/accept_friendship').to route_to('users#accept_friendship')
    end

    it 'routes to #refuse_friendship' do
      expect(post: '/refuse_friendship').to route_to('users#refuse_friendship')
    end
  end
end
