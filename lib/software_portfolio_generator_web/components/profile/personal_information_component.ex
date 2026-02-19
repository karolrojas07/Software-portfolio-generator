defmodule PersonalInformationComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div>

      <section class="min-h-screen flex items-center justify-center px-6 dark:bg-gray-800 ">
        <div class="max-w-4xl w-full">
          <div class="text-center mb-8">
            <div class="text-2xl font-semibold">Looking for</div>
            <h1 class="text-5xl font-bold mt-2">{safe(@profile.title)}</h1>
            <p class="text-lg text-muted mt-4">Let's get acquainted.</p>
          </div>

          <div class="dark:bg-gray-500  bg-gray-200 p-6 rounded-lg shadow-sm">
            <h2 class="text-center text-2xl font-bold mb-4">Hello There! — I'm {safe(@profile.firstname)} {safe(@profile.lastname)}</h2>
            <dl class="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-2 text-sm">
              <div>
                <dt class="font-semibold">Age</dt>
                <dd>{calculate_age(@profile.birthdate)}</dd>
              </div>
              <div>
                <dt class="font-semibold">Email</dt>
                <dd>{safe(@profile.email)}</dd>
              </div>
              <div>
                <dt class="font-semibold">Location</dt>
                <dd>{safe(@profile.city)}, {safe(@profile.state)} {safe(@profile.zipcode)}</dd>
              </div>
              <div>
                <dt class="font-semibold">Country</dt>
                <dd>{safe(@profile.country)}</dd>
              </div>
              <div class="sm:col-span-2">
                <dt class="font-semibold">Phone</dt>
                <dd>{safe(@profile.phone_number)}</dd>
              </div>
            </dl>
          </div>
        </div>
      </section>
    </div>
    """
  end

  defp calculate_age(nil), do: ""
  defp calculate_age(date) do
    now = Date.utc_today()
    age = now.year - date.year

    if now.month < date.month || (now.month == date.month && now.day < date.day) do
      age - 1
    else
      age
    end
  end

  defp safe(nil), do: ""
  defp safe(value), do: value
end
