defmodule SocialNetworksComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <section class="w-full bg-white dark:bg-[#161B27] py-24 my-12">
      <div class="flex flex-col items-center justify-center gap-12 max-w-7xl mx-auto px-6 sm:px-8 my-12">
        <div class="flex flex-col items-center gap-3 text-center">
          <h1 class="text-4xl sm:text-[52px] font-bold text-orange-500 dark:text-violet-400 leading-tight">
            Connect With Me
          </h1>
          <p class="text-lg text-slate-400">
            Click any button to visit my social platforms
          </p>
        </div>

        <div class="flex flex-wrap items-center justify-center gap-4">
          <%= for sn <- @profile.social_networks do %>
            <a
              href={sn.link}
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center gap-2.5 bg-slate-50 dark:bg-[#161B27] rounded-xl border border-slate-200 dark:border-slate-800 py-3.5 px-6 hover:scale-105 transition-transform"
            >
              <img src={sn.icon_link} alt={sn.label} class="w-5 h-5" />
              <span class="text-[15px] font-medium text-slate-700 dark:text-slate-300">
                {sn.label}
              </span>
            </a>
          <% end %>
        </div>

        <span class="text-sm text-slate-300">
          • It will be a pleasure to work with you!
        </span>
      </div>
    </section>
    """
  end
end
