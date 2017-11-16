class WelcomeController < ApplicationController

  def start
  end

  def upload
    if params[:wordlist]
      uploaded_io = params[:wordlist]
      File.open(
        Rails.root.join('public', 'uploads', uploaded_io.original_filename),
        'wb') do |file|
        file.write(uploaded_io.read)
      end
      file_processor(uploaded_io)
    else
      flash[:error] = 'Please upload your file before pressing submit'
      redirect_to welcome_start_path
    end
  end

  def finish
    @tree = Rails.cache.read("answer")
  end

  private

  def file_processor(uploaded_io)
    @file_path = "public/uploads/#{uploaded_io.original_filename}"
    word_processor = WordProcessor.new
    begin
      tree = word_processor.process_wordlist(@file_path)  
    rescue => e
      flash[:error] = 'Error: invalid file type. Please submit a file that contains a wordlist'
      redirect_to welcome_start_path and return
    end
    Rails.cache.write("answer", tree)
    redirect_to welcome_finish_path
  end
end
