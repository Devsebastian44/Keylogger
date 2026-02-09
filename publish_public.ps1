# publish_public.ps1
# Script para sincronizar el trabajo de 'main' (Lab) al Portafolio Público (GitHub)

Write-Host "[*] Iniciando sincronización de Portafolio..." -ForegroundColor Cyan

# 1. Asegurar que estamos en main y todo está guardado
# Obtenemos la rama actual
$currentBranch = git rev-parse --abbrev-ref HEAD
if ($currentBranch -ne "main") {
    Write-Host "[!] No estás en la rama 'main'. Cambiando a 'main'..." -ForegroundColor Yellow
    git checkout main
}

$status = git status --porcelain
if ($status) {
    Write-Error "Error: Tienes cambios sin guardar en 'main'. Haz commit antes de publicar."
    exit
}

Write-Host "[*] Sincronizando con GitLab (Privado)..."
git pull gitlab main --rebase
git push gitlab main

# 2. Resetear la rama pública desde main (Para asegurar que el README y todo se actualice)
Write-Host "[*] Preparando rama 'public'..."
# Fuerza la creación/reseteo de 'public' para que sea idéntica a 'main'
git checkout -B public main

# 3. Limpieza de seguridad técnica (Archivos que NO van a GitHub)
Write-Host "[*] Aplicando filtros de seguridad..." -ForegroundColor Yellow

# Eliminar Tests y CI/CD
git rm -r --cached tests/ -f 2>$null
git rm --cached .gitlab-ci.yml -f 2>$null

# Eliminar Payload (Malware / Componentes sensibles)
git rm --cached src/core/engine.py -f 2>$null

# Eliminar este script de publicación del portafolio público
git rm --cached publish_public.ps1 -f 2>$null

# 4. Confirmar limpieza y subir
git commit -m "docs: release update to public portfolio" --allow-empty
Write-Host "[*] Subiendo a GitHub (Público)..." -ForegroundColor Green
# Actualizamos 'origin public' que ahora está linkeado a GitHub main
git push origin public:main --force


# 6. Volver al laboratorio
Write-Host "[*] Volviendo a la rama 'main' (Lab)..."
git clean -fd 2>$null
git checkout main -f

Write-Host "[🎉] ¡Portafolio actualizado con éxito!" -ForegroundColor Green
