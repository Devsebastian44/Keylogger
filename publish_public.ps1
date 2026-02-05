# publish_public.ps1
# Script para sincronizar el trabajo de 'main' (Lab) al Portafolio Público (GitHub)

Write-Host "[*] Iniciando sincronización de Portafolio..." -ForegroundColor Cyan

# 1. Asegurar que estamos en main y todo está guardado
$status = git status --porcelain
if ($status) {
    Write-Error "Error: Tienes cambios sin guardar en 'main'. Haz commit antes de publicar."
    exit
}

Write-Host "[*] Subiendo todo a GitLab (Privado)..."
git push gitlab main

# 2. Cambiar a la rama pública
Write-Host "[*] Preparando rama 'public'..."
git checkout public

# 3. Fusionar cambios de main
git merge main --no-edit

# 4. Limpieza de seguridad técnica (Eliminar archivos que no pertenecen a GitHub)
Write-Host "[*] Aplicando filtros de seguridad..." -ForegroundColor Yellow
git rm -r --cached tests/ 2>$null
git rm --cached .gitlab-ci.yml 2>$null
git rm --cached src/core/engine.py 2>$null

# 5. Confirmar limpieza y subir
git add .
git commit -m "docs: release update to public portfolio" --allow-empty
Write-Host "[*] Subiendo a GitHub (Público)..." -ForegroundColor Green
git push origin public:main --force

# 6. Volver al laboratorio
Write-Host "[*] Volviendo a la rama 'main' (Lab)..."
git checkout main

Write-Host "[🎉] ¡Portafolio actualizado con éxito!" -ForegroundColor Green
