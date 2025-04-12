class ContactsController < ApplicationController
  def new
    @contact = {}
  end

  def create
    # Aqui você pode implementar envio de e-mail ou salvar em banco
    @contact = params.require(:contact).permit(:nome, :email, :mensagem)

    # Simula sucesso (ajustável futuramente)
    respond_to do |format|
      format.html { redirect_to new_contact_path, notice: "Mensagem enviada com sucesso!" }
      format.json { render json: { success: true, dados: @contact } }
    end
  end
end
