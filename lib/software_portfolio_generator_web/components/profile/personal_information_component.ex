defmodule PersonalInformationComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <section class="min-h-screen flex flex-col bg-slate-50 dark:bg-[#0D1117]">
      <div class="h-16"></div>

      <div class="flex-1 flex flex-col items-center justify-center px-6 sm:px-16 pb-20 gap-12">
        <div class="flex flex-col items-center gap-2.5 text-center">
          <span class="text-xs font-semibold tracking-[3px] text-slate-400 uppercase">
            LOOKING FOR
          </span>
          <h1 class="text-3xl sm:text-5xl lg:text-[52px] font-bold text-slate-900 dark:text-slate-100 leading-tight">
            {safe(@profile.title)}
          </h1>
          <p class="text-lg text-slate-400">Let's get acquainted.</p>
        </div>

        <div class="w-full max-w-[760px] bg-white dark:bg-[#161B27] rounded-2xl border border-slate-200 dark:border-slate-800 shadow-[0_8px_40px_rgba(15,23,42,0.08)] p-6 sm:p-9 flex flex-col gap-6">
          <h2 class="text-xl sm:text-[22px] font-semibold text-slate-900 dark:text-slate-100">
            Hello There! — I'm {safe(@profile.firstname)} {safe(@profile.lastname)}
          </h2>

          <div class="flex flex-col sm:flex-row gap-8">
            <div class="flex-1 flex flex-col gap-4">
              <.info_row label="AGE" value={format_age(@profile.birthdate)} />
              <.info_row label="EMAIL" value={safe(@profile.email)} />
              <.info_row
                label="LOCATION"
                value={"#{safe(@profile.city)}, #{safe(@profile.state)} #{safe(@profile.zipcode)}"}
              />
            </div>
            <div class="flex-1 flex flex-col gap-4">
              <.info_row label="COUNTRY" value={safe(@profile.country)} />
              <.info_row
                label="LANGUAGES"
                value={
                  safe(
                    @profile.profile_languages
                    |> Enum.map(& &1.language.name)
                    |> Enum.join(", ")
                  )
                }
              />
              <.info_row label="PHONE" value={safe(@profile.phone_number)} />
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  defp info_row(assigns) do
    ~H"""
    <div class="flex flex-col gap-[3px]">
      <span class="text-[10px] font-semibold tracking-[2px] text-slate-400">{@label}</span>
      <span class="text-sm text-slate-700 dark:text-slate-300">{@value}</span>
    </div>
    """
  end

  defp format_age(nil), do: ""

  defp format_age(date) do
    now = Date.utc_today()
    age = now.year - date.year

    age =
      if now.month < date.month || (now.month == date.month && now.day < date.day),
        do: age - 1,
        else: age

    "#{age} years old"
  end

  defp safe(nil), do: ""
  defp safe(value), do: value
end
