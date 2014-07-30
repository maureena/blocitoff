require 'rails_helper'
require 'ruby-debug'

describe ListsController do

  before (:each) do
      user = create(:user)
      sign_in user
    end


  describe "GET #index" do
    it "populates an array of lists" do
      get :index
      expect(assigns(:lists).length).to eq(1)
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
      expect(subject).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves new list to the database" do
        expect{
          post :create, list: { title: "blah", user_id: 2 }
        }.to change(List,:count).by(1)
      end
      it "redirects to the user's list page" do
        post :create, list: { title: "blah", user_id: 2 }
        expect(subject).to redirect_to(List.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new list to the database" do
        expect{
          post :create, list: FactoryGirl.attributes_for(:invalid_list)
        }.to_not change(List,:count)
      end

      it "renders the :new template" do
        post :create, list: FactoryGirl.attributes_for(:invalid_list)
        expect(response).to render_template(:new)
      end
    end
  end

end
