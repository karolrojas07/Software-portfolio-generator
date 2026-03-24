defmodule SoftwarePortfolioGeneratorWeb.ProfileLive do
  use SoftwarePortfolioGeneratorWeb, :live_view
  alias SoftwarePortfolioGenerator.Profiles

  defp get_profile() do
    System.get_env("DEFAULT_PROFILE_ID", "1") |> String.to_integer()
  end

  def render(assigns) do
    ~H"""
    <Layouts.flash_group flash={@flash} />
    <div class="fixed top-4 right-4 z-50">
      <Layouts.theme_toggle />
    </div>
    <.live_component module={PersonalInformationComponent} id="personal_info" profile={@profile} />
    <.live_component module={CertificationsComponent} id="certifications" profile={@profile} />
    <.live_component
      module={WorkExperienceComponent}
      id="work-experience"
      jobs={@profile.profile_jobs}
    />
    <.live_component module={SocialNetworksComponent} id="social_networks" profile={@profile} />
    """
  end

  def mount(_params, _session, socket) do
    profile = Profiles.get_profile!(get_profile())
    {:ok, assign(socket, %{profile: profile})}
  end
end
