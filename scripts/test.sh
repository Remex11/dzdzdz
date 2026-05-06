#!/usr/bin/env sh

set -eu

if command -v dotnet >/dev/null 2>&1; then
    echo "tests: running fast .NET unit checks..."
    dotnet restore tests/CalculatorApp.Tests/CalculatorApp.Tests.csproj --configfile NuGet.Config --nologo
    dotnet run --project tests/CalculatorApp.Tests/CalculatorApp.Tests.csproj --no-restore --nologo
elif command -v make >/dev/null 2>&1; then
    echo "tests: running make test..."
    make test
else
    echo "tests: neither dotnet nor make was found. Install one test runner and try again." >&2
    exit 1
fi
echo "tests: unit tests completed."
