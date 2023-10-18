# Flutter Image Upload and Image Crop

Hello, Flutter enthusiasts! Are you eager to seamlessly integrate image upload and precision cropping functionalities into your Flutter applications? Look no further. Welcome to an effortless and comprehensive guide on implementing image upload and crop features within your application. In just a few simple steps and with the aid of a couple of well-crafted packages, you'll be well on your way to optimizing your app's image handling capabilities. Let's dive in and discover the secrets to effortlessly managing images in your Flutter applications.

## Packages

We will only need two packages for this small project : 

- [image_picker](https://pub.dev/packages/image_picker/install) : With this package we are able to upload an image to our application, and we get the option to choose our Image Source whether it is from the gallery or from the camera.
- [image_cropper](https://pub.dev/packages/image_cropper/install) : With this package we get the option to crop our image, so we can use only the part that we want. This package provides a great UI, which is different for every device and its fully customizable.

## Setup

While setting up these packages is straightforward, it's important to exercise caution, considering the variations across different devices. 

### Image Picker 

**Android :** It works without adding anything more than the package itself. </br>
**iOS :** Go to your Info.plist file in the ios folder and add these lines </br>
```
<key>NSCameraUsageDescription</key>
<string>This app needs access to your camera in order to upload photos.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs access to your photo library in order to upload photos.</string>
```

### Image Cropper

**Android :** Go to AndroidManifest.xml file inside android/app/src/main </br>
```
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```
**iOS :** It works without adding anything more than the package itself. </br>

and now, we are ready for the fun part. Let's code !

## Code

<img src="/screenshots/homepage.png" alt="Home Page" width="300" height="auto">
<!-- ![Home Page](https://github.com/Thanasis-Traitsis/flutter_upload_crop_image/blob/main/screenshots/homepage.png) -->

I created a simple **Statefull** page where the user can choose how to upload an image (camera or gallery). Once the image is chosen, the result promptly appears above the selection buttons for a seamless and intuitive experience.

### Image Upload

When the user presses a button, the function uploadImage will execute.
```
// Initialize file variable
File? file;

// Function for uploading images
Future uploadImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(
    source: source,
  );
  if (image == null) return;

  // Convert the image path to a File
  File imageFile = File(image.path);

  // Update the file variable with the selected image
  setState(() {
    file = imageFile;
  });
}
```

The uploadImage function dynamically receives the ImageSource based on the user's selection between the gallery or camera options. 

- gallery button : ImageSource.gallery
[images for gallery]

- camera button : ImageSource.camera
[images for camera]

Once an image is chosen, it is converted to a File type and assigned to the 'file' variable. By utilizing the setState method, the updated image is promptly displayed, ensuring a seamless and interactive image selection experience.

### Image Crop

Now, for those instances when we need to refine the images we upload, such as cropping or rotating them, we can seamlessly employ the capabilities of the image_cropper package by integrating an additional function.

```
// Function for uploading images
Future uploadImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );
    if (image == null) return;

    // Convert the image path to a File
    File imageFile = File(image.path);

    var croppedFile = await cropImage(imageFile);

    // Update the file variable with the cropped image
    setState(() {
      file = croppedFile;
    });
  }

  // Function to crop the selected image using the image_cropper package
  Future<File?> cropImage(File pickedFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    // Returning the edited/cropped image if available, otherwise the original image
    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return File(pickedFile.path);
    }
  }
```

## Conclusion

Congratulations! You've successfully learned how to implement image upload and crop functionalities in your Flutter applications. By leveraging the powerful capabilities of the **image_picker** and **image_cropper** packages, you've equipped your app with seamless image handling capabilities, providing your users with a rich and interactive experience. Remember to stay attuned to the specific configurations and nuances for different devices while integrating these features. With your newfound knowledge, you're now well-equipped to build stunning Flutter applications with efficient image management. Happy coding!

If you enjoyed this article and want to stay connected, feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/thanasis-traitsis/). 

If you'd like to dive deeper into the code and contribute to the project, visit the repository on [GitHub](https://github.com/Thanasis-Traitsis/flutter_upload_crop_image).

Feel free to reach out if you have any questions or need further guidance. Cheers to your future Flutter projects!
