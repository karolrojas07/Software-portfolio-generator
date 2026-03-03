defmodule CertificationsComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="w-full my-4">
      <h2 class="text-center text-4xl font-bold mb-4">Certifications</h2>

      <%= if Enum.empty?(@profile.certifications) do %>
        <p class="text-center text-gray-600 my-4">No certifications listed.</p>
      <% else %>
        <ul class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 p-0 m-0 list-none">
          <%= for cert <- @profile.certifications do %>
            <li class="w-full gap-4 bg-white/50 p-4 rounded-lg border border-gray-100">
              <div class="flex w-full">
                <div class="min-w-0 w-4/5">
                  <span class="block  font-medium text-gray-900">{cert.name}</span>
                  <span class="text-sm text-gray-500">{cert.issuer} · {format_date(cert.end_date)}</span>

                  <p class="mt-2 text-gray-700 text-sm">{cert.description}</p>
                </div>
                <%= if String.length(cert.link) > 0 do %>
                  <div class="flex w-1/5 items-center justify-center">
                    <a class="w-6 h-6 hover:text-blue-500 hover:font-bold" href={cert.link} target="_blank" rel="noopener noreferrer">
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="size-6">
                        <path strokeLinecap="round" strokeLinejoin="round" d="M13.5 6H5.25A2.25 2.25 0 0 0 3 8.25v10.5A2.25 2.25 0 0 0 5.25 21h10.5A2.25 2.25 0 0 0 18 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25" />
                      </svg>
                    </a>
                  </div>
                <% end %>
              </div>
            </li>
          <% end %>
        </ul>
      <% end %>
    </div>
    """
  end

  defp format_date(nil), do: ""
  defp format_date(date) do
    "#{date.month}/#{date.day}/#{date.year}"
  end
end
