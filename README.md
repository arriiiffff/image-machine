# Image Machine
App to store machine data and qr code scanner.

https://drive.google.com/drive/folders/1n2iwEdaTaLXsuwFmiXR8i2_Aw8nJz2S7?usp=sharing

## Development Process
1. Create View Controller Containing List of Machine Data with TableView.
2. Create Add Machine Data View Controller to Store Machine Data using UserDefault and Struct Model Data using encoder.
3. Get Machine Data object that has been stored to user default using decoder.
5. Create sort function by machine data name.
6. Add Delete function on swipe.
7. Create Detail Machine Data View Controller, passing data from table view item on touch.
8. Create Code Reader Controller, get code from QR Code by using the camera, when found the right machine number, open to detail machine view controller.
9. Create TabBarController and fill it with "Machine Data" and "Code Reader" View Controller as content of the page.
