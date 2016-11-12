class BookController < ApplicationController
 before_action :authenticate_user!  

    layout 'standard'
   
  
    
   def new 
       
       @book = Book.new
       @subjects = Subject.all
       
    end
    
     def create
        @book = Book.new(book_params)
	
        if @book.save
            
          redirect_to :action => 'list'
          flash[:notice]="#{@book.title} Book Successfuly Added."
        else
          @subjects = Subject.all
         render :action => 'new'
        end
   
    end

    def book_params
        
      params.require(:books).permit(:title, :price, :subject_id, :description) 
   end
    
    def list
        
        @books  = Book.all.paginate(:page => params[:page], :per_page => 5)
        
    end
    
    def show 
        
        @book = Book.find(params[:id])
        
    end 
    
    def edit
        
        @book = Book.find(params[:id])
        @subjects = Subject.all
        
    end 
    
   
    
    def update
   @book = Book.find(params[:id])
	
   if @book.update_attributes(book_param)
       flash[:notice]="#{@book.title} Book Updated."
      redirect_to :action => 'show', :id => @book
   else
      @subjects = Subject.all
      render :action => 'edit'
   end
   
    end

    def book_param
     params.require(:book).permit(:title, :price, :subject_id, :description) 
    end
    
    def delete
    flash[:notice]=" Book Deleted."

       Book.find(params[:id]).destroy

       redirect_to :action => 'list'
        
    end 
    
    def show_subjects
    
    @subject = Subject.find(params[:id])
    end
    
end
