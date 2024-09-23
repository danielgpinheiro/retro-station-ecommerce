defmodule RetroStationWeb.Shared.Header.HeaderComponent do
  use RetroStationWeb, :live_component

  def render(assigns) do
    ~H"""
    <header class="w-full h-24 bg-[#f9f9f9] border-b-[1px] border-b-[#ccc]">
      <div class="w-[1180px] h-full flex flex py-2 mx-auto">
        <div class="flex flex-col shrink-0">
          <img src="/images/logo_and_title.svg" class="w-28 shrink-0 mr-12 mb-[4px]" alt="logo" />

          <div class="h-full p-[2px]">
            <%= if !@user_location do %>
              <button class="text-left pl-8 relative">
                <.icon name="hero-map-pin" class="text-gray-600 absolute top-0 left-0" />

                <small class="text-gray-500">Informe seu</small>
                <br />
                <span class="text-gray-800">CEP</span>
              </button>
            <% else %>
              <button class="text-left pl-8 relative">
                <.icon name="hero-map-pin" class="text-gray-600 absolute top-0 left-0" />

                <small class="text-gray-500">Enviar para Daniel</small>
                <br />
                <span class="text-gray-800">Avenida Italia 610</span>
              </button>
            <% end %>
          </div>
        </div>

        <div class="grid grid-cols-2 grid-rows-2 gap-4 m-auto">
          <form class="w-[580px] h-10 relative">
            <input
              placeholder="Busque por produtos aqui"
              class="w-full h-full rounded-sm shadow pl-4 pr-12"
            />

            <button class="absolute top-[calc(50%-12px)] right-2 flex">
              <div class="w-[1px] bg-red-500 mr-2 bg-gray-300" />

              <.icon name="hero-magnifying-glass" class="text-gray-400" />
            </button>
          </form>

          <nav class="flex row-start-2">
            <ul class="flex shrink-0">
              <li class="pr-4">Lorem 1</li>
              <li class="pr-4">Lorem 2</li>
              <li class="pr-4">Lorem 3</li>
              <li class="pr-4">Lorem 4</li>
              <li class="pr-4">Lorem 5</li>
              <li class="pr-4">Lorem 6</li>
              <li class="pr-4">Lorem 7</li>
              <li class="pr-4">Lorem 8</li>
            </ul>
          </nav>

          <div class="row-start-2 flex justify-end">
            usuario logado/entre aqui
            <button>
              botao para carrinho
            </button>
          </div>
        </div>
      </div>
    </header>
    """
  end

  def mount(socket) do
    {:ok, socket |> assign(user_location: false)}
  end
end
