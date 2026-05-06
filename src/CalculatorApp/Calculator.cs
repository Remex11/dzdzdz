namespace CalculatorApp;

public static class Calculator
{
    public static int Add(int left, int right)
    {
        return left + right;
    }

    public static int Subtract(int left, int right)
    {
        return left - right;
    }

    public static double Divide(double left, double right)
    {
        if (right == 0)
        {
            throw new DivideByZeroException("Division by zero is not allowed.");
        }

        return left / right;
    }
}
