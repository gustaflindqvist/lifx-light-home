class LightController < Volt::ModelController
  reactive_accessor :_query

  def settings
    self.model = :store
  end

  def get_current_status label
    light = Light::LifxControl.new(label)
    light.status(params._index.or(0).to_i)
  end

  def current_setting
    _settings[params._index.or(0).to_i]
  end

  def add_setting
    self._settings << page._new_setting
    page._new_setting = {}
  end
end
