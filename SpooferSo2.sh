echo -e "\033[95mCódigo Ajustado pelo fla\033[0m"
echo "Configurando o Termux..."

# Atualiza pacotes e instala curl
if pkg update -y && pkg install curl -y; then
    echo "Pacotes atualizados e curl instalado com sucesso."
else
    echo "Erro ao atualizar pacotes ou instalar curl." >&2
    exit 1  # Encerra se essa etapa falhar
fi

# Solicita permissão de armazenamento
if termux-setup-storage; then
    echo "Permissões de armazenamento concedidas."
    echo "Armazenamento ativado. Continuando com o script principal..."
else
    echo "Erro ao configurar permissões de armazenamento." >&2
    exit 1  # Encerra o script se essa etapa falhar
fi
sleep 2
clear

# Prossegue com o script
echo "Começando em 10 segundos..."
sleep 10

# Gera um novo UUID para o android_id
UUID=$(cat /proc/sys/kernel/random/uuid)
echo "UUID gerado: $UUID"

# Tenta inserir o novo android_id
if su -c "content delete --uri content://settings/secure --where \"name='android_id'\""; then
    echo "android_id anterior removido com sucesso."
else
    echo "Erro ao remover o android_id anterior." >&2
fi

if su -c "content insert --uri content://settings/secure --bind name:s:android_id --bind value:s:$UUID"; then
    echo "Novo android_id inserido com sucesso."
else
    echo "Erro ao inserir o novo android_id." >&2
fi

# Contagem
echo "Espere 5 segundos"
for i in {5..1}; do
    echo "$i"
    sleep 1
done
clear

# Limpeza de dados
echo "Limpando dados de aplicativos..."
if su -c "pm clear com.google.android.gsf" && su -c "pm clear com.google.android.gms" && su -c "pm clear com.axlebolt.standoff2"; then
    echo "Limpeza concluída com sucesso."
else
    echo "Erro ao limpar dados dos aplicativos." >&2
fi

# Abre o Discord no navegador padrão
echo "Abrindo o Link do Discord..."
if am start -a android.intent.action.VIEW -d "https://discord.com/"; then
    echo "Link aberto."
else
    echo "Erro ao abrir o Link." >&2
fi

# Reinicialização com contagem regressiva
echo "Reiniciando em..."
for i in {3..1}; do
    echo "$i"
    sleep 1
done

# Reinicializa o dispositivo
if su -c "reboot"; then
    echo "Reinicialização iniciada."
else
    echo "Erro ao reiniciar o dispositivo, talvez você não possui Root." >&2
fi
