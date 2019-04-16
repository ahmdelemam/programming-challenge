require 'rails_helper'

RSpec.describe TodoItemsController, type: :controller do

  describe 'GET /todo_items' do

    let!(:todo_items) { create_list(:todo_item, 20) }


    before { get :index }

    it 'returns success' do
      expect(response).to be_success
    end

    it 'returns json data' do
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data.count).to eq(10)
    end

  end

  describe 'GET /todo_items/:id' do
    let!(:todo_item) { create(:todo_item) }


    context 'when the record exists' do
      before { get :show, params: { id: todo_item.id } }

      it 'returns the item' do
        data = JSON.parse(response.body)
        expect(data).not_to be_empty
        expect(data['id']).to eq(todo_item.id)
      end

      it 'returns success' do
        expect(response).to be_success
      end
    end

    context 'when the record does not exist' do
      before { get :show, params: { id: 100 } }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        data = JSON.parse(response.body)
        expect(data['error_code']).to eq("Fidor002")
      end
    end
  end

  describe 'POST /todo_items' do

    let(:valid_attributes) { { title: 'Fidor task', read: '1' } }

    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'creates an item' do
        data = JSON.parse(response.body)
        expect(data['title']).to eq('Fidor task')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: { title: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a validation failure message' do
        data = JSON.parse(response.body)
        expect(data['error_code']).to eq("Fidor003")
      end
    end
  end

  describe 'PUT /todo_items/:id' do
    let!(:todo_item) { create(:todo_item) }

    let(:valid_attributes) { { id: todo_item.id, title: 'Fidor solutions' } }

    context 'when the record exists' do
      before { put :update, params: valid_attributes }

      it 'updates the record' do
        expect(TodoItem.last.title).to eq('Fidor solutions')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe 'DELETE /todo_items/:id' do
    let!(:todo_item) { create(:todo_item) }

    before { delete :destroy, params: { id: todo_item.id } }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end


end
