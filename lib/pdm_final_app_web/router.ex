defmodule PdmFinalAppWeb.Router do
  alias PdmFinalAppWeb.ProductoController
  alias PdmFinalAppWeb.MaterialController
  use PdmFinalAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/productos", ProductoController #, except: [:edit, :new, :update]
    put "/productos/:id", ProductoController, :update
    resources "/materiales", MaterialController #, except: [:edit, :new, :update]
    put "/materiales/:id", MaterialController, :update

    #Funciones adicionales
    get "/productos/state/:estado", ProductoController, :get_by_state
    get "/materiales/state/:estado", MaterialController, :get_by_state
    get "/materiales/responsable_sort/:responsable", MaterialController, :get_by_responsable_sort_sigla


  end
end
