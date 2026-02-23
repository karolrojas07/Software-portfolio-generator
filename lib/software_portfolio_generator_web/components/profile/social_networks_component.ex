defmodule SocialNetworksComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="min-h-screen w-full flex items-center justify-center p-8">
      <div class="max-w-5xl w-full">
        <h1
          class="text-5xl md:text-6xl font-bold text-primary text-center mb-4"
        >
          Connect With Me
        </h1>
        <p
          class="text-xl text-secondary text-center mb-16"
        >
          Click any buttom to visit my social platforms
        </p>
        <div
          class="flex flex-wrap justify-center gap-6"
        >
          <%= for sn <- @profile.social_networks do %>
            <a
              href={sn.link}
              target="_blank"
              class="flex items-center gap-3 px-4 py-2 rounded-lg shadow-md transition-transform transform hover:scale-105 hover:outline-none hover:ring-4 hover:ring-yellow/50"
            >
              <img
                src={sn.icon_link}
                alt={sn.label}
                class="w-6 h-6"
              />
              <span
                class="text-secondary font-medium"
              >
                {sn.label}
              </span>
            </a>
          <% end %>
        </div>

        <div
          class="mt-16 text-center text-gray-400 text-sm"
        >
           • It will be a pleasure to work with you!
        </div>
      </div>
    </div>
    """
  end


end
