class RecipientsController < ApplicationController
  # GET /recipients
  # GET /recipients.xml
  def index
    @recipients = Recipient.all(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipients }
      format.csv do
          csv_string = FasterCSV.generate do |csv|          
            # header row
            header_row = Recipient.column_names
            header_row.delete("id")
            header_row.delete("token")
            csv << header_row
            # data rows
            @recipients.each do |recipient|
              csvRow = Array.new
              header_row.each do |field|
                unless (field == "id") || (field == "token")
                  csvRow << recipient[field]
                end
              end           
              csv << csvRow
            end          
          end
            date = Date.today
            filename = "Mailing_List_" + date.to_s + ".csv"
            # send it to the browsah
            send_data(csv_string,
            :type => 'text/csv; charset=iso-8859-1; header=present',
            :disposition => "attachment",
            :filename => filename)
        end # end format.csv
    end
  end

  # GET /recipients/1
  # GET /recipients/1.xml
  def show
    @recipient = Recipient.find_by_token(params[:id])
    unless @recipient
      flash[:error] = "Sorry - Your token is invalid!"
      redirect_to(:controller => "pages", :action => "index")
      return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipient }
    end
  end

  # GET /recipients/new
  # GET /recipients/new.xml
  def new
    @recipient = Recipient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipient }
    end
  end

  # GET /recipients/1/edit
  def edit
    @recipient = Recipient.find(params[:id])
  end

  # POST /recipients
  # POST /recipients.xml
  def create
    @recipient = Recipient.new(params[:recipient])

    respond_to do |format|
      if @recipient.save
        flash[:notice] = 'Your email address was added to our list. Thanks!'
        format.html { redirect_to(root_path) }
        format.xml  { render :xml => @recipient, :status => :created, :location => @recipient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipients/1
  # PUT /recipients/1.xml
  def update
    @recipient = Recipient.find(params[:id])

    respond_to do |format|
      if @recipient.update_attributes(params[:recipient])
        flash[:notice] = 'Recipient was successfully updated.'
        format.html { redirect_to(@recipient) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipients/1
  # DELETE /recipients/1.xml
  def destroy
   @recipient = Recipient.find_by_email(params[:form][:email])

    respond_to do |format|
      if @recipient.update_attributes(:active => false)
        flash[:notice] = "You are now off of the mailing list. Thanks."
        format.html { redirect_to(root_path) }
        format.xml  { head :ok }
      else
        flash[:error] = "Something went wrong, we couldn't take you off the list."
        format.html { redirect_to(root_path) }
        format.xml  { render :xml => "nono", :status => :unprocessable_entity }
      end
    end
  end
end
