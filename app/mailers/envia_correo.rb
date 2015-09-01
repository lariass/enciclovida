class EnviaCorreo < Devise::Mailer
  default from: 'noreply@conabio.gob.mx'

  # Metodos adicionales
  def excel(validacion)
    mail(:to => validacion.usuario.email, :subject => "Validacion de #{validacion.nombre_archivo}")

    validacion.enviado = 1
    validacion.fecha_envio = Time.now
    validacion.save
  end
end
