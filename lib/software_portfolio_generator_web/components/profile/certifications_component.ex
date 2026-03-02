defmodule CertificationsComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="space-y-4">
      <h2 class="text-2xl font-bold">Certifications</h2>

      <%= if Enum.empty?(@profile.certifications) do %>
        <p class="text-gray-600">No certifications listed.</p>
      <% else %>
        <ul class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 p-0 m-0 list-none">
          <%= for cert <- @profile.certifications do %>
            <li class="flex items-start gap-4 bg-white/50 p-4 rounded-lg border border-gray-100">
              <div class="min-w-0">
                <a
                  href={cert.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-blue-600 font-semibold hover:underline"
                >
                  <span class="block truncate">{cert.name}</span>
                  <span class="text-sm text-gray-500">{cert.issuer} · {cert.end_date}</span>
                </a>

                <p class="mt-2 text-gray-700 text-sm">{cert.description}</p>
              </div>
            </li>
          <% end %>
        </ul>
      <% end %>
    </div>
    """
  end
end
