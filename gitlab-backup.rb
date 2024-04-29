require 'net/ssh'
require 'net/scp'

# Ejemplo de uso del script
# server_name = 'gitlab.local'
# backup_path = '~/projects'

def gitlab_backup(server_name, backup_path)
  begin
    # Establecer conexión SSH utilizando autenticación con clave
    Net::SSH.start(server_name, nil, keys: ['~/.ssh'], keys_only: true) do |ssh|
      # Ejecutar el comando de backup de GitLab
      puts "Iniciando el backup de GitLab..."
      ssh.exec!("sudo gitlab-backup create")
      puts "Backup completado."

      # Listar los archivos en el directorio de backup para encontrar el más reciente
      backups = ssh.exec!("ls -t /var/opt/gitlab/backups").split
      latest_backup = backups.first  # Asumiendo que el primer archivo es el más reciente

      if latest_backup
        # Cambiar permisos del archivo para permitir la lectura por otros usuarios
        ssh.exec!("sudo chmod 644 /var/opt/gitlab/backups/#{latest_backup}")
        puts "Permisos del archivo de backup cambiados."

        # Copiar el archivo de backup al path local especificado
        ssh.scp.download!("/var/opt/gitlab/backups/#{latest_backup}", backup_path)
        puts "Backup copiado a #{backup_path}."
      else
        puts "No se encontró ningún archivo de backup."
      end
    end
  rescue Net::SSH::AuthenticationFailed
    puts "Autenticación fallida."
  rescue => e
    puts "Ocurrió un error: #{e.message}"
  end
end

if ARGV.length != 2
  puts "Uso: ruby script.rb <nombre_del_servidor> <ruta_del_backup>"
  exit
end

server_name = ARGV[0]
backup_path = ARGV[1]

gitlab_backup(server_name, backup_path)
