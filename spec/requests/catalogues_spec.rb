require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/catalogues", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Catalogue. As you add validations to Catalogue, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Catalogue.create! valid_attributes
      get catalogues_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      catalogue = Catalogue.create! valid_attributes
      get catalogue_url(catalogue)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_catalogue_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      catalogue = Catalogue.create! valid_attributes
      get edit_catalogue_url(catalogue)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Catalogue" do
        expect {
          post catalogues_url, params: { catalogue: valid_attributes }
        }.to change(Catalogue, :count).by(1)
      end

      it "redirects to the created catalogue" do
        post catalogues_url, params: { catalogue: valid_attributes }
        expect(response).to redirect_to(catalogue_url(Catalogue.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Catalogue" do
        expect {
          post catalogues_url, params: { catalogue: invalid_attributes }
        }.to change(Catalogue, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post catalogues_url, params: { catalogue: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested catalogue" do
        catalogue = Catalogue.create! valid_attributes
        patch catalogue_url(catalogue), params: { catalogue: new_attributes }
        catalogue.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the catalogue" do
        catalogue = Catalogue.create! valid_attributes
        patch catalogue_url(catalogue), params: { catalogue: new_attributes }
        catalogue.reload
        expect(response).to redirect_to(catalogue_url(catalogue))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        catalogue = Catalogue.create! valid_attributes
        patch catalogue_url(catalogue), params: { catalogue: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested catalogue" do
      catalogue = Catalogue.create! valid_attributes
      expect {
        delete catalogue_url(catalogue)
      }.to change(Catalogue, :count).by(-1)
    end

    it "redirects to the catalogues list" do
      catalogue = Catalogue.create! valid_attributes
      delete catalogue_url(catalogue)
      expect(response).to redirect_to(catalogues_url)
    end
  end
end
