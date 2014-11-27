require 'lifx'

module Light
  class LifxControl
    def initialize label=nil
      @label = label
      @client = LIFX::Client.lan
      @light = nil
    end

    def discover
      begin
        @client.discover! do |c|
          c.lights.with_label(@label)
        end
      rescue LIFX::Client::DiscoveryTimeout
        return "Could not find any LIFX devices."
      end
      # Blocks for a default of 10 seconds or until a light is found
    end

    def status index
      discover
      light = @client.lights.with_label(@label)
      $page.store._settings[index.or(0).to_i]._power = light.power
      client_flush
    end

    def turn_on
      discover
      light = @client.lights.with_label(@label).turn_on
      $page.store._setting._power = light.power
    end

    def turn_off
      discover
      light = @client.lights.with_label(@label).turn_off
      $page.store._setting._power = light.power
    end

    def light_color_hue hue=0, luminence=0.01
      discover
      light = @client.lights.with_label(@label)
      $page.store._setting._power = light.power
      interval = 6 # run every 6 seconds
      light.set_color(LIFX::Color.hsl(hue, 1, luminence), duration: interval) if light
    end

    def sunrise_light fade_time
      interval = 6 # run every 6 seconds
      increment = fade_time/interval
      luminence = 0.01
      luminence_increment = 1/increment.to_f
      hue_increment = 60/increment # Fade from red to bright yellow 0 to 60
      hue = hue_increment
      discover
      @client.lights.with_label(@label).turn_on
      light = @client.lights.with_label(@label)
      $page.store._setting._power = light.power

      light.set_color(LIFX::Color.hsl(0, 1, luminence), duration: interval)

      sunrise = set_interval(interval) do
        if luminence >= 1
            sunrise.kill
        end

        light.set_color(LIFX::Color.hsl(hue, 1, luminence), duration: interval)
        luminence = luminence + luminence_increment
        hue = hue + hue_increment
      end

      sunrise.join
    end

    def client_flush
      @client.flush
    end

    private

    def set_interval(delay)
        Thread.new do
            loop do
                sleep delay
                yield
            end
        end
    end
  end
end
