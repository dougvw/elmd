class VolunteersController < ApplicationController
  # GET /volunteers
  # GET /volunteers.xml
  def index
    @volunteers = Volunteer.all(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @volunteers }
      format.csv do
          csv_string = FasterCSV.generate do |csv|          
            # header row
            header_row = Volunteer.column_names
            header_row.delete("id")
            #header_row.delete("token")
            csv << header_row
            # data rows
            @volunteers.each do |volunteer|
              csvRow = Array.new
              header_row.each do |field|
                unless (field == "id") #|| (field == "token")
                  csvRow << volunteer[field]
                end
              end           
              csv << csvRow
            end          
          end
            date = Date.today
            filename = "Volunteer_List_" + date.to_s + ".csv"
            # send it to the browsah
            send_data(csv_string,
            :type => 'text/csv; charset=iso-8859-1; header=present',
            :disposition => "attachment",
            :filename => filename)
        end # end format.csv
    end
  end

  # GET /volunteers/1
  # GET /volunteers/1.xml
  def show
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @volunteer }
    end
  end

  # GET /volunteers/new
  # GET /volunteers/new.xml
  def new
    @volunteer = Volunteer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @volunteer }
    end
  end

  # GET /volunteers/1/edit
  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  # POST /volunteers
  # POST /volunteers.xml
  def create
    @volunteer = Volunteer.new(params[:volunteer])

    respond_to do |format|
      if @volunteer.save
        flash[:notice] = 'Volunteer was successfully created.'
        format.html { redirect_to(@volunteer) }
        format.xml  { render :xml => @volunteer, :status => :created, :location => @volunteer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /volunteers/1
  # PUT /volunteers/1.xml
  def update
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      if @volunteer.update_attributes(params[:volunteer])
        flash[:notice] = 'Volunteer was successfully updated.'
        format.html { redirect_to(@volunteer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.xml
  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy

    respond_to do |format|
      format.html { redirect_to(volunteers_url) }
      format.xml  { head :ok }
    end
  end
end
