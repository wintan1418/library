class BookController < ApplicationController
    def list
        @books = Book.all 
    end
    
    def show
        @book = Books.find(params[ :id])
    end
    
    def new
        @book = Books.new
        @subjects = Subjects.all
    end
    
    def create
        @book = Book.new(book_params)

        if @book.save
            redirect_to :action => 'list'
        else
            @subjects = Subject.all
            redirect_to :action => 'new'
        end

    end

    def book_params
        params.require(:books).permit(:title, :price, subject_id, :description)
    end
    
    def edit
        @books = Books.find(params[:id])
        @subjects = Subject.all
    end
    
    def update
        @books = Book.find(params[:id])

        if @book.update_attributes(book_param)
            redirect_to :action => @book
        else
            @subjects = Subject.all
            render :action => 'edit'
    end
    
    def delete
        Book.find(params[:id]).destroy
        redirect_to :action => 'list'
     end
     
     def show_subjects
        @subject = Subject.find(params[:id])
     end
  

end
