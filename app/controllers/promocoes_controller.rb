class PromocoesController < ApplicationController
before_filter :load_programas,:only=>[:edit,:new]

  def load_programas
    @programas = Programa.find_all_by_status(true).collect{|promocao| [promocao.nome,promocao.id]}
  end
  # GET /promocoes
  # GET /promocoes.xml
  def index
      @search = Promocao.search(params[:search])
      @promocoes = @search.all.paginate(:page => params[:page])
      @sortear = params["sortear"]


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @promocoes }
    end
  end

  # GET /promocoes/1
  # GET /promocoes/1.xml
  def show
    @promocao = Promocao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @promocao }
    end
  end

  # GET /promocoes/new
  # GET /promocoes/new.xml
  def new
    @promocao = Promocao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @promocao }
    end
  end

  # GET /promocoes/1/edit
  def edit
    @promocao = Promocao.find(params[:id])
  end

  # POST /promocoes
  # POST /promocoes.xml
  def create
    @promocao = Promocao.new(params[:promocao])

    respond_to do |format|
      if @promocao.save
        format.html { redirect_to(@promocao, :notice => 'Promocção criada com sucesso!') }
        format.xml  { render :xml => @promocao, :status => :created, :location => @promocao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @promocao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /promocoes/1
  # PUT /promocoes/1.xml
  def update
    @promocao = Promocao.find(params[:id])

    respond_to do |format|
      if @promocao.update_attributes(params[:promocao])
        format.html { redirect_to(@promocao, :notice => 'Promoção aletrada com sucesso!') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @promocao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /promocoes/1
  # DELETE /promocoes/1.xml
  def destroy
    @promocao = Promocao.find(params[:id])
    @promocao.destroy

    respond_to do |format|
      format.html { redirect_to(promocoes_url) }
      format.xml  { head :ok }
    end
  end

def sorteio
  @promocao = Promocao.find(params[:id])
end

def sortear
  @promocao = Promocao.find params[:promocao][:id]
      respond_to do |format|
      if @promocao and @promocao.ativo
        @ouvinte = @promocao.ouvintes.sort_by{rand}.first
        format.html        
      else
        format.html { redirect_to "/promocoes?sortear=true", :error => "Promoção inválida, Escolha outra promoção" }
      end
    end
end


def finalizar
  ouvinte_promocao = OuvintePromocao.find_by_promocao_id(params[:promocao_id])
  ouvinte_promocao.ouvinte_id = params[:ouvinte_id]
  
  promocao = Promocao.find params[:promocao_id]
  promocao.ativo = false
  if promocao.save and ouvinte_promocao.save
   redirect_to "/promocoes?sortear=true", :notice => "Promoção finalizada com sucesso!"
  else
    redirect_to "/promocoes?sortear=true", :error => "Ocorreu um erro ao finalizar essa promoção"
  end
end




end
