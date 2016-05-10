# Processing Camera Wrapper

This sketch provides you a camera class and a set of Controllers for different perspectives. This allows you to control the camera as you might know from different games or 3D applications.

The following classes are featured:

### Cam

The camera is wrapped in the Cam class. It provides an API to the controller classes for translation (movement), rotation around objects, points and arbitrary axis (i.e. itself).
The class implements a logical layer upon the processing method camera(...) which itself is an added layer to gluLookAt.


### Controllers

The controllers can be easily attached to the camera and switched to provide different perspectives. The following perspectives are included:

* Third person
* First person
* Iconospheric
* Orthographic

