defmodule CertificationsComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <section class="w-full bg-white dark:bg-[#161B27] py-20 my-12">
      <div class="flex flex-col items-center gap-12 max-w-7xl mx-auto px-6 sm:px-8">
        <div class="flex flex-col items-center gap-3">
          <h2 class="text-[38px] font-bold text-slate-900 dark:text-slate-100">Certifications</h2>
          <div class="w-14 h-1 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500"></div>
        </div>

        <%= if Enum.empty?(@profile.certifications) do %>
          <p class="text-center text-slate-500 dark:text-slate-400">No certifications listed.</p>
        <% else %>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5 w-full">
            <%= for cert <- @profile.certifications do %>
              <div class="bg-white dark:bg-[#161B27] rounded-xl border border-slate-200 dark:border-slate-800 p-6 flex flex-col gap-3">
                <div class="flex justify-between items-start">
                  <span class="text-[15px] font-semibold text-slate-900 dark:text-slate-100">
                    {cert.name}
                  </span>
                  <%= if cert.link != "" do %>
                    <a
                      href={cert.link}
                      target="_blank"
                      rel="noopener noreferrer"
                      class="text-slate-400 hover:text-indigo-500 transition-colors shrink-0 ml-2"
                    >
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
                      >
                        <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                        <polyline points="15 3 21 3 21 9"></polyline>
                        <line x1="10" y1="14" x2="21" y2="3"></line>
                      </svg>
                    </a>
                  <% end %>
                </div>
                <span class="text-[13px] text-slate-400">
                  {cert.issuer} · {format_date(cert.end_date)}
                </span>
                <p class="text-[13px] text-slate-600 dark:text-slate-400">{cert.description}</p>
              </div>
            <% end %>
          </div>
        <% end %>
      </div>
    </section>
    """
  end

  defp format_date(nil), do: ""

  defp format_date(date) do
    month = date.month |> Integer.to_string() |> String.pad_leading(2, "0")
    "#{month}/#{date.year}"
  end
end
