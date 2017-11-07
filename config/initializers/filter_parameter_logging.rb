# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:pass]
Rails.application.config.filter_parameters += [:ter_pass]

class ActionController::Parameters
  def filtered
    ActionDispatch::Http::ParameterFilter.new(Rails.application.config.filter_parameters).filter(self)
  end
end
