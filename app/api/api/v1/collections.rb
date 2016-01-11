module API
	  module V1
			class Collections < Grape::API
				version 'v1'
				format :json
				content_type :json, "application/json;charset=UTF-8"
				rescue_from :all

			  resource :collections, desc: 'Все коллекции' do
					desc "Все коллекции"
					get do
						Collection.first.tiles
					end


				end
			end
	end
end
