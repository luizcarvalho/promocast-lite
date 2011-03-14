class OuvintesController < ApplicationController
  # GET /ouvintes
  # GET /ouvintes.xml
  def index
      @search = Ouvinte.search(params[:search])
      @ouvintes = @search.all.paginate(:page => params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ouvintes }
    end
  end

  # GET /ouvintes/1
  # GET /ouvintes/1.xml
  def show
    @ouvinte = Ouvinte.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ouvinte }
    end
  end

  # GET /ouvintes/new
  # GET /ouvintes/new.xml
  def new
    @ouvinte = Ouvinte.new
    @promocoes = Promocao.find_all_by_ativo(true).collect{|promocao| "<option value='#{promocao.id}'>#{promocao.titulo}</option>"}
    #@promocoes = Promocao.find_all_by_ativo(true).collect{|promocao| [promocao.titulo,promocao.id]}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ouvinte }
    end
  end

  # GET /ouvintes/1/edit
  def edit
    @ouvinte = Ouvinte.find(params[:id])
    @promocoes = Promocao.find_all_by_ativo(true).collect{|promocao| "<option #{"selected='selected'"if @ouvinte.promocoes.include?(promocao)} value='#{promocao.id}'>#{promocao.titulo}</option>"}
  end

  # POST /ouvintes
  # POST /ouvintes.xml
  def create
    @ouvinte = Ouvinte.new(params[:ouvinte])
    @promocoes = Promocao.find(params[:promocoes])
    @ouvinte.promocoes  = @promocoes
    #@ouvinte


    respond_to do |format|
      if @ouvinte.save
        format.html { redirect_to(@ouvinte, :notice => 'Ouvinte foi cadastrado com sucesso!') }
        format.xml  { render :xml => @ouvinte, :status => :created, :location => @ouvinte }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ouvinte.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ouvintes/1
  # PUT /ouvintes/1.xml
  def update
    @ouvinte = Ouvinte.find(params[:id])
    @promocoes = Promocao.find(params[:promocoes])
    @ouvinte.promocoes  = @promocoes
    respond_to do |format|
      if @ouvinte.update_attributes(params[:ouvinte])
        format.html { redirect_to(@ouvinte, :notice => 'Ouvinte foi atualizado com sucesso!') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ouvinte.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ouvintes/1
  # DELETE /ouvintes/1.xml
  def destroy
    @ouvinte = Ouvinte.find(params[:id])
    @ouvinte.destroy

    respond_to do |format|
      format.html { redirect_to(ouvintes_url) }
      format.xml  { head :ok }
    end
  end
end
