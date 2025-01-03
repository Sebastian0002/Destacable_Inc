# Destacable Inc

This application was built using the BLOC/CUBIT state management framework, while also implementing a clean architecture approach, including the use of a local SQLite database, among other features.

# Bussines case:

Destacable Inc's main product is its online CDT opening platform, "BetterCDT," available via web and mobile app, which generates the company's highest recurring revenue. The technical team continuously improves the product, focusing on user experience and operational efficiency. Recently, customers have requested a dashboard within the mobile app to visualize investment statistics and CDT market rate trends. The CTO has tasked you with developing a clear, user-friendly dashboard that adds value by effectively presenting this information.

# Demo:

Application video demo:

[youtube](https://youtu.be/cTbGPM8PhsE)

# Uso del codigo

To ensure everything works correctly, you must download the .env file. As a best practice, this file is excluded in the .gitignore. Simply download the [.env](https://res.cloudinary.com/dhopfnum1/raw/upload/v1730826238/wvulqto09mkva9sjhhru.env) file, rename it, and place it in the root of the server directory.

To run the application locally, execute the command npm run start:dev within the server directory to start the server locally. In Flutter, to configure the application for Android devices, navigate to the path lib/constants/environments and replace "YOUR_IP" with your local IP address. For iOS, if testing on an emulator, no additional configuration is needed. However, if testing on a physical device, you must also replace localhost with your IP address, just as with Android.
