require 'rails_helper'

describe ListsController do


  describe "GET #index" do
    it "populates an array of lists" do
      list = create(:list)
      get :index
      expect(assigns(:lists)).to eq([list])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns list to @list" do
      list = create(:list)
      get :show, id: list
      expect(assigns(:list)).to eq(list)
    end

    it "renders :show template" do
      get :show, id: create(:list)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "gets a new list" do
      get :new
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves new list to the database" do
        expect{
          post :create, list: FactoryGirl.attributes_for(:list)
        }.to change(List,:count).by(1)
      end
      it "redirects to the user's list page" do
        post :create, list: FactoryGirl.attributes_for(:list)
        expect(response).to redirect_to(List.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new list to the database"
      it "renders the :new template"
    end
  end

end
