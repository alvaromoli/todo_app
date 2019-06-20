class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.completed = false
    if @todo.save
      redirect_to todos_path
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      redirect_to todos_path
    end
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    if @todo.save
      redirect_to todos_path
    end
  end

  def list
    @todos = Todo.all
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
