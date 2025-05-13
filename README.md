Drive, earn, and manage rides with safety and flexibility

Join the Dropping Ride Driver community and start earning on your schedule. Designed for ease, safety, and performance, the Dropping Ride Driver app empowers you to manage your rides, earnings, and support — all in one place.

Key Features:
Effortless Ride Management:
Go online with a tap, view ride history, track daily earnings, and manage your documents seamlessly within the app.

Enhanced Safety:
Start trips only after secure OTP verification and access built-in SOS alerts for quick emergency assistance.

Seamless Communication:
Use in-app chat and calls to connect with riders and get support — with multilingual support to match your preferences.

New Innovations:
Unlock driver incentives, loyalty rewards, and experience Android-exclusive features like bubble mode and wake-up functionality for maximum efficiency.

# IOS Parts Remains Totally 
<!-- > <string>Encoded app id from firebase</string>  -->
<!-- build > app > intermediates > merged_native_libs > release > out > lib => compress 3 files or whatever not the lib-->
<!-- cred
user login with this credentials: 
phone number: +233 0242284569
password: 123456789
 -->

Location permissions
Your app uses the following undeclared Location permissions
android.permission.ACCESS_BACKGROUND_LOCATION
android.permission.ACCESS_COARSE_LOCATION
android.permission.ACCESS_FINE_LOCATION
Let us know why your app accesses location in the background. Learn more
App purpose
What is the main purpose of your app?
Enter the main purpose of your app 

0 / 500
Text is 0 characters out of 500
Location access
Describe 1 location-based feature in your app that needs access to location in the background. Learn more
Tell us about 1 location-based feature only. If your app contains multiple features, choose the one that uses location in the background the most. This feature should also be included in the prominent disclosure shown to users. If this feature has no user-interface, let us know here. Approval will be granted for your entire app, not just for this single feature. 

0 / 500
Text is 0 characters out of 500
Video instructions
Provide a link to a short YouTube video which shows an in-app walkthrough of the feature you've described above. Learn more
http://
The video should include the prominent disclosure that is shown to users before the runtime prompt. This should explain the feature and its access to location in the background. Recommended 30 seconds or shorter. 





The DroppingRide Driver app uses location permissions to provide accurate ride-matching and navigation for drivers. 

Permission: ACCESS_FINE_LOCATION  
Usage: This permission is used to fetch the driver’s real-time location to:
- Show their location on the map
- Match them with nearby ride requests
- Provide turn-by-turn navigation
- Update ride status in real time (pickup, dropoff)

Location access is initiated only after user consent and is visible via map markers and ongoing notifications.

If background location is used:
Permission: ACCESS_BACKGROUND_LOCATION  
Usage: Required only when the app is in background to:
- Maintain active ride tracking when the app is minimized
- Ensure safety and transparency during ongoing rides

We do not collect location data when there is no active ride. The background location is disabled once the ride ends.



<!--  -->

Permissions and Their Usage:
🔹 ACCESS_FINE_LOCATION
Why:
To obtain accurate GPS location for showing the driver's real-time location on the map.

Where:

Home screen with live map

While driver is en route to pickup/dropoff

During navigation

🔹 ACCESS_COARSE_LOCATION
Why:
Used as a fallback when fine location is not available (e.g., poor GPS).

Where:

Initial app load before GPS lock

Location prefetch while app starts

🔹 ACCESS_BACKGROUND_LOCATION
Why:
To maintain accurate ride tracking if the app is minimized or in the background during an active ride.

Where:

When driver accepts a ride and starts trip

While app is in the background (e.g., when phone screen is off or driver uses another app during navigation)

Note:
Used only during active trips. Automatically disabled after the trip ends.

🔹 FOREGROUND_SERVICE
Why:
To run a foreground service with a persistent notification that shares the driver’s location safely.

Where:

During active ride session

Ensures Android OS does not kill the service

🔹 FOREGROUND_SERVICE_LOCATION
Why:
Specifically required to run location updates in the foreground on newer Android versions.

Where:

Tied with the above foreground service during an ongoing ride

<!--  -->









SHA1
A8:C4:F0:F5:09:23:8A:8E:99:1F:51:01:26:B7:9E:19:3D:19:EE:6C

256

7E:F4:27:DC:27:08:D6:3F:3D:B4:5E:FA:0A:A5:F7:71:17:B3:C0:B4:A1:2F:FC:73:52:80:C4:CD:30:3B:EC:D6

md5
12:87:F5:5B:DD:41:82:C2:C9:BB:3F:F5:F0:B0:FE:B7




[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.droppingride.driver",
      "sha256_cert_fingerprints":
        ["7E:F4:27:DC:27:08:D6:3F:3D:B4:5E:FA:0A:A5:F7:71:17:B3:C0:B4:A1:2F:FC:73:52:80:C4:CD:30:3B:EC:D6"]
    }
  }
]
# restart_tagxi

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
