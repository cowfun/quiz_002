require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe "#new" do
    it "renders the new view" do
      get :new
      expect(response).to render_template(:new)
    end

    it 'sets an instance variable with a new idea called idea' do
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      it 'creates a new idea in the database' do
        count_before = Idea.count
        idea = Idea.create title: 'new idea', description: 'supersecret'
        count_after = Idea.count
        expect(count_before).to eq(count_after - 1)
      end

      it 'redirects to show page of the idea' do
        post :create, params: { idea:{title: 'hah', description: 'supersecret'} }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do

      it 'doesn\'t create a campaign record in the database' do
        count_before = Idea.count
        idea = Idea.create title: 'new idea'
        count_after = Idea.count
        expect(count_after).to eq(count_before)
      end

      it 'renders the new template' do
        post :create, params: {idea: {title: 'new idea'}}
        expect(response).to render_template(:new)
      end
    end
  end
end
