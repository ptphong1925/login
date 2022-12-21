require "rails_helper"

RSpec.describe CataloguesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/catalogues").to route_to("catalogues#index")
    end

    it "routes to #new" do
      expect(get: "/catalogues/new").to route_to("catalogues#new")
    end

    it "routes to #show" do
      expect(get: "/catalogues/1").to route_to("catalogues#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/catalogues/1/edit").to route_to("catalogues#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/catalogues").to route_to("catalogues#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/catalogues/1").to route_to("catalogues#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/catalogues/1").to route_to("catalogues#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/catalogues/1").to route_to("catalogues#destroy", id: "1")
    end
  end
end
