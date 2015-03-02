class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  # before_action :user, except: [:show]

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo}
      else
        format.html { render 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :created, location: @todo}
      else
        format.html { render 'edit' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_row_order
    @todo = Todo.find(todo_params[:todo_id])
    @todo.row_order_position = todo_params[:row_order_position]
    @todo.save

    render nothing: true
  end

  def edit
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index
    @todos = Todo.rank(:row_order).all
  end

  def show
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:todo_id, :text, :complete, :row_order_position,
                                 :due_on, :user_id)
    end
end
