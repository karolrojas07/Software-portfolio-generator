defmodule SoftwarePortfolioGeneratorWeb.ProfileLive do
  use SoftwarePortfolioGeneratorWeb, :live_view
  alias SoftwarePortfolioGenerator.Profiles

  defp get_profile() do
    System.get_env("DEFAULT_PROFILE_ID" , "1") |> String.to_integer()
  end

  def render(assigns) do
    ~H"""
    <Layouts.flash_group flash={@flash} />
    <div class="flex flex-col items-center justify-center min-h-screen">

      <div class="absolute top-4 right-4">
        <Layouts.theme_toggle />
      </div>
      <div class="content">
        <.live_component module={PersonalInformationComponent} id="personal_info" profile={@profile} />
        <p>Certifications: {@profile.certifications |> Enum.map(& &1.name) |> Enum.join(", ")}</p>
;        <%= for job <- @profile.profile_jobs do %>
          <div>
            <h2>{job.company_name}</h2>
            <p>{job.start_date} - {job.end_date}</p>
            <%= for project <- job.projects do %>
              <div>
                <h3>{project.name}</h3>
                <p>{project.description}</p>
                <p>Technologies: {project.project_technologies |> Enum.map(& "#{&1.technology.name} (#{&1.technology.category.name})") |> Enum.join(", ")}</p>
              </div>
            <% end %>
          </div>
        <% end %>
        <p>Languages: {@profile.profile_languages |> Enum.map(& &1.language.name) |> Enum.join(", ")}</p>
        <p>Technologies: {@profile.profile_technologies |> Enum.map(& "#{&1.technology.name} (#{&1.technology.category.name})") |> Enum.join(", ")}</p>
        <.live_component module={SocialNetworksComponent} id="social_networks" profile={@profile} />
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    profile = Profiles.get_profile!(get_profile())
    {:ok, assign(socket, %{profile: profile})}
  end
end
