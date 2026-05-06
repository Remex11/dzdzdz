#!/usr/bin/env sh

set -eu

if command -v dotnet >/dev/null 2>&1; then
    echo "build: running dotnet build..."
    dotnet restore src/CalculatorApp/CalculatorApp.csproj --configfile NuGet.Config --nologo
    dotnet build src/CalculatorApp/CalculatorApp.csproj --no-restore --nologo
elif command -v make >/dev/null 2>&1; then
    echo "build: running make build..."
    make build
else
    echo "build: neither dotnet nor make was found. Install one build tool and try again." >&2
    exit 1
fi
echo "build: project build completed."
