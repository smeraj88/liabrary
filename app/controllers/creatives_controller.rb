class CreativesController < ApplicationController
before_action :authenticate_user! 

layout "creative"

#book and subject details action
  def index
    #@subject = Subject.all
    #@book = Book.all
  end
  
  
    
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
    
      params.require(:book).permit(:title, :price, :subject_id, :description) 
   
   end
    
    def list
        
        @books  = Book.paginate(:page => params[:page], :per_page => 5)
        
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
    
  
  #student deatils actions
  
  def fy_student_index
      @fy_students = FirstYearStudent.paginate(:page=>params[:page],:per_page=>5)
    end      
  
  def new_fy_student
      @fy_student = FirstYearStudent.new
                        
    end
    
    def create_fy_student
       @fy_student = FirstYearStudent.new(fy_student_params) 
       if @fy_student.save
           redirect_to :action=>'fy_student_index'
           flash[:notice] = "Student Added):"
       else
          redirect_to :action=>'new_fy_student' 
          flash[:alert]="Student Does Not Created!!!"
       end
    end
    
    def edit_fy_student
       @fy_student = FirstYearStudent.find(params[:id]) 
    end

    def update_fy_student
     @fy_student = FirstYearStudent.find(params[:id]) 
       if @fy_student.update_attributes(fy_student_param)
           flash[:notice] = "#{@fy_student.stud_name } Upadted."
           redirect_to :action=>'fy_student_index'
        elsif 
           flash[:alert] = " #{@fy_student.stud_name }does not Upadted."   
           redirect_to :action=>'fy_student_index'

        end       
    end
    
    def delete_fy_student
    
       @fy_student = FirstYearStudent.find(params[:id]).destroy
       flash[:notice] = "Student data deleted."
       redirect_to :action=>"fy_student_index"
    end
    
    def fy_student_params
        params.require(:first_year_student).permit(:stud_name,:year,:book_name,:book_count)
    end
    
    def fy_student_param
        params.require(:first_year_student).permit(:stud_name,:year,:book_name,:book_count)
    end
    
    
    
end
