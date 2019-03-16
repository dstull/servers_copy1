describe HostsController, type: :controller do
  describe "GET index" do
    it "assigns @hosts" do
      host = create(:host)

      get :index

      expect(assigns(:hosts)).to eq([host])
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end
end
