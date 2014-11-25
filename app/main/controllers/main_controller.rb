require 'lifx'

class MainController < Volt::ModelController
  def index
    client = LIFX::Client.lan                  # Talk to bulbs on the LAN
    client.discover! do |c|                    # Discover lights. Blocks until a light with the label 'Office' is found
      c.lights.with_label('Soffan')
    end
  end

  def about
    # Add code for when the about view is loaded
  end

  private

  # the main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end
end
