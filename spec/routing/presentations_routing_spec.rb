require "spec_helper"

describe PresentationsController do
  describe "routing" do

    it "routes to #index" do
      get("/presentations").should route_to("presentations#index")
    end

    it "routes to #new" do
      get("/presentations/new").should route_to("presentations#new")
    end

    it "routes to #show" do
      get("/presentations/1").should route_to("presentations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/presentations/1/edit").should route_to("presentations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/presentations").should route_to("presentations#create")
    end

    it "routes to #update" do
      put("/presentations/1").should route_to("presentations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/presentations/1").should route_to("presentations#destroy", :id => "1")
    end

  end
end
