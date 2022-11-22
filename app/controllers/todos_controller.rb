class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)
    if @todo.due_date < Date.today
        flash[:notice]=0
        render 'new'
    elsif @todo.save
        flash[:notice]=1
        redirect_to @todo
    else
        render :new, status: :unprocessable_entity
    end

    
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    if @todo.update(todo_params)
        flash[:notice]=1
        redirect_to @todo
    else
        render :edit, status: :unprocessable_entity
    end
  
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :description, :due_date, :priority)
    end
end
