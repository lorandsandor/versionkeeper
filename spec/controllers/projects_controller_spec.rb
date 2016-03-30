require 'spec_helper'
require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: 'Project UK' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  let(:user) { create :user }

  let(:project) { user.projects.create! valid_attributes }

  before do
    sign_in user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all projects as @projects" do
      get :index, params: {}, session: valid_session
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #show" do
    it "assigns the requested project as @project" do
      get :show, params: {:id => project.to_param}, session: valid_session
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    it "assigns a new project as @project" do
      get :new, params: {}, session: valid_session
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do
    it "assigns the requested project as @project" do
      get :edit, params: {:id => project.to_param}, session: valid_session
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      specify do
        expect {
          post :create, params: {:project => valid_attributes}, session: valid_session
        }.to change(Project, :count).by(1)
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      specify do
        post :create, params: {:project => invalid_attributes}, session: valid_session
        expect(assigns(:project)).to be_a_new(Project)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Project US' }
      }

      specify do
        put :update, params: {:id => project.to_param, :project => new_attributes}, session: valid_session
        project.reload
        expect(project.name).to eq new_attributes[:name]
        expect(assigns(:project)).to eq(project)
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid params" do
      specify do
        put :update, params: {:id => project.to_param, :project => invalid_attributes}, session: valid_session
        expect(assigns(:project)).to eq(project)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    specify do
      project.reload
      expect {
        delete :destroy, params: {:id => project.to_param}, session: valid_session
      }.to change(Project, :count).by(-1)
      expect(response).to redirect_to(projects_url)
    end
  end
end
