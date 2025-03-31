#!/bin/bash

# Verificar si el contenedor está corriendo
if docker ps | grep -q "app-contenerizada"; then
  echo "✅ La aplicación está corriendo correctamente."
  exit 0
else
  echo "❌ Error: La aplicación no está en ejecución."
  exit 1
fi
