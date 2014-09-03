class ApplicationController < ActionController::API
  before_action :jsonify

private

  def current_user
    # Return the current user if we've already set one
    return @_current_user if @_current_user

    # Otherwise, look it up via api key sent in the AUTH_TOKEN header
    # Note: if this header isn't set, we should probably fall back on using the
    #   built in Devise auth handling
    # token = request.headers["HTTP_AUTH_TOKEN"]

    # Look up the key (raises 404 if not found, which isn't the _best_ way to handle that)
    # key = ApiKey.where(token: token).first!

    # Set the user for future calls (should be "= key.user" below here)
    @_current_user = User.find_by_id(1)
  end

  def render_invalid obj
    # Helper to send back an invalid object message with the right status code
    render json: { errors: obj.errors.full_messages }, status: 422
  end

  def jsonify
    # Coerce all requests into JSON format
    # Should probably only do this if the request format isn't already
    #   explicitly set
    request.format = :json
  end

end

# class ApplicationController < ActionController::Base
#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception
# end
