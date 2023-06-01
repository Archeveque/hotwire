class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    require 'faker'
    @email = Email.create(
      object: Faker::Books::Lovecraft.word,
      body: Faker::Books::Lovecraft.paragraph
    )
    link = @email.id
    redirect_to "/email/index"
  end

  def show
    @email = Email.find(params[:email_id])
    @email.update(read: true)
    @email.save
  end

  def destroy
    @email = Email.find(params[:email_id])
    @email.destroy
    redirect_to "/email/index"
  end

  def change
    Email.all.each do |email|
    @email = email
    if @email.read == true
      @email.update(read: false)
      @email.save
    else
      @email.update(read: true)
      @email.save
    end
  end
    change_state
  end


  def change_state
    render turbo_stream:
    turbo_stream.replace("email",
    partial: "email/change",)
  end

end