require "google/api_client"

class ResourcesController < ApplicationController
  before_action :authenticate

  def create
    @event = Event.find_by(id: params[:event_id])

    if @event && @event.user == @current_user
      @client = Google::APIClient.new(
        :application_name => 'Geophile',
        :application_version => '0.0.1'
      )

      @drive = @client.discovered_api('drive', 'v2')

      @client.authorization.access_token = @current_user.token

      result = @client.execute(
        # :access_token => @current_user.token,
        :api_method => @drive.files.get,
        :parameters => { 'fileId' => params[:file_id] }
      )

      if result.status == 200
        file = result.data

        resource = Resource.new

        resource.event = @event
        resource.file_id = params[:file_id]
        resource.name = file.title
        resource.mime_type = file.mime_type
        resource.size = file.file_size
        resource.url = file.web_content_link

        resource.save

        set_permissions(params[:file_id])
        download(file, resource)
      else
        puts "Error fetching file data"
      end
    end

    redirect_to event_path(@event)
  end

  def set_permissions(file_id)
    new_permission = @drive.permissions.insert.request_schema.new({
      'value' => '',
      'type' => 'anyone',
      'role' => 'reader'
    })

    result = @client.execute(
      :api_method => @drive.permissions.insert,
      :body_object => new_permission,
      :parameters => { 'fileId' => file_id })
  end

  def download(file, resource)
    if file.download_url
      res = @client.execute(:uri => file.download_url)

      if res.status == 200
        resource.data = res.body
        resource.save
      end
    end
  end
end
