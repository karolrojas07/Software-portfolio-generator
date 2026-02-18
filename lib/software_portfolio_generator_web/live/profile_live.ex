defmodule SoftwarePortfolioGeneratorWeb.ProfileLive do
  use SoftwarePortfolioGeneratorWeb, :live_view
  alias SoftwarePortfolioGenerator.Profiles

  defp get_profile() do
    System.get_env("DEFAULT_PROFILE_ID" , "1") |> String.to_integer()
  end

  def render(assigns) do
    ~H"""
    <Layouts.flash_group flash={@flash} />
    <div class="fixed top-0 right-0">
      <Layouts.theme_toggle />
    </div>
    <div>
      <h1>{@profile.firstname} {@profile.lastname}</h1>
      <p>{@profile.title}</p>
      <p>{@profile.birthdate}</p>
      <p>{@profile.email}</p>
      <p>{@profile.city}</p>
      <p>{@profile.state}</p>
      <p>{@profile.country}</p>
      <p>{@profile.zipcode}</p>
      <p>{@profile.phone_number}</p>
      <p>Certifications: {@profile.certifications |> Enum.map(& &1.name) |> Enum.join(", ")}</p>
      <p>Social Networks: {@profile.social_networks |> Enum.map(& &1.label) |> Enum.join(", ")}</p>
      <%= for job <- @profile.profile_jobs do %>
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
    </div>
    """
  end

  def mount(_params, _session, socket) do
    profile = Profiles.get_profile!(get_profile())
    {:ok, assign(socket, %{profile: profile})}
  end
end
