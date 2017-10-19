# Room-Occupancy-Sensing-Using-Overhead-Fish-eye-Camera
Background: The Department of Energy (DOE) is planning to reduce residential and commercial building energy use by 30% by 2020 and by 45% by 2030. While modern, internet-enabled thermostats (Nest, Ecobee,etc.) work well in residential scenarios, they are not suitable for large commercial venues (conference halls, large classrooms, etc.) as they can only provide binary (occupied/unoccupied) decisions. In a large venue, an accurate estimation of occupancy level (e.g., 40%) is needed to control ventilation (no air-quality sensors are currently in use so venues tend to be over-ventilated) and also help predictively with heating and air conditioning. In order to estimate room’s occupancy level, multiple surveillance cameras are typically used. A relatively unexplored alternative is an overhead camera with fish-eye lens. Its advantage is a top view with reduced occlusions and wide floor coverage; often single camera suffices reducing installation costs.

Task: The goal is to develop a reliable method to detect the presence of people in a room and estimate the level of occupancy using an overhead-mounted, fish-eye surveillance camera.

Basic Solution: People Head Detection. 
First of all, cut out head block and background block from image manually.
And then, extract feature information of the head by using HOG as the data set.
Next, applying SVM training on extracted feature and do the prediction.
Finally, scanning each video frame using sliding window method.

