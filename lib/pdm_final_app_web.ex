defmodule PdmFinalAppWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use PdmFinalAppWeb, :controller
      use PdmFinalAppWeb, :html

  The definitions below will be executed for every controller,
  component, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define additional modules and import
  those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: PdmFinalAppWeb

      import Plug.Conn
      import PdmFinalAppWeb.Gettext
      alias PdmFinalAppWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/pdm_final_app_web/templates",
        namespace: PdmFinalAppWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include shared imports and aliases for views
      unquote(view_helpers())
    end
  end

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  def router do
    quote do
      use Phoenix.Router
      #use Phoenix.Router, helpers: false

      import Plug.Conn
      import Phoenix.Controller
    end
  end


  def channel do
    quote do
      use Phoenix.Channel
      import PdmFinalAppWeb.Gettext
    end
  end


  defp view_helpers do
    quote do
      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.View

      import PdmFinalAppWeb.ErrorHelpers
      import PdmFinalAppWeb.Gettext
      alias PdmFinalAppWeb.Router.Helpers, as: Routes
    end
  end



#  def controller do
#    quote do
#      use Phoenix.Controller,
#        formats: [:html, :json],
#        layouts: [html: PdmFinalAppWeb.Layouts]

#      import Plug.Conn
#      import PdmFinalAppWeb.Gettext

#      unquote(verified_routes())
#    end
#  end


#  def verified_routes do
#    quote do
#      use Phoenix.VerifiedRoutes,
#        endpoint: PdmFinalAppWeb.Endpoint,
#        router: PdmFinalAppWeb.Router,
#        statics: PdmFinalAppWeb.static_paths()
#    end
#  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
