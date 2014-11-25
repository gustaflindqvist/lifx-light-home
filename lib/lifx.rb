# client = LIFX::Client.lan                  # Talk to bulbs on the LAN
# client.discover! do |c|                    # Discover lights. Blocks until a light with the label 'Office' is found
#   c.lights.with_label('Office')
# end
#                                            # Blocks for a default of 10 seconds or until a light is found
# client.lights.turn_on                      # Tell all lights to turn on
# light = client.lights.with_label('Office') # Get light with label 'Office'

# # Set the Office light to pale green over 5 seconds
# green = LIFX::Color.green(saturation: 0.5)
# light.set_color(green, duration: 5)        # Light#set_color is asynchronous

# sleep 5                                    # Wait for light to finish changing
# light.set_label('My Office')

# light.add_tag('Offices')                   # Add tag to light

# client.lights.with_tag('Offices').turn_off

# client.flush


# # require 'lifx'

# class Lifx
#   def initialize(args)
#     label = ARGV[0]
#     time = ARVG[1] ||= 120
#     client = LIFX::Client.lan
#   end

#   def discover label
#     client.discover! do |c|
#         c.lights.with_label(label)
#     end
#   end

#   def turn_on_light
#     client.lights.turn_on
#     light = client.lights.with_label(label)
#   end

#   def sunrise_light
#     fade_time = time # time in seconds
#     interval = 6 # run every 6 seconds
#     increment = fade_time/interval
#     luminence = 0.01
#     luminence_increment = 1/increment.to_f
#     hue_increment = 60/increment # Fade from red to bright yellow 0 to 60
#     hue = hue_increment

#     light.set_color(LIFX::Color.hsl(0, 1, luminence), duration: interval)

#     sunrise = set_interval(interval) do
#       if luminence >= 1
#           sunrise.kill
#       end

#       light.set_color(LIFX::Color.hsl(hue, 1, luminence), duration: interval)
#       luminence = luminence + luminence_increment
#       hue = hue + hue_increment
#     end

#     sunrise.join
#   end

#   def client_flush
#     client.flush
#   end

#   private

#   def set_interval(delay)
#       Thread.new do
#           loop do
#               sleep delay
#               yield
#           end
#       end
#   end
# end
