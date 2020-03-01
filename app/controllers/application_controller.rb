class ApplicationController < ActionController::Base
  def index
    @tasklists = Tasklist.all
  end

  def show
    @tasklist = Tasklist.find(params[:id])
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)

    if @tasklist.save
      flash[:success] = 'Tasklist が正常に追加されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist が追加されませんでした'
      render :new
    end
  end

  def edit
    @tasklist = Tasklist.find(params[:id])
  end

  def update
    @tasklist = Tasklist.find(params[:id])
    
    if @tasklist.save
      flash[:success] = 'Tasklist が正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist は更新されませんでした'
      render :edit
    end
  end

  def destroy
    
  end  
  
  private

  # Strong Parameter
  def tasklist_params
    params.require(:tasklist).permit(:content)
  end

    
end
