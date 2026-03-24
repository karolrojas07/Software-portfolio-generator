defmodule WorkExperienceComponent do
  use Phoenix.LiveComponent

  @impl true
  def render(assigns) do
    ~H"""
    <section class="w-full bg-slate-50 dark:bg-[#0D1117] py-20 my-12">
      <div class="flex flex-col gap-10 max-w-7xl mx-auto px-6 sm:px-8 my-12">
        <%!-- Section heading --%>
        <div class="flex flex-col gap-2.5">
          <h2 class="text-[38px] font-bold text-orange-500 dark:text-violet-400 tracking-tight">
            Work Experience
          </h2>
          <div class="w-14 h-1 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500"></div>
          <p class="text-[15px] text-slate-500 dark:text-slate-400">
            Filter by technology to explore relevant experience
          </p>
        </div>

        <%!-- Filter panel --%>
        <div class="bg-white dark:bg-[#161B27] rounded-2xl border border-slate-200 dark:border-slate-800 shadow-[0_2px_8px_rgba(15,23,42,0.03)] py-4 px-5 flex flex-col gap-3">
          <%!-- Category row --%>
          <div class="flex flex-wrap items-center gap-2">
            <button
              phx-click="select_category"
              phx-value-id="all"
              phx-target={@myself}
              class={"rounded-full px-4 py-2 text-[13px] font-medium transition-all duration-200 cursor-pointer #{if is_nil(@selected_category), do: "bg-slate-900 text-white dark:bg-slate-100 dark:text-slate-900", else: "bg-white text-slate-600 border border-slate-200 hover:border-slate-400 dark:bg-transparent dark:text-slate-400 dark:border-slate-700"}"}
            >
              All
            </button>

            <%= for cat <- @categories do %>
              <button
                phx-click="select_category"
                phx-value-id={cat.id}
                phx-target={@myself}
                class={"rounded-full px-4 py-2 text-[13px] font-medium transition-all duration-200 cursor-pointer #{if @selected_category == cat.id, do: "bg-slate-900 text-white dark:bg-slate-100 dark:text-slate-900", else: "bg-white text-slate-600 border border-slate-200 hover:border-slate-400 dark:bg-transparent dark:text-slate-400 dark:border-slate-700"}"}
              >
                {cat.name}
              </button>
            <% end %>
          </div>

          <%!-- Technology row --%>
          <div class="flex flex-wrap items-center gap-1.5">
            <button
              phx-click="select_tech"
              phx-value-id="all"
              phx-target={@myself}
              class={"rounded-full px-3 py-1 text-xs transition-all duration-200 cursor-pointer #{if is_nil(@selected_tech), do: "bg-slate-100 text-slate-500 dark:bg-slate-800 dark:text-slate-400", else: "bg-slate-100 text-slate-500 dark:bg-slate-800 dark:text-slate-400"}"}
            >
              All Technologies
            </button>

            <%= for tech <- filtered_technologies(@technologies, @selected_category) do %>
              <button
                phx-click="select_tech"
                phx-value-id={tech.id}
                phx-target={@myself}
                class={"rounded-full px-3 py-1 text-xs transition-all duration-200 cursor-pointer #{if @selected_tech == tech.id, do: "bg-indigo-500 text-white font-medium", else: "bg-indigo-50 text-indigo-500 dark:bg-indigo-500/10 dark:text-indigo-400"}"}
              >
                {tech.name}
              </button>
            <% end %>
          </div>
        </div>

        <%!-- Jobs list --%>
        <div class="flex flex-col gap-6">
          <%= for {job, idx} <- Enum.with_index(@filtered_jobs) do %>
            <div class={"bg-white dark:bg-[#161B27] rounded-2xl shadow-[0_4px_20px_rgba(15,23,42,0.04)] border-l-4 p-5 sm:p-7 flex flex-col gap-5 animate-fade-in-up #{if rem(idx, 2) == 0, do: "border-l-indigo-500 dark:border-l-indigo-400", else: "border-l-purple-500 dark:border-l-purple-400"}"}>
              <%!-- Job header --%>
              <div class="flex flex-col sm:flex-row sm:justify-between sm:items-start gap-3">
                <div class="flex flex-col gap-1.5">
                  <h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100">
                    {job.company_name}
                  </h3>
                  <span class="inline-flex w-fit bg-slate-100 dark:bg-slate-800 rounded-full px-3 py-1 text-xs font-mono text-slate-500 dark:text-slate-400">
                    {format_job_date(job.start_date)} — {format_job_date(job.end_date)}
                  </span>
                </div>

                <%= if job.link do %>
                  <a
                    href={job.link}
                    target="_blank"
                    rel="noopener noreferrer"
                    class="inline-flex items-center gap-1.5 rounded-lg bg-slate-50 dark:bg-[#0D1117] border border-slate-200 dark:border-slate-800 px-3.5 py-2 text-[13px] font-medium text-slate-600 dark:text-slate-400 hover:border-slate-400 transition-colors w-fit"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="14"
                      height="14"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    >
                      <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                      <polyline points="15 3 21 3 21 9"></polyline>
                      <line x1="10" y1="14" x2="21" y2="3"></line>
                    </svg>
                    Visit
                  </a>
                <% end %>
              </div>

              <%!-- Job description --%>
              <p class="text-sm text-slate-500 dark:text-slate-400">
                {job.description}
              </p>

              <%!-- Projects --%>
              <%= if job.projects != [] do %>
                <span class="text-[10px] font-semibold tracking-[2px] text-slate-400 uppercase">
                  PROJECTS
                </span>

                <div class="flex flex-col gap-3">
                  <%= for project <- job.projects do %>
                    <details class="group bg-slate-50 dark:bg-[#0D1117] rounded-[10px] border border-slate-100 dark:border-slate-800 overflow-hidden">
                      <summary class="flex justify-between items-center cursor-pointer p-4">
                        <span class="text-sm font-semibold text-slate-700 dark:text-slate-300">
                          {project.name}
                        </span>
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          width="16"
                          height="16"
                          viewBox="0 0 24 24"
                          fill="none"
                          stroke="currentColor"
                          stroke-width="2"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          class="text-slate-400 shrink-0 transition-transform duration-200 group-open:rotate-90"
                        >
                          <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                      </summary>

                      <div class="px-4 pb-4 flex flex-col gap-2.5 animate-fade-in">
                        <p class="text-[13px] text-slate-500 dark:text-slate-400">
                          {Phoenix.HTML.raw(project.description)}
                        </p>

                        <div class="flex flex-wrap gap-2">
                          <%= for pt <- project.project_technologies do %>
                            <% tech = pt.technology %>
                            <span class="inline-flex items-center gap-2 bg-indigo-50 dark:bg-indigo-500/10 text-indigo-500 dark:text-indigo-400 rounded-md px-3 py-1.5 text-sm">
                              <%= if tech.icon_link do %>
                                <img src={tech.icon_link} class="w-5 h-5" alt={tech.name} />
                              <% end %>
                              {tech.name}
                            </span>
                          <% end %>
                        </div>

                        <%= if project.link != nil and project.link != "" do %>
                          <a
                            href={project.link}
                            target="_blank"
                            rel="noopener noreferrer"
                            class="inline-flex items-center gap-1 mt-4 text-xs font-medium text-indigo-500 hover:text-indigo-600 transition-colors w-fit"
                          >
                            View Project →
                          </a>
                        <% end %>
                      </div>
                    </details>
                  <% end %>
                </div>
              <% end %>
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

  defp format_job_date(nil), do: "Present"

  defp format_job_date(date) do
    months = ~w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
    "#{Enum.at(months, date.month - 1)} #{date.year}"
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
