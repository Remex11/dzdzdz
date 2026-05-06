using CalculatorApp;

var checks = new List<(string Name, Action Test)>
{
    ("Add returns sum", () => ExpectEqual(5, Calculator.Add(2, 3))),
    ("Subtract returns difference", () => ExpectEqual(6, Calculator.Subtract(10, 4))),
    ("Divide returns quotient", () => ExpectEqual(4.0, Calculator.Divide(8, 2))),
    ("Divide by zero throws", ExpectDivideByZero)
};

var failed = 0;

foreach (var check in checks)
{
    try
    {
        check.Test();
        Console.WriteLine($"PASS: {check.Name}");
    }
    catch (Exception ex)
    {
        failed++;
        Console.Error.WriteLine($"FAIL: {check.Name}");
        Console.Error.WriteLine(ex.Message);
    }
}

if (failed > 0)
{
    Console.Error.WriteLine($"{failed} test(s) failed.");
    return 1;
}

Console.WriteLine("All fast unit tests passed.");
return 0;

static void ExpectEqual<T>(T expected, T actual)
{
    if (!EqualityComparer<T>.Default.Equals(expected, actual))
    {
        throw new InvalidOperationException($"Expected {expected}, got {actual}.");
    }
}

static void ExpectDivideByZero()
{
    try
    {
        Calculator.Divide(1, 0);
    }
    catch (DivideByZeroException)
    {
        return;
    }

    throw new InvalidOperationException("Expected DivideByZeroException.");
}
