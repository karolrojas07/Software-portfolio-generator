defmodule SoftwarePortfolioGeneratorWeb.ProfileController do
  use SoftwarePortfolioGeneratorWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
