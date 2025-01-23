"""
This app uses Python, numpy, pandas, matplotlib to generate a set of data points and plot them on a graph.
"""

# import the required libraries
import numpy as np                  # numpy is a library for numerical computing
import pandas as pd                 # pandas is a library for data manipulation and analysis 
import matplotlib.pyplot as plt     # matplotlib is a library for creating static, animated, and interactive visualizations


"""
Create a function 'generate_data_points' that generates a set of 100 data points (x, f(x)) and returns them as a pandas data frame.
Arguments:
- 'x_range' is a tuple of two integers representing the rang0 e of x values to generate.
Returns:
- A pandas data frame with two columns, 'x' and 'y'.
Details:
- 'x' values are generated randomly between x_range[0] and x_range[1].
- 'y' values are generated as a non-linear function of x with excessive random noise: y = x ^ 1.5  + noise.
- The data frame is sorted by the 'x' values.
- The data frame has 100 rows.
Error Handling:
- Raise a ValueError if x_range is not a tuple of two integers.
- Raise a ValueError if x_range[0] is greater than x_range[1].
Examples:
- gendata((0, 100)) generates a data frame with 'x' values between 0 and 100.
- gendata((-100, 100)) generates a data frame with 'x' values between -100 and 100.
- gendata((100, 0)) raises a ValueError.
- gendata((0, 100.0)) raises a ValueError.
"""

def generate_data_points(x_range):
    # Check if x_range is a tuple of two integers
    if not isinstance(x_range, tuple) or len(x_range) != 2 or not all(isinstance(x, int) for x in x_range):
        raise ValueError("x_range should be a tuple of two integers")
    
    # Check if x_range[0] is greater than x_range[1]
    if x_range[0] > x_range[1]:
        raise ValueError("x_range[0] should be less than or equal to x_range[1]")
    
    # Generate 100 random x values between x_range[0] and x_range[1]
    x = np.random.randint(x_range[0], x_range[1], 100)
    
    # Generate y values as a non-linear function of x with noise
    y = x ** 1.5 + np.random.normal(0, 100, 100)
    
    # Create a pandas data frame with 'x' and 'y' columns
    data = pd.DataFrame({'x': x, 'y': y})
    
    # Sort the data frame by 'x' values
    data.sort_values(by='x', inplace=True)
    
    return data


"""
Create a function 'plot_data' that plots the data points from the data frame.
Arguments:
- 'data' is a pandas data frame with two columns, 'x' and 'y'.
Returns:
- None
Details:
- The data points are plotted as a scatter plot.
- The plot has a title 'Data Points', x-axis label 'x', and y-axis label 'f(x)'.
"""

def plot_data(data):
    # Plot the data points as a scatter plot
    plt.figure(figsize=(10, 6))
    plt.scatter(data['x'], data['y'], color='blue', label='Data Points')
    
    # Add title and labels
    plt.title('Data Points')
    plt.xlabel('x')
    plt.ylabel('f(x)')
    
    # Display the plot
    plt.show()

"""
Create a function 'main' that generates data points and plots them.
Arguments:
- None
Returns:
- None
Details:
- Generate data points using the 'generate_data_points' function with x_range = (0, 100).
- Plot the data points using the 'plot_data' function.
"""

def main():
    # Generate data points with x_range = (0, 100)
    data = generate_data_points((0, 100))
    
    # Plot the data points
    plot_data(data)

# Call the main function
if __name__ == "__main__":
    main()
