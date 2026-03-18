defmodule WorkExperienceComponent do
  use Phoenix.LiveComponent

  @impl true
  def render(assigns) do
    ~H"""
    <section class="py-20 w-full">
      <div class="mx-auto px-6">

        <div class="mb-8">
          <h2 class="text-4xl font-bold text-slate-900 tracking-tight">
            Work Experience
          </h2>
          <div class="w-16 h-1 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full mt-3 mb-3" />
          <p class="text-slate-500 text-base">
            Filter by technology to explore relevant experience
          </p>
        </div>

        <!-- FILTERS -->
        <div class="backdrop-blur-sm rounded-2xl p-4 border border-slate-100 shadow-sm mb-8 h-full">
          <p class="text-xs uppercase tracking-wider text-slate-400 font-medium my-4">
            Filter by stack
          </p>
          <!-- Categories -->
          <div class="flex flex-wrap gap-2 my-4">
            <button
              phx-click="select_category"
              phx-value-id="all"
              phx-target={@myself}
              class={"rounded-full px-4 py-2 text-sm font-medium transition-all duration-200 #{if is_nil(@selected_category), do: "bg-slate-900 text-white", else: "bg-white text-slate-600 border border-slate-200 hover:border-slate-400"}"}
            >
              All
            </button>

            <%= for cat <- @categories do %>
              <button
                phx-click="select_category"
                phx-value-id={cat.id}
                phx-target={@myself}
                class={"rounded-full px-4 py-2 text-sm font-medium transition-all duration-200 #{if @selected_category == cat.id, do: "bg-slate-900 text-white", else: "bg-white text-slate-600 border border-slate-200 hover:border-slate-400"}"}
              >
                <%= cat.name %>
              </button>
            <% end %>
          </div>

          <!-- Technologies -->
          <div class="flex flex-wrap gap-2">
            <button
              phx-click="select_tech"
              phx-value-id="all"
              phx-target={@myself}
              class={"rounded-full px-4 py-2 text-sm font-medium transition-all duration-200 #{if is_nil(@selected_tech), do: "bg-slate-900 text-white", else: "bg-white text-slate-600 border border-slate-200 hover:border-slate-400"}"}
            >
              All Technologies
            </button>

            <%= for tech <- filtered_technologies(@technologies, @selected_category) do %>
              <button
                phx-click="select_tech"
                phx-value-id={tech.id}
                phx-target={@myself}
                class={"inline-flex items-center gap-1 rounded-full px-3 py-1 text-xs font-medium
        border transition-all duration-200 cursor-pointer hover:scale-105 #{if @selected_tech == tech.id, do: "bg-indigo-500 text-white border-indigo-500", else: "bg-blue-50 text-blue-700 border-blue-200 hover:bg-blue-100"}"}
              >
                <%= tech.name %>
              </button>
            <% end %>
          </div>
        </div>

        <!-- JOBS -->
        <div class="space-y-10">
          <%= for job <- @filtered_jobs do %>
            <div class="card bg-white rounded-2xl shadow-sm hover:shadow-md transition-all duration-300
        border border-slate-100 border-l-4 overflow-hidden animate-fade-in-up">
              <div class="card-body">

                <div class="flex justify-between items-start">
                  <div>
                    <h3 class="text-lg font-semibold text-slate-900 flex items-center gap-2">
                      <%= job.company_name %>
                    </h3>
                    <div class="flex items-center gap-2 bg-slate-50 text-slate-500 rounded-full px-3 py-1 text-xs font-mono shrink-0">
                      <%= job.start_date %> —
                      <%= job.end_date || "Present" %>
                    </div>
                  </div>

                  <%= if job.link do %>
                    <a
                      href={job.link}
                      target="_blank"
                      class="btn btn-sm bg-white text-slate-600 border border-slate-200 hover:border-slate-400"
                    >
                      Visit
                    </a>
                  <% end %>
                </div>

                <p class="mt-4 opacity-80">
                  <%= job.description %>
                </p>

                <!-- Projects -->
                <div class="mt-6 space-y-4">
                  <%= for project <- job.projects do %>
                    <div class="collapse collapse-arrow bg-base-200 mt-4 animate-fade-in">
                      <input type="checkbox" />

                      <div class="collapse-title font-semibold">
                        <%= project.name %>
                      </div>

                      <div class="collapse-content space-y-4">

                        <p><%= Phoenix.HTML.raw(project.description) %></p>

                        <div class="flex flex-wrap gap-2">
                          <%= for tech <- project.project_technologies do %>
                            <% tech = tech.technology %>
                            <span class="badge badge-outline gap-2">
                              <%= if tech.icon_link do %>
                                <img src={tech.icon_link} class="w-4 h-4" />
                              <% end %>
                              <%= tech.name %>
                            </span>
                          <% end %>
                        </div>

                        <%= if project.link do %>
                          <a
                            href={project.link}
                            target="_blank"
                            class="btn btn-xs btn-primary"
                          >
                            View Project
                          </a>
                        <% end %>

                      </div>
                    </div>
                  <% end %>
                </div>

              </div>
            </div>
          <% end %>
        </div>

      </div>
    </section>
    """
  end

  defp filtered_technologies(technologies, nil), do: technologies

  defp filtered_technologies(technologies, category_id) do
    Enum.filter(technologies, fn tech ->
      tech.category.id == category_id
    end)
  end

  @impl true
  def update(assigns, socket) do
    jobs = assigns.jobs

    technologies =
      jobs
      |> Enum.flat_map(& &1.projects)
      |> Enum.flat_map(& &1.project_technologies)
      |> Enum.map(& &1.technology)
      |> Enum.uniq_by(& &1.id)

    categories =
      technologies
      |> Enum.map(& &1.category)
      |> Enum.uniq_by(& &1.id)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:selected_tech, nil)
     |> assign(:selected_category, nil)
     |> assign(:technologies, technologies)
     |> assign(:categories, categories)
     |> assign(:filtered_jobs, jobs)}
  end

  # -----------------------------
  # Events
  # -----------------------------

  @impl true
  def handle_event("select_category", %{"id" => id}, socket) do
    id = if id == "all", do: nil, else: String.to_integer(id)

    socket =
      socket
      |> assign(:selected_category, id)
      |> assign(:selected_tech, nil)
      |> filter_jobs()

    {:noreply, socket}
  end

  @impl true
  def handle_event("select_tech", %{"id" => id}, socket) do
    id = if id == "all", do: nil, else: String.to_integer(id)

    socket =
      socket
      |> assign(:selected_tech, id)
      |> filter_jobs()

    {:noreply, socket}
  end

  # -----------------------------
  # Filtering Logic
  # -----------------------------

  defp filter_jobs(socket) do
    selected_tech = socket.assigns.selected_tech
    selected_category = socket.assigns.selected_category
    jobs = socket.assigns.jobs

    filtered =
      if is_nil(selected_tech) and is_nil(selected_category) do
        jobs
      else
        jobs
        |> Enum.map(fn job ->
          filtered_projects =
            Enum.filter(job.projects, fn project ->
              Enum.any?(project.project_technologies, fn tech ->
                tech_match =
                  if selected_tech,
                    do: tech.technology_id == selected_tech,
                    else: true

                category_match =
                  if selected_category,
                    do: tech.technology.category.id == selected_category,
                    else: true

                tech_match and category_match
              end)
            end)

          %{job | projects: filtered_projects}
        end)
        |> Enum.filter(fn job -> job.projects != [] end)
      end

    assign(socket, :filtered_jobs, filtered)
  end
end
