defmodule SoftwarePortfolioGeneratorWeb.ProfileHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `profile_html` directory for all templates available.
  """
  use SoftwarePortfolioGeneratorWeb, :html

  embed_templates "profile/*"
end
