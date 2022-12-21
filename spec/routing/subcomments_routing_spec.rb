require "rails_helper"

RSpec.describe SubcommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/subcomments").to route_to("subcomments#index")
    end

    it "routes to #new" do
      expect(get: "/subcomments/new").to route_to("subcomments#new")
    end

    it "routes to #show" do
      expect(get: "/subcomments/1").to route_to("subcomments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/subcomments/1/edit").to route_to("subcomments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/subcomments").to route_to("subcomments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/subcomments/1").to route_to("subcomments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/subcomments/1").to route_to("subcomments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/subcomments/1").to route_to("subcomments#destroy", id: "1")
    end
  end
end
