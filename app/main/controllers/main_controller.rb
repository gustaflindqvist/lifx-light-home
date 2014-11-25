require 'lifx'

class MainController < Volt::ModelController
  def settings
    self.model = :store
  end

  def options
    return page._opts.to_s.or('').split(/,/)
  end

  def find_all_bulbs
    client = LIFX::Client.lan                  # Talk to bulbs on the LAN
    client.discover! do |c|                    # Discover lights. Blocks until a light with the label 'Office' is found
      c.lights.with_label('Soffan')
    end
  end

  def add_settings
    self._setting<< page._new_setting
    page._new_setting = {}
  end

  def collections
    # Create an empty item to test things with
    store._lightbulb.then do
      if store._lightbulb.size == 0
        store._lightbulb << {_name: '', _group: ''}
      end
    end
  end

  private

  # the main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end
end
