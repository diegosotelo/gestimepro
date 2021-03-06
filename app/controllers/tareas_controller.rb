class TareasController < ApplicationController
  # GET /tareas
  # GET /tareas.json
  def index
    @tareas = Tarea.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tareas }
    end
  end

  # GET /tareas/1
  # GET /tareas/1.json
  def show
    @tarea = Tarea.find(params[:id])
    print @tarea.user.nombre

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tarea }
    end
  end

  # GET /tareas/new
  # GET /tareas/new.json
  def new
    @tarea = Tarea.new
    @proyectos = Proyecto.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tarea }
    end
  end

  # GET /tareas/1/edit
  def edit
    @tarea = Tarea.find(params[:id])
    print @tarea.hora_inicio
    @proyectos = Proyecto.all
  end

  # POST /tareas
  # POST /tareas.json
  def create
    @tarea = Tarea.new(params[:tarea])
    @tarea.user_id = session[:user_id]
    print @tarea.hora_termino


    if @tarea.save
      redirect_to @tarea, notice: 'Tarea was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /tareas/1
  # PUT /tareas/1.json
  def update
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      if @tarea.update_attributes(params[:tarea])
        format.html { redirect_to @tarea, notice: 'Tarea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareas/1
  # DELETE /tareas/1.json
  def destroy
    @tarea = Tarea.find(params[:id])
    @tarea.destroy

    respond_to do |format|
      format.html { redirect_to tareas_url }
      format.json { head :no_content }
    end
  end
end
