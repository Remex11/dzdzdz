.PHONY: build test clean

build:
	dotnet restore src/CalculatorApp/CalculatorApp.csproj --configfile NuGet.Config --nologo
	dotnet build src/CalculatorApp/CalculatorApp.csproj --no-restore --nologo

test:
	dotnet restore tests/CalculatorApp.Tests/CalculatorApp.Tests.csproj --configfile NuGet.Config --nologo
	dotnet run --project tests/CalculatorApp.Tests/CalculatorApp.Tests.csproj --no-restore --nologo

clean:
	dotnet clean src/CalculatorApp/CalculatorApp.csproj --nologo
	dotnet clean tests/CalculatorApp.Tests/CalculatorApp.Tests.csproj --nologo
