describe Hosts::BulkAddController do
  context 'GET new' do
    it 'renders the form correctly' do
      get :new

      expect(response).to render_template(:new)
      expect(response).to have_http_status(:success)
    end

    it 'has proper placeholder text' do
      get :new

      expect(response.body).to match(/placeholder="One Host Name per line"/)
    end
  end

  context 'POST create' do
    it 'creates multiple records' do
      expect do
        post :create, params: { hosts_bulk_add: { host_names: "test1\r\ntest2\r\n" } }
      end.to change(Host, :count).by(2)

      expect(response).to have_http_status(:redirect)
    end

    it 'fails to save with spaces in name' do
      post :create, params: { hosts_bulk_add: { host_names: "te st1\r\ntest2\r\n" } }

      expect(response.body).to have_content('No spaces allowed')
    end

    it 'fails to save no hostnames' do
      post :create, params: { hosts_bulk_add: { host_names: '' } }

      expect(response.body).to have_content("Host names can't be blank")
    end
  end
end