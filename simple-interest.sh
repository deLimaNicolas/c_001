#!/bin/bash

# Financial Calculator - Compound & Simple Interest Helper
# Friendly welcome message
echo "💰 Financial Calculator v1.0"
echo "---------------------------"

# Input with validation
read -p "Principal amount (\$): " principal
while ! [[ "$principal" =~ ^[0-9]+$ ]]; do
    echo "Error: Please enter a valid number"
    read -p "Principal amount (\$): " principal
done

read -p "Annual interest rate (%): " annual_rate
while ! [[ "$annual_rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; do
    echo "Error: Please enter a valid number (decimals allowed)"
    read -p "Annual interest rate (%): " annual_rate
done

read -p "Time period (years): " years
while ! [[ "$years" =~ ^[0-9]+(\.[0-9]+)?$ ]]; do
    echo "Error: Please enter a valid number"
    read -p "Time period (years): " years
done

# Calculations
simple_interest=$(bc <<< "scale=2; $principal * $annual_rate * $years / 100")
total_amount=$(bc <<< "scale=2; $principal + $simple_interest")

# Enhanced output formatting
echo -e "\n📊 Calculation Results:"
echo "---------------------"
printf "%-20s: \$%.2f\n" "Principal" "$principal"
printf "%-20s: %.2f%%\n" "Interest Rate" "$annual_rate"
printf "%-20s: %.1f years\n" "Time Period" "$years"
echo "---------------------"
printf "%-20s: \$%.2f\n" "Simple Interest" "$simple_interest"
printf "%-20s: \$%.2f\n" "Total Amount" "$total_amount"
echo "---------------------"
