class AuditsController < ApplicationController
  
  require_role "admin"
  
  def index
    @audits = Audit.all(:order => "created_at desc", :limit => 50)
  end
  
  # Retrieve the audit details for a domain
  def domain
    @domain = Domain.find( 
      params[:id], 
      :user => current_user
    )
  end
  
end
