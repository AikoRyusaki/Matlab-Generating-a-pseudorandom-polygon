To solve the given task, I decided to use MATLAB because it combines all the necessary mathematical functions with a convenient graphical user interface editor.

For convenience in further visualization, we create setters and getters for two global variables, s and t, which will store the coordinates of variables X and Y for each vertex.

In the plot_Callback function, which will be responsible for drawing the polygon, we randomly assign a variable n. It will represent the number of vertices of the future polygon. We calculate and save the X and Y values for the vertices using setters. We then pass these values back to the method as local variables and combine the X and Y values into a single variable p for further calculations. We find the average value between all the points (the center) and store it in the variable pm.

Next, we center the points and find their arguments in radians (a) and radius vectors (r). We use the built-in sort function to order the angles. We order the radii (r) and restore the original coordinates pn. Then we just need to close the polygon.

Now let's work on the otob_Callback function, which will mirror the given polygon. Since we need to reflect it with respect to the vertical axis, only the X coordinates of each point will change. In this case, I will be reflecting with respect to the origin, so all I need to do is change the sign of the global variable s, which stores the point coordinates along the X-axis. Then we use the same algorithm to construct our polygon.

<image src=https://github.com/AikoRyusaki/Matlab-Generating-a-pseudorandom-polygon/assets/136241809/c9175673-310f-4a2f-a43c-7a49dfde9754>
