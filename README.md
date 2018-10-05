# FirstFlutterProject
# Creating a New Flutter Project
inside terminal :
	cmd `flutter create [projectName]`
	cmd `cd [projectName]`
	cmd `open -a 'visual studio code .'`
inside VSCode IDE:
	open Integrated Terminal with `View => Integrated Terminal`
Then Start our app (two ways):
::In order to run it we need a virtual device, an emulated device (Android AVD or Xcode Simulator) or a real device::
	1. inside VSCode IDE’s Integrated Terminal:
		cmd `flutter run`
	2. inside VSCode IDE, go to `Debug => Start Debugging` or `Debug => Start Without Debuggin`
Select Environment:
	`Dart & Flutter`

	[image:8C7F3984-B7F3-4779-9092-9A2588C52ED4-67708-000055695566321E/Screen Shot 2018-10-02 at 1.29.34 PM.png]

# Exploring the Default Project Structure
inside VSCode IDE:
	go to `lib => main.dart` and delete everything
	[image:100EB19C-D018-486E-B1D2-2A8CECC6D869-67708-0000556957E7D2CA/Screen Shot 2018-10-02 at 1.31.06 PM.png]
* `.idea` is a folder for android studio with some basic configuration. we don’t need to delete it and also don’t need to work in it.

* `android` and `ios` folders are important, because the hold the native code and an important part of the app building process which you need for building an app for these platforms, you will rarely work in these folders, though from time to time you have to.

* `build` folder is a folder you can ignore for now and there, you find your build source code in the end, this is required by the build process.

* The `lib` folder is however where you write your entire flutter app, so this is the folder we will work in, this is the folder where we write our dart and flutter code.

* The` test` folder would allow you to write automated tests but this is not something I'll focus on right now.

* the other files here are basically configuration files, for git in case you're using this, it's a version control system. Then a couple of configurations for the SDK, for the flutter SDK, you don't need to change anything there.

* The `pubspec.yaml` file configures your overall project and its dependencies though and this is an important file, there we will later add ::third party packages:: we're using, like for example when we add the camera, that we can use the device camera and we will also revisit this from time to time to change certain configurations like for example add static assets.  

# Diving Into the "main.dart" File
The main.dart file is a very important file and you should not rename it because ::flutter when building your project will look for that main.dart file and in that file, it will look for a special function to execute to essentially start your app on the device.:: So you can think of this entire dart code will be compiled and bundled with the android or iOS code, so it will be bundled into one application which is shipped to your native device and on this device in this app then, the main.dart file or one specific function in there will be executed first and that function which it's looking for in the main.dart file is also called Main.
	[image:5CE9B76F-8211-4CC1-9E52-BA7F166BDB24-67708-000055696952870C/Screen Shot 2018-10-02 at 2.13.29 PM.png]
Now a function is essentially a block of code you define which doesn’t execute immediately but which needs to be called to be executed, ::a function in flutter is created by typing the name, like Main and this specific function which flutter is looking for at app startup has to be named main.::
So you type the name of that function and then parentheses and you could specify any arguments, parameters this function would receive, so data that function can use inside of its body, the main function however doesn't receive any.

Now the function body is the code which should be executed and you define it by adding curly braces opening and closing.

However for this special function, we won't call it, flutter will do that for us automatically which is why we have to name it main and why it should be in the main.dart file.

Now in here you basically start your app, which means you start rendering the user interface, all the heavy lifting to hook it into the operating system and so on, that is done with the Android and iOS files you could say but ::to bring something onto the screen, you have to do something in that main function and that something is that you need to attach a widget to the screen.:: Now what is a widget?

# Widgets in Flutter - Theory
Flutter is all about widgets, ::widgets are basically building blocks, user interface components:: you could say with which you create your well user interface, so what the user sees on the screen. If you have a flutter app, so a mobile app running on a mobile device, it typically consists of multiple widgets like the app bar, the navigation bar at the top, may be a header image and maybe a list with a couple of list items. All these things here are separate widgets and they often contain other widgets like the list here, it contains the list items as child widgets.

::The page itself is even a widget, the scaffold widget:: which we will also create on our own throughout this course and even the entire app is wrapped in one root widget.

So widgets are really just ::these user interface components:: but they're not just about the visuals, ::they also contain logic::, for example a button widget would not just display the button but also you would define what should happen when that button is tapped.

So that is how you think about flutter,::you build flutter apps not by doing all the heavy lifting of hooking it into the operating system but by creating user interfaces and the logic that belongs to that user interface, things like selecting items, uploading things to a server, fetching data from a server and rendering it to the screen::, that is what you do with these widgets. 
	[image:734224A1-3AD3-45EC-80A7-C8ADB359F666-67708-00005569699EB9F2/Screen Shot 2018-10-02 at 2.21.09 PM.png]
And therefore ::you can think of your flutter app as a tree of these widgets::, you have one root widget as I just said to wrap your entire app and then you might have widgets for the different pages of your app between which you can navigate around and then you have nested sub-widgets for list items, for user input forms, things like that, so you really build up such a tree of widgets and you do all of that in code so with dart, a programming language.


# Creating a Widget
We want to create a widget and ::a widget will be an object which is why we create a class, to define how that object should look like.:: Classes allow you to create blueprints for new objects so that you can say what should be inside such object, which properties so which data fields should it have. These all goes into such a blueprint and with flutter, you will work with a lot of classes which ship with the flutter framework but you also create your own ones 
---
class’s features: 
That is a class and now you can add features to it, features are two kinds of things, you can add functions to classes, they will then be called ::methods:: and you can also add ::variables::to functions.

There is one more important feature we need to cover right now, 

::However flutter of course doesn't know if a class created by us is something it can use as a widget. because as you will learn, it needs certain features in a class to be able to use it as a widget, so to draw it to the screen and therefore, our class has to extend something.::

This is a concept called ::inheritance:: and you implement it by adding the extends keyword here, this allows you to inherit from a base class, so from another class and this means this class will receive all the features of the class it inherits from and it can still use or add its own features and since we then inherit from a class, flutter also knows that it can safely use objects based on that class to draw something onto the screen.

Now the thing we extend from therefore has to come from the flutter framework and that is where we implement another feature, ::imports::.

In this file, we write our own code but we want to use code which is exported from the flutter SDK and framework and for that, you add an import statement by typing import and then the path to the file you want to import from.

[image:C2A2CDCD-B938-4817-8689-C56B4FE82996-67708-00005569674CF156/Screen Shot 2018-10-02 at 3.28.06 PM.png]
::Because dart is actually a modular language which means you split your code across multiple files and in this case, we're using code which we didn't even write but which is stored in a third party package in the flutter framework package.We import code from such a package:: by typing package between the quotation marks and then a colon and then the name of that package which is flutter in our case and then flutter actually consists of multiple sub-packages or files you could say and you target a file by adding a slash and then the name of the file, in our case that will be material.dart. This imports this package from the flutter framework and this is available because we have a flutter project here, now we can extend a feature which is exported from that package and that is the so-called `statelessWidget.`

There also is another widget, the `statefulWidget` but we will use the stateless widget for now. Simply type it like this and this is available because of this import. Now this class is based on the stateless widget and therefore, we can almost use it as a widget to draw it onto the screen.

One important thing is missing though, we'll dive into it in the next lecture.
# Understanding Classes & Constructors
…Check on the ‘Class’ note.
# Adding the "Build" Method
::The build method is required because if we tell flutter to use an object based on this class as a widget it can draw onto the screen, it of course needs to rely on this being drawable you could say and flutter will try to draw something by calling the build method on an object where you tell it that it's a widget.::So if you pass an object to flutter to draw it onto the screen, flutter will always call a build method on that object which is why you need to add it to your own widgets.

Now the build method actually takes arguments, data which will get passed into it by flutter because flutter will be the one calling the build method.

::The build method takes one argument to be precise, the context::, context is basically an ::object with some meta information:: about your app and the position where this widget is drawn in and for example will contain information about the theme, so the colors used in our app. 

Build method needs to return something which you do by adding the ::return keyword::.

Now this is important because flutter will execute the build method and then it needs to know what to draw into the screen and that something needs to be returned, therefore just calling this will not work, instead flutter waits for this method to return something. So add the return statement and now the question just is ::what do we return here,::

::There is a very important rule, a widget always needs to return another widget in the build method until you reach widgets that ship with flutter.::

Now ::we can use a widget that ships with flutter, the MaterialApp widget.:: This is a special widget which is used to wrap your entire app so this will actually give you abilities to set up the theming for that app, it will also add a navigator which allows you to switch between different pages and so on. ::So this is your core root widget which you use in every flutter app you create, you return it in your own widget which will be the topmost widget.::

Therefore and now the MaterialApp widget can be configured to do something, to really draw something onto the screen because right now, we just create an app but there will be nothing to be seen. 

For that we can pass data to MaterialApp, by the way please note the parentheses here. ::MaterialApp like this:: without the parentheses is a class imported from the flutter material package, ::with the parentheses::, ::we create an object based on the class :::you could say, ::we construct an object, we call the so-called constructor method of a class,:: every class has one. even if you don't explicitly define it. ::So we're executing this and therefore what this gives us is a new object based on the MaterialApp class.::

[image:F0180F98-5C4F-46D5-A20C-951DEAA7087B-67708-0000556968A7EC66/Screen Shot 2018-10-02 at 4.16.43 PM.png]
Now I mentioned that we can pass information to MaterialApp, let's do that in the next lecture.
# Adding the Scaffold
::We need to tell MaterialApp which is the wrapper for our entire app what to do, what to draw onto the screen and for that you can pass arguments to MaterialApp.::

[image:7820E687-C949-43BE-B3E5-B7FD531CD380-67708-000055695F7C5BC2/Screen Shot 2018-10-02 at 6.28.12 PM.png]
Our build method expected an argument, the constructor of MaterialApp does too, it expects so-called ::named arguments:: ,`home:` in `return MaterialApp(home: )`which means you first add a name, for example home is such an argument, then a colon and then a value you want to pass for that argument.

The alternative are ::positional arguments::,`context` in `build(context)` , there we don't assign a name instead. 

::The first argument passed to the build method will be treated as context in this case so it will be stored in that parameter, the named argument case is something we'll also use throughout the course,::

MaterialApp uses it, there we target an argument named home and we pass a value for it and ::home actually requires another widget::, this will be the widget which is drawn onto the screen when the app loads. Here you typically use a so-called ::scaffold widget::, another widget shipping with the material package here.

Inside  the ::MaterialApp:: we got a widget chain:

::MaterialApp:: => ::Scaffold:: => ::AppBar::: => ::text widget.:: 

[image:EB1C3827-7C56-4C88-9988-91D19ADFBB45-67708-000055696670BF1A/Screen Shot 2018-10-02 at 6.41.23 PM.png]
* ::Scaffold:: will create an empty page, to pass something to that page, we can target specific arguments here which we pass to scaffold. 
* One of them is app bar, by writing ::AppBar::: you can add a widget which will be rendered as application bar, the toolbar at the top of the screen. 
* There is a title argument. Here we’ll use the last widget of this chain and that will be the ::text widget.:: `Text is a widget which then takes a string as an argument, now this is a positional argument,` we don't define the name instead we just pass a string and then this will be extracted inside of the text widget in the first argument in the argument list.So here we pass a string which should be displayed as text, like EasyList because that will be the name of the app we build. 

[image:35959595-0DD7-4026-82FD-08E9563E38D7-67708-0000556959D8E75B/Screen Shot 2018-10-02 at 6.33.19 PM.png]
/If you’re wondering how do I know that this has a title property, you can hover over AppBar and you will see some documentation on which arguments it accepts and there, you see the title and you also see that this also requires a widget but you can also use another approach, you can put your cursor into the argument list here between the parentheses and it control space and then your IDE should give you this auto-completion but it offers some well code snippets that can be used here and there you also see if you start typing, that there is a title argument you can target./
	

For now let's take this as it is and I don't know about you but I think that code can be written in a bit of a more readable way.
go to:
	` code` =>  `preferences` =>  `keyboard shortcuts` 
and then:
	`search for format document.`

	=> [image:8D676810-6E49-479A-8D6A-A9F88F930821-67708-000055696A9A6BAB/Screen Shot 2018-10-02 at 6.54.03 PM.png]

This is a command which you can rebind or use as you find it here, which you can execute in your code to automatically reorganize it and make it more readable.
[image:947D08E2-40D6-41D6-8CB9-CFBB9ACC179B-67708-000055695EFF6CFE/Screen Shot 2018-10-02 at 6.55.08 PM.png]

We still wouldn't see anything on the screen though and the reason for that is that we created our widget but we're not mounting it to the screen.

::Mounting widgets to the screen::
go back to main() function:
	* We need to ::run a special function here,:: a function provided by the material package we import, it's a function called runApp,
	*  runApp ::takes an argument:: and that argument has to be a widget, we will use our MyApp widget which then wraps MaterialApp, scaffold and so on.
	* So use our class name here and then ::add parentheses to construct:: an object based on that class because classes are blueprints you create concrete objects based on them by executing the classes just like you execute functions. 
	
[image:35B78709-C12D-4DF0-A1F5-4D9CBD3FBE32-67708-0000556967060E2B/Screen Shot 2018-10-02 at 7.06.00 PM.png]

	* With that save that and now it will try to hot reload that into your running emulator and you should see something like this,
		[image:349209EB-5BF3-4071-9D54-2A9C05DF8C3B-67708-000055695FD9D3CF/Screen Shot 2018-10-02 at 7.02.12 PM.png]
you can see the app bar, you see the white background which is coming from the scaffold, the page which is created and the overall app is wrapped by the MaterialApp widget.

# Diving Deeper Into the Syntax
We created our first very basic flutter app and we do this by calling runApp in this important main function in the main.dart file where we construct an object based on our own class which essentially calls the build or has the build method, it will be called by flutter where we then return our widget tree.

Now we use dart to write all of that, so import statement, the function syntax, the class, this all is dart and dart actually is a typed language which means you should define the types your methods use or your variables store.

This helps you with development because your IDE can use that information and warn you if you try to save a wrong type and it will also be picked up during the build process and also potentially yell at you if you're using something incorrectly.

Now what do I mean with that?

For example ::the build method,:: I mentioned that it ::has to return a widget:: and we don't see any errors here because dart is actually able to infer the type, since we return MaterialApp which is a widget, dart knows that the build method will eventually return a widget.

However ::we can be really clear about this by adding the widget word in front of build::, now widget is a class however not instantiated but instead just a class name which then acts as a type in dart, which means, to be precise, this is a class defined by the flutter package and the material package and it means that widget is now what we expect to return and build.
[image:4665C662-2EE0-4F17-8570-1BE744A42CCA-67708-0000556967A6E6F7/Screen Shot 2018-10-02 at 7.20.32 PM.png]

and if for some reason we wouldn't return this here the MaterialApp, let’s say we comment this all out and we instead return a string here, then you would see that we get an error and we see the return type string isn't a widget as defined by the method build. So we would get a warning and if I save this, it wouldn't even recompile because it recognizes that our code is incorrect.
[image:95B325BE-410E-4FA2-8B51-9EE92428AF7E-67708-0000556966BC23B0/Screen Shot 2018-10-02 at 7.21.49 PM.png]

::So adding these types allows us to write cleaner code,:: it allows us to avoid errors, now we can’t just define type in front of the build method, we can also be very clear about which type this argument will have. 

Again it's able to infer this because build actually is a method already defined by stateless widget but then marked as has to be overwritten but we can be very clear about that by adding type in front of the argument and that's the general theme,::you add the type in front of your function, your variable, your parameter to define what this will hold.::

::the argument inside of the build method is actually of type BuildContext, another class provided by the flutter material package.::
[image:66A4DA8B-4DEA-45EA-95C2-13ED8E03CCDF-67708-00005569541D8CCC/Screen Shot 2018-10-02 at 7.25.18 PM.png]
So now we’re very clear about the context being of type BuildContext and it doesn't change our app but it ensures that we don't make dumb mistakes and it also helps us with the IDE because if I now type context and then dot to access one of its methods or properties, I get suggestions that belong to the BuildContext type so I'm not getting any suggestions that wouldn't exist anyways.

We can also ::be clear about the type the main method returns::,

now you might say ::it doesn't return anything:: and you're right, and ::in this case you add a void in front of it:: to indicate this method doesn't return anything and it shouldn't.

If we now do add a return statement and return anything but nothing, this returns nothing so this would be valid but if we return a string let's say, then we again would get an error that the return type string isn't a void and void just means empty.
	[image:F9C63DBD-6289-49B5-8C84-BF6B6D0EA108-67708-000055696C0C278B/Screen Shot 2018-10-02 at 7.32.16 PM.png]
Now you don’t need to return nothing like this, you can just omit this line and now the code behaves exactly as before as you can tell but it's better code. ::Using types is strongly recommended and allows you to write cleaner code.::
	[image:E5BE7943-1A55-4E83-90CB-56F7DF87FD4E-67708-0000556960E0919A/Screen Shot 2018-10-02 at 7.33.18 PM.png]
	
---
It’s not all I want to discuss about the dart language though, types are a crucial feature and we will use them throughout this course but there are two things I want to mention right now,

### first one is the way we write this function: 
::fat arrow notation is available::
If you have a function which only contains one statement like this one does, you can absolutely write it like this, nothing wrong with it, use this style if you like it.
[image:8A41E8E6-8B94-4413-84D9-09DF6C563503-67708-000055696CBC630B/Screen Shot 2018-10-02 at 7.35.47 PM.png]

There is a shortcut though, a shorter notation and that’s the fat arrow notation, you use it by removing the curly braces and then you instead write it all in one line but you separate the name and argument list from the function body by using an arrow, an equal sign and then a greater than sign.
[image:AE32580B-40A7-4F54-965F-0A44B808E9AC-67708-000055696280D194/Screen Shot 2018-10-02 at 7.36.46 PM.png]
And now this is the equivalent to the function we had before, it’s only valid if you have exactly one statement but this is also something you will see throughout the course, this shorter function notation. 

### Second one: 
::overwrite notation: @ overwrite::
there is something special about the build method which we also have for some other methods throughout this course, this is actually a method for which stateless widgets requires us to overwrite it and we can therefore add a special notation here, it's not required, as you can tell everything works without it but you can add an notation by adding an @ sign and then here it's the overwrite notation.
[image:E1F46B28-BED5-4BE7-95A2-7F9092E1C85B-67708-000055695D7B62AA/Screen Shot 2018-10-02 at 7.44.37 PM.png]

What this does is it simply tells dart and flutter that we deliberately overwrite the method `build` which is also already defined in stateless widget `StatelessWidget`.

Now it works without that but if we're working in a team of developers, this makes it very clear that this is a method that actually overwrites a method defined by this widget and that makes our code easier to read. 

With all that if we save the application, it will look and feel exactly as it did before but now we got our well cleaner code. 
---
# Adding Cards & Images
Remember that the ::scaffold which it was used to create the page:: and ::we can not just add the app bar there, we can also add other arguments and let's say you again use that control space trick, for example a body::, that is actually what's displayed well on the page itself, below the app bar in all that whitespace here.  The body you guessed it also expects a widget which you can see if you hover over it, here you can see the type, you also get a short explanation about how it works and what it does and therefore let's add a widget here.

Now ::we could again create another widget on our own and then add this here but ultimately you'll always end up with a tree of widgets built into the flutter material package,:: you own widgets which you use a lot will also well be composed of either other widgets built by you but finally somewhere at the end of the chain, ::you will be using widgets shipping with flutter because these are actually then translated to native user interface components so that is why you always will end up with flutter built in widgets somewhere down the road.::

::For the body here, let's say we want to add a card,:: 

/you know how this card look from material design apps, well if you don't you'll see it in a second, you can add it by using the card widget and as you were probably guessing, this is also shipping with the flutter material package so all is unlocked with this single import. The card will give us this highlighted look with a slight drop shadow and so on and this card again takes a couple of named arguments you can assign like for example most important the child, which also is a widget which you can see here on the right./
	[image:81D8CE5A-D3B6-4182-AFA8-D0A7FD81BE07-67708-000055696AE8DC2D/Screen Shot 2018-10-02 at 8.06.27 PM.png]

So let's add child and ::that is essentially the content of our card::, so what we want to have inside of it. Now let's say ::we want to have two things in there::, an ::image:: and also a ::title:: below the image.

Now that you have two elements in there, ::we use a special widget also shipping with flutter, the column widget,:: 
[image:04D153FC-A428-4F7E-8720-AEFB4BC5BCA3-67708-000055695DC88141/Screen Shot 2018-10-02 at 8.21.59 PM.png]

::`<Widget>` this strange angle brackets widget thing, well that's a so-called generic type, it's an additional notation added to the array here to make it really clear that this actually will only hold widgets.::

::and I already mentioned it, this thing with the square brackets here is called an array, it allows us to add a list of data instead of a single data piece, column, card, app bar, text, scaffold, these are all just single objects, now we can add a list of single objects which will be stored in this children argument.::

That is what we do here and there, ::we can add two items now in that list separated by a comma.:: Let's use an image widget, unsurprisingly also shipping with flutter material and let's leave it like this for now, in the second line, let's add a text image again to display some text. Let's name this one Food paradise for now and the image will be an image that holds some food, you can find the image attached to this video.
[image:FDB967B9-6601-40C7-A84A-1F24455E12CB-67708-00005569590CB8E0/Screen Shot 2018-10-02 at 8.27.16 PM.png]

---
### How to import images in flutter
1.  ::create a new folder here in our project which I'll name assets::, now the name is up to you but assets is a good convention since this will hold static assets of your app.
2. Now you can, just ::drag and drop the food.jpeg file into that assets folder::, which you can find the file attached to this video.
3.  we want to use that image and display it here inside that image widget. Now to unlock this file, we have to inform flutter about it because just dragging it into a folder of this project isn't enough.
4. we now need to ::go to the pubspec.yaml file:: 
	* find this commented out part where you can add a special assets key which you do by just removing that hash symbol.	 
	[image:2E6EF970-0D5E-4250-B6B4-4E69526DD83E-67708-000055695C87ADF0/Screen Shot 2018-10-02 at 8.50.12 PM.png]
	* then define assets of your application, you point to the file you want to add and leave the dash here that's important.
	[image:7021184B-6E9D-49EA-AB8D-04F95E9A45C4-67708-00005569641CD7FE/Screen Shot 2018-10-02 at 8.52.43 PM.png]
	* with this added and saved, you can now use that asset in your project and you see it already updated our project to import this basically, so that this will be included in bundles shipped to the device.
5.  go ::back to the main.dart file::
	 * use that image and for that, we'll use a special constructor of the image widget, by adding a dot after widget but before the parentheses and then asset. `Image.asset()` ::This is a special type of constructor which will create an image widget that is already configured to load an asset. 
	 * and again now you pass that asset simply as a string and then the name of the asset, the full path to be precise, so assets/food.jpeg.

Now if you save this, it should hot reload and now if you go back to your app, you should see something like this an image and some text below it and this actually is all sitting on a card which takes the entire width and height right now but you can see that slight drop shadow here at the bottom.
		[image:B6827EB8-A267-4556-A8F5-FBC826646691-67708-0000556962C1F218/Screen Shot 2018-10-02 at 9.01.44 PM.png]

Now it’s not the final style I want to have but it is a huge advancement and now we get some body here and hopefully, you got more practice with building that widget tree. You also learned about some other widgets and whilst you already learned about a lot of new widgets, these are all core widgets and there are not that many core widgets left as we'll learn.

For now let's reformat the code with that handy shortcut again and let's see what else we can do.
# Diving Into the Official Docs
Official Flutter Docs: https://flutter.io/docs/
[Widgets Catalog  - Flutter](https://flutter.io/widgets/)
[image:3B17FD24-7461-4225-9F77-5EF7AC342D0A-67708-0000556956716884/Screen Shot 2018-10-02 at 4.19.57 PM.png]
[image:3B4F3D13-C26D-46C7-80D7-995BD85E043F-67708-00005569618C7622/Screen Shot 2018-10-02 at 4.20.05 PM.png]

# Adding a Button
Now that you know where to find all these widgets, let's continue working on this app.

Let's give the user the ability to add more and more cards and therefore products as it will be by the end of this course to this, well list of cards which we don't have yet but which we will create.

* For that ::we need a list of cards first of all and we can create such a list with the column widgets here.::
[image:25CD0D22-9AC4-4413-A53A-31A797EEE3BD-67708-000055696235E2DF/Screen Shot 2018-10-02 at 9.20.35 PM.png]


* Now I want to be able to add more cards and let’s say for this, we add a button. We add that button above our other cards here so ::we could add a button with a special widget, the RaisedButton widget:: for example, this adds a raised button which is simply a button with a background color. Now the raised button needs to be configured so let's see how we can configure it for example and most importantly, 
[image:FC1640AF-EB4F-4B92-987B-15E8DDF06C79-67708-00005569653E3B77/Screen Shot 2018-10-02 at 9.23.55 PM.png]
it has ::the child argument here and there we add a widget which will simply define what’s inside of the button, this often is text but it could also be an icon:: for example. Here I will use the text widget again to add some text and the text I use is add product, `RaiseButton(child: Text('Add Product'),)`  however we also need to add one other important argument and we can see that we get some green squiggly lines which tells us that ::the parameter onPressed is required::. And ::this `onPressed ` now actually expects a function reference::, so we can add an empty function here like this and this is a so-called anonymous function,  it's just the argument list and then the function body, both is empty which leads to this looking a bit strange, we will populate it with life soon, for now this is just an empty function that does nothing that will be executed when you press the button.
[image:366D2F9B-8BA2-46CB-A564-B9C3E89C388D-67708-00005569661E7DA8/Screen Shot 2018-10-02 at 9.28.34 PM.png]


If we now save it and let it hot reload, we see that button at the top here and we can click it and we actually see that ripple effect so this is working. 

### add style on the button by using container widget to wrap the button and add with margin
Now this button is sitting at the very edges of our page here, we can change this by wrapping it with another widget which you saw in the widget catalog, the container widget. ::The container widget takes a child and that child will be our button so let's grab that and add it here, reformat and and container widget also allows us to add a so-called margin. The margin is simply some space around that container::, so around the button therefore, we add it ::by using another class provided by the flutter material package, the EdgeInsets class which has an all constructor called with .all::, where you then pass a number, a float to be precise which is a number with a decimal place which defines how much space you want to have in all directions, for example 10.0 pixels and these will be pixels automatically adjusted to the device pixel density.
[image:891400DD-2A9D-4ED6-BF24-13DCF7E78C6F-67708-000055695E8608B6/Screen Shot 2018-10-02 at 9.34.20 PM.png]
If we now save this, you see there’s some space around the button. Obviously the button doesn't do anything

so let's ensure that it does something.
# Creating a Stateful Widget
### the difference between statefulWidget and statelessWidget
::StatelessWidget is like the dumb component in react, it can only accept the data but can not change it. StatelessWidget cannot change the state.::

::StatefulWidget is like the smart component in react. It can change the state.::

We added this button but if we click it, it's not doing anything because our function here is empty. Now this button should actually add new dummy products for now, which we then render below the button by adding more and more cards here.

This course for one raises the question, how do we add more cards here but obviously another important question is how do we actually create new cards upon a button press?

Well in this function here, ::we want to change some data which actually then is dynamically turned into a list of such card widgets. What you typically would do is you manage a normal list of data which you might also fetch from a server and then whenever build is called and it will be called by flutter when the app is first loaded or when some of your data changes,  then we want to use the data we're handling in onPressed and recreate a list of cards here which changes therefore with every button press.::

This can be done in a ::stateless widget:: though, a stateless widget is a very simple widget that does one important thing, ::it's able to accept extra data,:: we're not doing this here yet. but then it simply has a build method that builds some widget tree, it can't work with internal data, it can't change such internal data therefore ::and it will not recall build if some data changed because it doesn't work with internal data. It will only call build if it is created for the first time or if some extra data widget receives changes.::

Now since we can't handle data with stateless widget, it's the wrong widget for our purposes here therefore we need a stateful widget.

::state can simply be translated as data you're working with, data which you store in the widget and which you also plan on changing. that is state.::
---
# How to create StatefulWidget
[image:E51A046C-D35B-4E18-90AC-6A8764456577-67708-00005569598C7A1C/Screen Shot 2018-10-02 at 9.40.17 PM.png]
[image:06CF3B1C-322D-419F-8B09-BCB3279371AB-67708-0000556958279C62/Screen Shot 2018-10-02 at 9.40.21 PM.png]
1. First of all, by changing statelessWidget to a statefulWidget

2. Then we add a concrete implementation of stateful widget create state.  A stateful widget is indeed constructed different to a stateless widget.[image:122B8C19-34D2-460A-AF2D-63955271D366-67708-0000556963432E9E/Screen Shot 2018-10-02 at 9.53.12 PM.png]
Now this is how the createState function should look like, as you can tell ::it returns a state object:: and here again we get these strange angle brackets, this is called a generic type, it allows us to pass extra information to another type and here it tells us that this state object will belong to this stateful widget or to a stateful widget in the end. ::Because the way you work with state in flutter is that you actually create two classes which will work together and this is kind of the connection createState will return a new state object with a state that is configured to work with a stateful widget.::(/ the state object, the state class by the way is coming from the flutter material package/) ,

3. ::create that second class, here you should call it _MyAppState,::and it need to extend the built in `state` class, enter an opening curly brace thereafter and leave your build method here because the state class provided by flutter actually has a build method.
[image:1CE25EA8-947E-42B4-BEB5-15410133CA14-67708-000055695BFFCA38/Screen Shot 2018-10-02 at 10.01.32 PM.png]
/now the underscore is just a convention for classes that should not be usable by other parts or other files but only from inside this file and flutter will actually respect this. If you later work with multiple files, you will be able to import MyApp into your file and use it but not _MyAppState, let's ignore this for now though, this is something which will become clearer later./

4. Now we just need to tell flutter that this _MyAppState class belongs to MyApp widget and we do this by adding these angle brackets after state, we add the name of the class to which this state belongs and now the connection between the two classes is set up.
[image:DA7682F8-26B9-4992-AA07-7EE1857ECF54-67708-00005569587E870C/Screen Shot 2018-10-02 at 10.13.38 PM.png]

5. Now `MyApp` needs to return `_MyAppState()`,  and instantiate it by adding the parentheses. 
[image:F488EE84-0485-4240-9DB7-016E7186A911-67708-0000556960857804/Screen Shot 2018-10-02 at 10.14.55 PM.png]
Now the stateful widget creates a new state object based on our own class which extends state and has the build method and flutter internally will call that build method for that stateful widget.

::And this is just a set up you have to memorize, this is how stateful widgets work in flutter.::

The question that remains of course still is how can we now actually work with that and change our list of products, let's have a look at this in the next lecture.

# Managing Data Inside Stateful Widgets
[image:597DC1F5-0793-4B89-B4E6-12FAF6A8A076-67708-000055696B313A48/Screen Shot 2018-10-02 at 11.08.06 PM.png]

[image:5F5D99F7-20E6-4444-AB1F-F44F5C966D6A-67708-0000556954E9E2E6/Screen Shot 2018-10-02 at 11.12.51 PM.png]

[image:776B0161-EEB8-44BE-812A-2F743193F022-67708-0000556964B9BC4E/Screen Shot 2018-10-02 at 11.07.05 PM.png]

We created a stateful widget but the question is how can we now manage and change data inside of it?

We do it in a very simple way, we add a so-called property to the _MyAppState class here, for that let’s add something inside of the class definition, let's add a property named products, the name is up to you though. Now products will be a list of let's say strings for now, so just a list of text, since dart is a strongly typed language let's add the type in front of it and the type is list, this is a type shipping with dart, it is what I called an array earlier, it's called an array in many other programming languages, in dart it's just list, something like this column is a list here.

This is a list of widgets, now list is a generic type so that we can define a list of what it will be and this should be a list of strings so let's add string as a type here and now products has to be such a list of strings.

This defines the property but it's empty right now. Now I actually don't want to start with an empty list instead let's create a new list by adding an equal sign and then on the right side, the square brackets and in there, let's add our first item, now let's name this food tester, food tester obviously a bit of a more creative product, I'm imagining some tool which we can point at our food to test its ingredients, test if it's passed its time, if we should still eat it, something like this, simply a bit of a more fancy product, we will go back to more normal products throughout the course though.

But let's not worry about the product for now, now we want to render that to the screen by converting it into a list of such cards down there and we can do this by going down to our widget tree here and remember that our children here, that's a list of widgets, still instead of using card like this, I can reach out to my products now. By the way products is now a property of our class since this is a class only used in that file and this is a property only used in this class, you should also add underscore at the beginning of the name, that's just another convention.

So let's use products now like this down there, by the way if you're coming from another programming language like Javascript, you don't use this.products or anything like that, you can directly reference it and here you can call a method on this array or on this list by adding a dot and then there for example is a map method.

This allows you to transform every element in that list into a new element and return it and we would return it here as a new value in this list in our column. Map takes a function as an argument which holds the transformation logic, it will receive the element as an input and then you can use the fat arrow notation here to define what should happen with that element and here what should happen is that it should create a card based on that element.

So let's grab card here, let's add it in here, remove that comma at the end and now what this does is it takes every element in the product list and converts it to a card. And now we can also output the text which is actually stored here because remember, element will just be a string because our list is a list of strings.

So if I go down there, I can type element here referring to this element and it will output it. One important note though, you need to wrap element between parentheses so this is the argument list for the function, this is the function body, It's one statement, it spans across multiple lines but ultimately it's just the creation of card so it's one statement and we pass element in there and we output it as text.

Now we still have red squiggly lines there because this actually returns a type iterable and we need a widget here, now we can't convert a list into a single widget so what I will instead do is I will add another column, so we already have a column with a container and now with another nested column which is absolutely fine.

So another column widget here which will have children and the children here, that should be our list of cards
so let's grab that code and replace that widget array here with that product list. This still won't work though, we need to convert it to a list by calling the toList method here. And now with that we're done, now we added a new column with its children argument and there we have our products which we map into a new so-called iterable with our product cards and then we call toList here to convert this to a list which can be used.

Now if we save this and we go back, we again see our card and now we made a huge step forward to connecting this button to adding more elements as you will see.
---
# Adding the Stateful Widget & Lists
So we spent a lot of work on this strange convention and I will already say that there is a better way of rendering such lists by the way.

For now, let's stick to this one and let's make sure that our button now finally does something, ::this button should now change products and I said that when this data changes, build will be executed again and then it will actually again take the updated products list, map it into an updated list of cards and render this to the screen.::

So theoretically if we change products, we should also get more cards. So what we can do here is we can reach out to products and then there is the add method to add a new value since this is a list of strings we can add a new string, for now a hardcoded one.

So we worked with our awesome food tester, certainly a creative product 
now let's be even more creative, let's take the advanced food tester, our super tool which allows us to find out even more helpful information about our food, add a semi-colon at the end.

If you save this and you add product, nothing happens right, the reason for this is that this is not how it works, it actually will change products and I can prove this to you by calling print products here, this is just a debugging function which will print it to the console here at the bottom and if I now save this and I click this one time, you'll see at the bottom there is food tester and advanced food tester

yet we only see one card here. The reason for this is that updating data like this will change it but flutter won't recognize that, it by default doesn't watch all your data fields here and then re-render whenever some of them changes, this would be very inefficient instead ::you have to tell flutter that you're changing the data in your stateful widget or put in other words that you're changing its state. And you do this by calling a special method, the `setState` method, it's provided by the flutter package and `it requires an argument which is also a function` and in this function here, you execute the code which should change your data and lead to a re-rendering of the app.::
	[image:25E1B182-2DCF-41A8-98AE-A6588D3693C7-67708-000055696A3103A5/Screen Shot 2018-10-02 at 11.16.57 PM.png]

So here I call products.add, don't need to print anymore and now if I save this, you will actually see that automatically you see that second card and a warning that it goes beyond the scope of your page, this however is just a feature of hot reload, it essentially calls setState for you.

So let's do a full reload and you can do this with control F5, this will restart the app from scratch and now if I click add product, you see the card appear with that warning and I did mention that there is a better way of rendering a list because this list by default is not scrollable which is the issue here but at least it worked, at least a new card was added.

And whilst we can improve that list regarding the scrolling behavior, this already shows us how we can work with stateful widgets.

Now let's mix that, let's create another stateless widget and let's see how these widgets can interact before we then of course later also fix that issue regarding our sub-optimal list.

# Splitting our Code Up
We learned a lot about the widget basics, now it's also time to keep on practicing that. And one thing you typically do in flutter apps is you don't put all your code in one root widget like in a stateful widget or its state to be precise but you split your app into granular pieces, into multiple widgets and you also distribute these across multiple files so that each widget and each file stays readable and maintainable.

So how can we do that with this widget?

Well we can split it up, we've got of course a stateful widget which we need to manage our cards, our products. But if we are honest, this stateful widget is really just starting here where we render that column of cards, the entire rest, the material app, the scaffold, the app bar and even the button here that is just a stateful widget, it doesn't change.

Yes the button is the part which triggers a state change but we probably can do something about this too but in the end the button itself does not change.

1. create a new file here in the lib folder which we name ::products.dart.::

/Now the file name is up to you but the convention is to write it all lowercase, if you have multiple words, separate them with an underscore and of course always end with .dart because that's the programming language extension./

2. Now in that product.dart file, I want to render that list of products, so that column here. So we can essentially grab that column,
[image:16E2A5E8-A2E2-48FB-AD01-013A077BDFD4-67708-0000556954B21E6E/Screen Shot 2018-10-02 at 11.20.12 PM.png]
make sure to select the right code here and cut it, not the column which also holds button But just the column which holds our cards.

3. go to the product.dart page and let’s  ::create a new class and I'll name it products::, like this.

Now I need to extend something which is imported from flutter again and that's important. You need to add that import to every new file because every file works standalone, so to say so just because you imported the flutter material package here doesn't mean that you don't have to import it here again.So lets  `import package:flutter/material.dart,` now we want to create a widget here, I simply want to outsource that column logic into this widget.

::The question is do we extend a stateful or a stateless widget here?::

4. You can build it in both ways ::however actually, the more elegant ways to use the stateless widget here and now this can be confusing:: because I just said that this column card is the only thing which changes and that's correct ::but the change of data actually happens somewhere else, you could argue. The products widget here just receives a list of products and that list might be changed but it can be changed outside of that products widget here,:: let me show you what I mean.

5. Let's first of all add that build method, I'll take some IDE help here, type build, get that autosuggestion and hit enter and it gives me the entire method and in here, I will return my cut code
[image:CC9B679E-F8D5-43BD-8F65-2B566C1AA7EC-67708-0000556956B92996/Screen Shot 2018-10-02 at 11.23.15 PM.png]

so the column with the products and so on and obviously products doesn't exist here, that is something we’ll have to fix. But this is the widget code I want to use here and that comma has to go at the end,
---
### the question just is how do I get products into my products widget and that is what I meant. 
This is data which we can actually receive from outside so from the place where we will eventually use our products.
1. we can do this by ::adding a so-called constructor:: here, and then adding parentheses and now you can add curly braces to define which code should run whenever this widget is created.

2. ::we add a constructor by repeating the class name::
 `constructor's name is same as class name same in java`

3. ::The constructor:: also has some other features though and we need one feature only, it ::should be able to accept a list of products,:: you can name this argument whatever you want but I'll name it products and ::then I want to store it in a property of that products class so that we can use that property down there.:: For that, I'll use, I'll add a new property here, my products property which will be a list of strings again, that hasn't changed and it's uninitialized initially so there is no value assigned but then I want to store products in this products property and ::dart offers a convenient shortcut, if I type this.products, then it will automatically take the incoming argument and store it in a property with the same name `products = this.products`so in this product property::, that's just a shortcut. Now we need to add a semi-colon here after the constructor
[image:EACED3FB-3E75-4D75-BDF4-38CEF4A74C5C-67708-0000556957920492/Screen Shot 2018-10-02 at 11.27.43 PM.png]
and now ::this will allow us to pass data into products through its constructor, bind it to to products here:: 

/and then remove the underscore because it's now just called products, like this./
---

We do so by adding a special keyword in front of it, the final keyword, this is a dart feature which simply tells dart and therefore also flutter that the value of products will never change, it will be initialized once with the value we get from the constructor but thereafter, we will never change it.
[image:1A9A5C65-DEBE-47AA-849C-381923022785-67708-00005569613B888E/Screen Shot 2018-10-02 at 11.30.57 PM.png]
::It would have worked without the additional final too but just as with types, this leads to cleaner code and makes it very clear that this is a value which is only set from the outside and if new data is passed in from outside, it will simply replace the old value, not change it, replace it and then call build again with the replaced value.::

This is how it will work, this is our products widget. Now in the next lectures, we'll start using it.
---
# Creating the "Product Manager" Widget
We created that products widget, let's now go back to the main dart file where we removed that code for rendering the cards, here

::I now want to also strip out another part to put it into its own widget again and that will be this container with the button.::

I will ::create another new file which I'll name product_manager.dart::, the name is up to you but in there, I plan to well manage my products so again let's import package flutter material, that is the package you work with the most as you can probably tell by now. Let's create a class which I'll name ProductManager to fit the file name but again written in the form you should write your class names, capitalized words and then ::here I extend a stateful widget because here, I now plan on managing my list of products and changing it.:: The stateful widget needs to create state method which I add with the help of my IDE and therefore we need to add a second class, the _ProductManagerState class which extends state which is a generic type linking to ProductManager. This has the build method, again added with the help of my IDE and then in here,
[image:0FEAE6C4-FBE3-4A7C-98C2-4D25B3828AA8-67708-00005569546D298C/Screen Shot 2018-10-02 at 11.35.18 PM.png]
 I want to return so in the build method, I want to return that code I just cut out with the container here. Here,
[image:94BF3CE9-4EDE-4B5F-8D96-58D5BE8A8356-67708-000055696B90BF72/Screen Shot 2018-10-02 at 11.36.08 PM.png]

I indeed also want to copy and paste my products list so let’s remove it from _MyAppState and add it to the _ProductManagerState
[image:B5745DE9-D638-449F-9B7F-AEE07945156E-67708-000055695B887B33/Screen Shot 2018-10-02 at 11.37.01 PM.png]
here, this is the list which we change with a click of the button still so this hasn’t changed and remove that comma here at the end, reformat, this is this now our _ProductManagerState. 
Now of course we should use it, we should create it here so return _ProductManagerState. That already is it,
[image:3240A07E-21DA-4084-9F5E-C79EE88D8FF7-67708-0000556961E4ECF7/Screen Shot 2018-10-02 at 11.39.48 PM.png]

this is the ProductManager stateful widget created however it's of course missing our products widget, we're still not using that. I want to use it here in the product manager below my button here of course, so let's actually return a column here instead which has children, one of them in a list marked with square brackets, one of them is the container, after the container we close the list and the column widget but we add another element after our container and that should
[image:72305FAB-22EC-4B9F-ABFA-155ED4733865-67708-00005569690836F1/Screen Shot 2018-10-02 at 11.42.44 PM.png]

be our product widget. For it to be usable in this file, we need to import it.

Now it’s a good practice to separate that import from package related imports so separate imports from your own files, from the imports pointing at package features.

So here I will then import and to import something from your own file, you just add ./ if it's in the same folder or if it's in a folder one level above, you add ../ to navigate into there, in our case it's in the same folder ./ and then products.dart with the file extension, like this.
[image:DDF0DA94-EF4B-43B5-B14B-B4423EB7E918-67708-0000556965BE2B4A/Screen Shot 2018-10-02 at 11.43.40 PM.png]
Now I'm importing products.dart and now this allows me down there to use products like this, so now let’s use products and if we have a look at products, we expect to get a list of products that should be rendered here, now that of course is our _products property here which we change with a click of a button
[image:EAAE18A4-62B7-4055-9B27-6282BBA18005-67708-00005569594B059D/Screen Shot 2018-10-02 at 11.45.00 PM.png]
so we pass that down to products and since we call setState when changing it, it will re-render that build method here and therefore also re-render products here and pass down the updated products list which will lead to this build method in the product widget being called again too.

So this is our product manager, with that changed ::let's go back to the main.dart file and let's use the product manager there.::

Now we're not handling any state in the main.dart file anymore so we can turn this stateful widget back to a stateless widget, remove that create state method, remove the state, _MyAppState class down there and just add the overwritten build method to the _MyAppState widget again, the body is no longer a column instead here, I now simply want to have my product manager, for that let's import it pointing at the file like this,

let's import ProductManager, create an object based on it by adding parentheses.
[image:D09C36D8-C515-40C5-BECA-FA4547C01D3B-67708-000055695E17C060/Screen Shot 2018-10-02 at 11.47.07 PM.png]

And now if we save all of that and maybe let's do a full restart with control F5 to remove all old state we might have loaded, we see the same app as before and it behaves as before also with that error still but now we have a cleaner structure with multiple files, multiple widgets which would also be reusable which is great but which also make your code easier to manage because now each widget is relatively short and easy to understand and this is how you want to structure your flutter apps. You build user interfaces with these widgets, with these user interface components and you want to split them up across multiple files, you want to work with stateless and stateful widgets, use as many stateless widgets as possible and have a few selected stateful widgets which actually manage your data and change the data like our product manager does in this case.

# Passing Data to Stateful Widgets
We spent a lot of work on building these widgets and we're almost done with the core basics, there are ::two more things I want to dive into:: and ::one of them is what if our stateful widget also wants to receive some data from outside::, let me give you a concrete example.

We get the food tester product we're starting with in the ProductManager, now of course we can set it up like this, it's just some dummy hardcoded code anyways. But ::let's say we actually don't want to start with it but we want to get that starting data from outside because we want to define our initial set of products we're starting in the main.dart file, maybe because we've fetched it from a server here and we will do all these things throughout the course, we'll reach out to a backend and so on::.

::So we want to send that data into the product manager from inside our main.dart file,:: we learned how we can pass data down, we can pass it as an argument like we passed products to our products widget and we accept it in the receiving widget by adding the constructor function, now we can also do that with the product manager here. The product manager and here it's important that ::you use the class that extends stateful widget not the state but this one is the class you use in your widget, right here we use product manager so that you use this and then you add constructor by repeating the class name and adding parentheses.::
[image:13CC7904-4AF8-4B35-AFB1-F792631C091C-67708-000055696022ABD4/Screen Shot 2018-10-03 at 2.34.47 PM.png]
Now this constructor here should now be able to receive an argument, in our case, the `startingProduct ` let’s say, now I want to store that and I will store it in a property which is of type string, starting product and again we can use this trick or a shortcut with this.startingProduct to assign the value.

Now we got the green squiggly lines that should be immutable class, wait what, isn't it a stateful widget? ::Stateful widgets are all about having state where the data can change, right? That's true but it changes in the state class not in the widget class,:: the two are linked together but it still is a technically separated object so the widget is a technically separate object. ::So here we actually have to add final, starting product is something we receive from outside and the only way to change it is to recall build in the parent component and therefore recreate that product manager, pass a new value for starting product into it and then assign that new value here.::
[image:8939F998-1B95-46CD-B259-A4CF9CDFBA89-67708-0000556955A7CFA1/Screen Shot 2018-10-03 at 2.37.11 PM.png]
That’s all fine.
---
### the question just is how do we use that starting product now? 
Because we got it in the product manager but we need it in the _ProductManagerState. 

::There is a useful keyword, a property which is provided by the state class, which remember is provided by flutter material,:: so ::a helpful property which actually gives you access to all the properties of the widget that belongs to the state:: because I told you they are linked together and flutter does some behind the scenes work for you. ::That special property is named widget and it allows you to access the properties of your parent widget or of your connected widget, like starting product.::
[image:90C433B9-E75D-47C8-900B-76461EB7D4D9-67708-000055696D5F86E8/Screen Shot 2018-10-03 at 2.48.44 PM.png]
The problem just is you can’t use it here when you're initializing properties, you can only use it in methods of the _ProductManagerState, simply due to the way that widget property is initialized. That's no problem though 
### because that is the second thing I wanted to show you,
::the state object or class also allows you to implement some special methods, the init state method for example.::
[image:70E55E60-A4A1-4BC8-9CA8-E576687623C0-67708-000055695B0B0568/Screen Shot 2018-10-03 at 2.49.14 PM.png]
Again I let it autocomplete by the IDE and it has one interesting thing, it’s also overwriting a built in method of course but the interesting thing is that super thing. ::Super always refers to the base class you're extending so to the state class here and it simply calls initState on that base class to make sure that it is called there even if you overwrite it, so don't delete that and make sure to call it at the end after you executed your code::. initState will be called whenever this state object is created, is initialized so whenever this product manager widget is drawn onto the screen for the first time you could say and here I can reach out to products and call add and the value I want to add now is using that special widget property I was referring to and there, the starting product.
[image:B0DFB66B-7318-4B3B-B448-A8F1284BEB3D-67708-0000556955E96266/Screen Shot 2018-10-03 at 2.51.18 PM.png]
So widget is provided by the state object, gives us access to the connected stateful widget and to its properties and therefore I can safely access starting product here, add it to my products and initState will execute when this state is created, so when build runs for the first time, that code will already have been executed.

Let's see this in action and for that, we need to go back to main.dart and pass that starting product to the product manager because we are expecting it as a value there, 
[image:EE9063FC-CCBB-4A07-B2BB-61BE44D45182-67708-000055695A5CB6EE/Screen Shot 2018-10-03 at 2.53.33 PM.png]
so food tester and then let’s do, after saving let's do a full restart with control F5 to flush all existing state and now if I add a product, this still works but I don't even need to do that, you will see that food tester is displayed here and that of course means that our logic is working, we are passing this down and we are accessing it with widgets starting product.

And ::if you're wondering why we are not calling setState here, even though whoops setState, even though we are changing our state and you are right if that is your assumption. Well the reason why we don't call setState here is because as I said initState runs before build runs and therefore there is no need to tell flutter that the data changed, it didn't render something to the screen already so there is no need to re-render.::

So that's important to know, there is initState, some lifecycle hook as it is called, a method you can use to execute code when your state object is constructed and there is this widget property provided by the state which gives you access to the connected stateful widget.

# initState() and super.initState()
[image:2AA70448-2829-4267-BD7A-59B9B982C1DB-67708-0000556953E43EFA/Screen Shot 2018-10-02 at 4.26.41 PM.png]

# Understanding Lifecycle Hooks
Before we now move on and learn how we can debug flutter apps and finally also fix our broken list here, before we do that let me quickly show you these lifecycle hooks I was referring to you.

[image:680B0A7C-2080-44B7-A3E2-D6690A80356C-67708-00005569638AFCE6/Screen Shot 2018-10-02 at 4.28.45 PM.png]
It's first of all important that there are stateless and stateful widgets and that there is a difference of course, stateless widgets are used to create a widget where you render something to the UI and you can pass data into them, that is what we're doing with the products widget in our app thus far. and that data we're passing can change externally and that's also what's happening in our app. We change it in the ProductManager widget and the UI of that stateless widget gets re-rendered when the input data changes.

Now a ::stateful widget:: also is all about returning a widget where we render the UI where we, as you saw in the last lecture can receive input data which might also change externally, we don't see that here but that would be possible and then we also ::additionally have that internal state which we can change from within the widget which also will lead to a re-render so both external data changes as well as internal state changes will lead to the UI being re-rendered.::

[image:623D0947-5C7F-423F-8F16-516842CB604B-67708-000055695637B0AD/Screen Shot 2018-10-02 at 4.30.19 PM.png]
Widgets have a lifecycle, a stateless and a stateful widget differ in the lifecycle though and ::with lifecycle, I mean methods you can add to your classes which will be executed for you by flutter.:: 

### A stateless widget:
A stateless widget has the ::constructor function:: which you can execute and then it has the ::build function:: to draw something onto the screen, that is all, these are the two functions which will be called in the life of a stateless widget, build can be called multiple times whenever the external data changes. 

###  A stateful widget:
The ::constructor function:: is also available in the stateful widget but there, we then call ::initState:: thereafter before we then call ::build:: for the first time. We can then also call ::setState:: from inside this build function or to be precise, most of the time you call it when something happened, when a button was pressed but also for example when an HTTP request finished and that would then rebuild so it would call build again but you can also have some changes to your external data in which case ::didUpdateWidget:: would execute so if you passed data to your stateful widget as we are doing it with the starting product and you would change that data, then didUpdateWidget would execute and then build would run again so it's a more complex lifecycle but why don't we just have a look at this in action.
---
Back in our code, let's start with the stateless widget, the product widget.

There we have the constructor and we're using the shortcut to assign a value to products now we can re-add a constructor body because this is a normal function in the end, we have to remove the semi-colon then though and now this will execute whenever this product widget is created.
[image:0BBDCA21-1F6D-4983-A98C-449D84095522-67708-0000556969ED8A78/Screen Shot 2018-10-03 at 3.26.13 PM.png]
So I will print something to the console here and I will print products widget constructor so that we can quickly see what was executed.

I'll copy that line and go to the build method and in that build method before we return, we can of course then execute code in there, here I will also leave the product widgets stamp but then build so that we can see when this executed.
[image:62EE536F-472B-4D6B-8249-592F3FD8E83C-67708-000055695CD3F3EC/Screen Shot 2018-10-03 at 3.27.16 PM.png]

With that if we save that and we completely restart the app with control F5, then we see our app here but in the terminal down there, we see that the constructor gets called first and then build gets called.
[image:402E4D56-98BA-4197-8123-8B1D31F23D53-67708-0000556964686BA7/Screen Shot 2018-10-03 at 3.28.08 PM.png]


for now by removing that image, to save some space so that we can fit more elements onto the screen before we get an error. Let's perform a full restart again, we then see constructor and build. Now if I go back and click add product, we don't see anything here but if I click it again, simply because there's a delay of one click for the print statement there always, we now ::see constructor and build is called again and that's important both is called again because it really reconstructed this entire widget when in the ProductManager::, we changed our products which led to this build method being executed again which then led to the products being recreated.
That's the first part but let's also see what exactly happens in the ProductManager. 
[image:BFD9652B-52AA-4AA9-916E-D1897AA4CC5A-67708-000055696DCA088C/Screen Shot 2018-10-03 at 3.34.27 PM.png]
So let's first of all go to the ProductManager constructor so of the stateful widget, let's add a body and let's add our print statement, product manager widget constructor, let's copy that. Let's then maybe toss this line into create state, so that we can also see when this executes and let's then go down to initState in the _ProductManagerState now and let's add this line here _ProductManagerState initState, copy that line and let's go into the build method here to also print when we build here.
[image:D5DAD816-DAE2-46E1-9E30-843A8BC1E9D1-67708-00005569683CBD56/Screen Shot 2018-10-03 at 3.36.36 PM.png]
Now let’s save that and again let's do a full restart and now you already see, this actually executed just as before, before this restarted app gets printed because it happens before we see something on the screen for the first time, which is why we had that delay of one extra click before, it's not actually a delay it's just that the restarting is only done once we got something onto the screen.
[image:B3F4B899-1437-4FC9-96B3-B35A9C34F04D-67708-0000556963CF1AA1/Screen Shot 2018-10-03 at 4.22.32 PM.png]
But now we can see here, this is actually where we start, we call the constructor of the product manager which makes sense because in the main.dart file where we start, we initialize or we add the ProductManager before we use products because products gets used inside of the product manager. So we call the constructor of the product manager, we call create state, that as you would guess creates the state and therefore initState is called. Then we call build in the state and since inside of build of our state, we create the products here, we then call the constructor and the build method of products, thus far this should be clear.

Let's now go back and ::click add product:: one time, if we go back we now see something happened, this is where we left. Now ::_ProductManagerState build was executed again because of setState, this does not reconstruct the product manager widget which is why we don't see this constructor or create state being executed again but it did re-execute the build method of the state::.
And since we re-executed this, products was rebuilt and therefore the constructor and the build method in the product widget was called and ::by the way, all that rebuilding happens in a very efficient way. Flutter takes care to not just redraw the entire app but really check what needs to be changed so even if build is executed, it compares the new and updated UI it will draw to the old one and only change the parts that need to be changed, to make sure that this is done in a very performance efficient way.::

This is the lifecycle you should understand, now there's one extra thing I want to show you as part of that lifecycle, in the ::_ProductManagerState here you can also add the didUpdateWidget method::, this will be executed when ever your connected widget, the product manager receives new external data.

Now in our app right now this is not happening, let me still add a print statement here, didUpdateWidget and by the way, please recognize that we also get old widget which is the equivalent to that widget keyword which we're also using here but now not referring to the updated widget with the updated external data received, you can get that updated data on the widget keyword but instead the old widget, so the data as it was in the old widget just in case you would need that, maybe to compare the updated data to the old one, anything like that.
[image:71C0EA53-A2D6-464B-A8F0-315E34DF5447-67708-000055695A188153/Screen Shot 2018-10-03 at 4.33.47 PM.png]
The cool thing is if we do a hot reload, we actually see didUpdateWidget is being called here because a hot reload in the end just calls setState for the entire app so it fakes this starting text, this food tester being changed even though it didn't, it fakes that this happened because it calls setState for the entire app to re-render it and therefore we see didUpdateWidget is called before we again build in the _ProductManagerState. So this can be a useful place if your state belongs to a widget which receives external data 
that might change if you want to do something upon such a change.

# Diving into Google's Material Design
That was a lot about widgets. ::Now all these widgets use the material design, now what is the material design:: then?

It looks something like this you might notice, it's Google's design system which you see in a lot of Google applications, both on the web and on mobile. Now whilst developed by Google, it's not just Google's design for everyone instead material is a design system with a lot of guides, best practices, color combinations that work well and certain looks and feels of user interface components that you can use for mobile apps and web apps and desktop apps everywhere. ::You can use it and it's of course embraced by Google but it's also opened up to be less Google-ish and more customizable so therefore using it in iOS apps is also great and flutter actually use this material design.::

You can still adjust your look to also look like iOS cupertino styles and that is something I will also show you later in this course but we will start with that material look because it's important to understand that ::it's not Google's style for everyone, it's indeed highly customizable as you will learn.:: And material design as I mentioned is built into flutter and therefore, we will use it and we will get this nice design, I like it at least for the app out of the box without us having to do any design work.
---
Now I mentioned that ::we can adjust our theme and that we can adjust the looks::, now we can do it in the ::main.dart file:: in our MaterialApp, there we can add another argument, the theme argument and we pass in a theme data object, this also is imported from flutter material. Theme data takes a bunch of different colors and styles w can set, like for example very important, the primary swatch. A swatch is a set of colors where we define one color and all the colors will be inferred automatically, that's very convenient.

We can assign a color by using colors, a special object provided by the flutter package and there we can access so-called static types so basically properties we can access without instantiating colors so we don't add parentheses here, we call something directly on the class and here we can for example add deep orange. If we now save this, you'll see that the app bar automatically is orange and it will not just be the app bar, it'll be a bunch of other things in the application too, for example if we want to give that button that look, we can go to the Product Manager which is where we use that button and in there, we can go to that button and there we'll have a color argument we can pass and there we can now use our theme by using a special object provided by flutter which is called theme which has an auth method where we now pass this context because this context stores meta data information like the general theme of our app, so we passed it to theme and then we can access for example primary color here and if we now save this, this button now also is orange.

So that's pretty convenient, let me by the way also re-add that image because I don't care about the broken list anymore, just want to have that image back.

So that is how we can use the theme and we can add more than just the primary swatch, we can set a dedicated accent color for example, I will use colors deep purple for this course because in my opinion, purple fits really well to orange.

You can also set the brightness of your app, you don't need to because the default is all right but there you can access the brightness object and there either dark or light static property.

If I choose dark which is not the default, you see now we have a dark look, dark background, primary color also was overwitten, if I choose light however then we're back to the default mode where we use the colors where we have a white background but you can use both which is really convenient. And you can do more, feel free to play around with different things you can set here, most of them should be pretty descriptive especially once you're done with the course.

So this is the material design and how you can adjust it, you can also adjust it to look more like iOS, with less drop shadows and so on but that is something I'll come back to in a dedicated module later in the course.

# Understanding Additional Dart Features
With the themes added let me come back to dart, to the language we're using because with the themes, we use these static properties as I said. Now what is a static property? A static property looks like this, we can have a look at the colors object by holding command or control and clicking on it and most IDEs should offer such a feature.

This lets us look into the file which is added by the flutter package and here we actually see how such a static property is defined, with the static keyword in front of the name and const is for now let's say the same as final, it's a little bit different but in the end it means it's a value which won't change.

And this is how we define a static property named transparent and here we get all the properties we can import black and if we search for it, we'll also find deep orange, here it is. There we get the static constant of type material color which is just an internal type, deep orange.

So this is another feature of dart, we can define static properties which are properties we can import from a class without instantiating the class, so without executing the constructor.

Now one other feature we already used but which I also want to show you how to create it on your own are named arguments.

We're using it in the main.dart file here for example, the arguments we passed to theme data, they all have a name, name, colon and then the value for the name.

Now thus far, we in our constructors for example and in our methods, we only use positional arguments like in the ProductManager. The product manager constructor here, this starting product is a positional argument because the first value passed to product manager so in the main.dart file, this string is stored away in this starting product.

Now if you only got one or two arguments, using that makes sense but maybe you've got multiple arguments and you want to target them by name to also allow you to not set values for some of them, then you can wrap this in curly braces and now it already is a named argument, just as easy as that.

Now we can pass a value by targeting starting product here then a colon and then the value, so now we're targeting this argument named starting product because we chose the name here and we passed a value to it and set it to this final string here.

We could also set a default value by adding an equal sign, time to switch the product and let's move to a sweets tester. Now the sweets tester as the name suggests is a specialized tool for testing sweets for their ingredients, how healthy or unhealthy they are, things like that and now this would allow us to actually omit this value.

Before I was getting an error, now this is perfectly fine because if we now do a full restart, we see we start with sweets tester but we can overwrite it by reintroducing our targeted named argument and now if we do a full restart, we start with food tester again.

So optional arguments, that's also something you can do. You can also set optional arguments for positional arguments, like for our products here let's say, if we wanted to start with an empty list here by default, you can add an equal sign and then the value you want to start with.

If it's optional however, you also need to wrap the entire argument assignment here with square brackets for named ones use curly braces in both cases, for positional one only optional ones are wrapped but then with square brackets. Now here I'm getting red squiggly lines that this must be a constant and that's a special dart feature again, we have to add the const keyword here which means this is a list which can't be changed so now you can't call add or so on the products list here.

This is what we now store here and this means that now for product manager, we don't actually have to pass products, we can remove that, do a full app restart and then of course we don't render anything and our app is broken because we don't pass the products which we're changing down to the products but it would work.

It doesn't make that much sense here so let me re-add this because we certainly want to pass our products to the products widget here but you can use such optional arguments and throughout the course, we will build more and more methods and also use these features, I just want you to know what's happening behind the scenes here.

So that were some additional dart features which I've felt important to be mentioned at this point and whilst I do try my best to cover a lot of the dart features which we use here and explain them, if you want to learn everything about dart, also visit dartlang.org, that's the official dart language page and there you can for example take the language tour to get a detailed overview over everything you need to know about dart, how it works, which keywords it has, how you create variables, what this difference between final and const is, how you create classes, what generics are and so on. So check out this page if you want to learn everything about dart but again I will reiterate and explain the core concepts we are using when we are using them.

# Passing Data UP
Now that we also practiced the basics about widgets and how we pass data around, let's dive into an advanced example. We get our product manager and there in the widget tree, we obviously got our raised button, Now there is no specific need to move that raised button into a different component let me say that, it's perfectly fine to have it in the ProductManager but let's assume we have this button in a more complex widget, we also have a title there, maybe some image ::so for some reason we outsource this raised button into its own widget.::

Let's quickly do that. I'll cut it from the ProductManager and add a new widget and I'll name it product_control.dart for now. Now in the product control, I'll first of all `import a package and that package will be flutter and material.dart from that package`. So far that's not surprising and in there, ::I want to create a new widget, the product control widget and the obvious question is will this be a stateful or a stateless widget and it will be a stateless widget because all I want to do is I want to display that button, it will not even receive any external data, it will really just render this button statically so this is a widget where the widget tree will never change.:: Still it is a widget so we have to add this build method where we overwrite the built in one. And now in here I want to return the code I just cut from my product manager so let's paste it in the raised button and obviously I can’t call setState in here now, the advanced food tester, that's not going to work so what can I do about that? 
[image:B740EC6B-D384-4397-BB72-078EFF5D658B-67708-000055695D1A280B/Screen Shot 2018-10-04 at 8.38.41 PM.png]
Well ::the goal is to use that product control, that product control widget instead of the product manager:: so let's start and let's import it, so add import at the top and import my product_control.dart file 
[image:FBA660AB-EDD1-4DF7-A890-B1878BA68128-67708-000055695AA6A964/Screen Shot 2018-10-04 at 8.39.24 PM.png]
and then I’ll go down and in my build method here, I’ll use my product control like this, I’ll call the default constructor which we don't have to add explicitly, which will give me a new instance of this class and therefore this new widget object.
[image:36B710CC-F00F-4348-A8A4-4D650D07ACF6-67708-00005569630886A9/Screen Shot 2018-10-04 at 8.40.02 PM.png]
Now this would almost work but setState is still not an option here, now obviously you could say let’s turn the stateless widget here in the product control widget to a stateful widget and then we can add this state class and start managing the state. The problem just is I don't need the state in the product control, I needed the product manager because there I can pass it down to product, which is where I ultimately want to receive that.

So product manager should stay a stateful widget because there, I need that state because there I connect to a widget where I need to pass the information to. The products widget itself can't be turned into a stateful one because even though I need the product information here, I don't change it in that widget. ::So the product manager really is the connection between the product control and the products and that's the first important thing I want you to understand.::

::This is also a concept called lifting the state up, we want to manage the state in a widget which has access to all the widgets that either change it like the product control or require the widget state, the data we're changing, the products widget in our case. So the product manager is the connecting widget which reaches out to all these widgets that do change or need the state.::

::The question now just is how can I pass the information that this button was pressed in the product control up to the product manager so that they can then set the state in the product manager?:: 

Well for that, ::let's create a new method in the state object of our _ProductManagerState here::, I'll add it below my initState and didUpdateWidgets, I'll add a new method here and this method will not return anything so I'll add void as a return type, then it will start with an underscore for the same reason why products start with an underscore, its class which I only use in that file and I don't want anyone to import this class or directly access to methods or properties on this class, I don't want anyone to directly use that class except for the product manager widget here. So I'll start with an underscore in the name and I'll name it _updateProducts and the name is totally up to you. So _updateproducts in my case here and I expect to get an argument here and the argument should be the new product, let's maybe name it addProduct for that's even clearer. So ::here I will receive an argument, the product which I do want to add and let's also define the type here to write better code, let's add a string in front of the name to be clear that this method here will receive an argument which is a string.::
[image:E2626686-1CD6-4E78-AB65-592891D6D717-67708-0000556957149BA8/Screen Shot 2018-10-04 at 8.50.26 PM.png]
Now with that, I’m defining addProduct and now I can go to the product control ::and cut my set state code:: from there because I can't use it there anyways, this is not a stateful widget and ::move it into addProduct.:: And now here I don't want to add the advanced food tester but the product which I'm receiving as an argument. So in addProduct, I'm now calling setState and I can do that here because I am in a state object belonging to a stateful widget and I add the product which I receive as an argument.
[image:41D51FB2-347A-4E68-8A6D-D7770F7EE941-67708-0000556953ADF5B0/Screen Shot 2018-10-04 at 8.51.20 PM.png]
::The remaining problem is I want to call addProduct whenever this button is pressed but the button lives in a different widget, how can we solve that?::

That's the second important thing I want you to take away, ::lifting the state up was one important concept but now to give another widget access to a method in this widget, we can simply pass a reference down to the widget which should have this access.::

::So I can pass add product as an argument to the product control, please note I'm not executing it, I'm not adding parentheses,:: why? Because I don't want to immediately execute it, if I would add parentheses here, it would execute the method whenever the build method runs and it would only pass the return type of that method to product control which in this case is void. So I don't want to do that, I don't want to pass the return type, I want to pass a reference to this function, so the function is not getting executed yet, ::we're just passing the address to the function down to the product control.::

Now I can ::go to the product control and expect this as an argument to the constructor so I will add the constructor here and I want you to receive that function reference and store it in a property of that class,:: ::for that I'll create a new final property which should never change except for when this widget is recreated and I'll name it `addProduct`,:: you can give this any name you want and you see it's not the same name as in a parent widget though that would be possible but here I don't have the underscore and I really just want to make it clear, ::this can be named how you want.::

::I can also define a type and the type will be a function here, function is a separate type in dart and it simply well is what it sounds like, it means in this property, we'll store the reference to a function and that means that now here, I can say this add product so whichever argument I receive in this constructor will be bound to this property.:: 
[image:AEE048BD-65C7-40F9-A262-44B1F024BC26-67708-00005569552CF0FC/Screen Shot 2018-10-04 at 9.15.04 PM.png]
And now we have access to a function in this widget, even though we don’t define the function in this widget and this means when this gets pressed, I can execute addProduct and then also of course pass on the argument because remember addProduct is a function that expects a string. So I would pass a string and let's leave the world of exotic products maybe, let's just named this sweets because it's an image full of sweets. 
[image:04603706-FDCF-49BE-AC15-E06E1E35BB5D-67708-0000556958C9884A/Screen Shot 2018-10-04 at 9.15.30 PM.png]
If we now save that and do a full restart to clear any existing state, this is our app and if I click add product, we still add this new item but now we're adding it from a button or by clicking on a button which lives in a different widget and ::this is one advanced concept which I want you to understand, that if you want to pass data up so if you have something happening in a widget and the parent widget needs to know about it and the parent widget in our case is the product manager, then you do that by passing down, a reference to a function which executes in the parent widget. This is crucial to understand.::

# Understanding ‘const’ and ‘final’

Now before we finally leave this module of important basics, here's one important basic about the dart language, so not something exclusive to flutter but really to dart. In the product manager, we have our list of products here right and we changed this list of products because we add new products here in setState, for example.

Now one thing we also saw in dart before is that when we receive data via the constructor, we typically bind this to a property where we want to add the final annotation. This is not required for the code to run but flutter itself or dart itself tells us that we should do this because we get this warning that this class is marked as immutable and that is simply happening because the stateless widget is marked as such and this simply tells us hey, it's a good practice to be clear about the fact that the data you work with here is immutable, which means you can't change it from inside because that wouldn't have any effect here anyways.

Now we can go back to the _ProductManagerState and there, this might surprise you, I can go to my products list which we certainly do change and I can add final there too. And now if I save this and do a full restart and I go back to the app, it still works as before. Now why is that when I mark this as final, why can we still add products?

::And that's something important to understand about the dart language and how it works, final indeed means this property here is final, we can't assign a new value but that's the important thing, when we call add on the existing list, we're not assigning a new list, we're editing the existing one but and that's important, that's a concept called reference types, that only changes an existing object in memory, it does not create a new one and hence it does not assign a new one to products.::

It's a different thing for numbers by the way, if I had a number, age here and it said let's say 42 and that's not my age but let's say that is our age and now here in setState, I want to set age equal to 29 which is my age. Well then I get a warning here that age can't be used as a setter because it is final so we can't assign a new value and it should be obvious what we're doing here, we're assigning a new value because we have the equal sign here. You won't see an equal sign here for products and therefore of course, you would fail if you say product is now an array with one string, this would be a valid list, it holds a string and product should be a list of strings but we get the same error, as for the age we can't do that because it's final. ::So assigning new values which requires the equal sign is not possible, changing the existing value is possible because lists and objects in general are reference types which means we only store the reference to an object here in products, the reference to this array and if we then use methods on that object and this array or list is also just an object, everything is an object in dart, even a number, if we then call a method on that, this is okay, this changes the existing element but it doesn't create and assign a new one and that's the only thing final prevents.::

And therefore for example if I take my age again and I call a method on that like round to round it, well then you see I don't get any errors there because it has the same logic, I might be doing something with the existing number though round will return a new value, actually it doesn't change the old one but I can safely do that and it could do anything on the number that changes it if I don't reassign it to age.

Now that is a concept which can be challenging to wrap your head around but ::it's crucial to understand final basically disallows us to use the equal sign more than once. If we want to ensure that we also never can change the value with for example the add method, then there is another tool we can use in dart and that is the const keyword on the right side of the equal sign, this means this value is now constant.::

And therefore if I now save this and we do a full restart, you can already tell that there seems to be some error and if I go back, we indeed see an error on the screen, unsupported operation cannot add to an unmodifiable list and that's pretty clear, our list is declared to be not modifiable because of that const keyword and therefore it already understands that calling add here will be a problem.

Unfortunately it doesn't tell us in our IDE, at least not in visual studio code but we get that error once we run our code, even before I click anywhere. And we already get this because it's not just happening where we call add product, it is already a problem when we try to assign a value here in initState, there we call add for the first time and there we already try to change a list which is marked as unchangeable. ::So if you want to be sure that a value can never be changed, use const on the right side of the equal sign. If you just want to be sure that you will never be able to assign a new value to a property, then use final in front of the property name.::

That might seem super advanced and a little bit unnecessary to understand but it is syntax you will see a lot and I want you to understand what's going on here. So let me remove const here and I'll also remove final because I don't care if we assign a new value here or not, I just want you to understand what final and const do when added on left or right sign of the equal sign.

# Wrap Up
[image:42078B3E-46F5-4FE1-A330-0610DABF39E9-67708-0000556967F2427C/Screen Shot 2018-10-04 at 9.30.47 PM.png]
That’s it for this module, we learned a lot about the important basics of flutter. Most importantly we learned that flutter is all about widgets and this is really something you have to take away and you have to get into your mind so to say. Flutter is all about widgets, you compose the user interface which you're seeing in your app from a set of built in widgets which you can of course also put together into your own custom widgets so that you get reusable UI components which you can then use to build your user interface. So it all comes down to these widgets and you built this widget tree, remember you have that root widget, that MaterialApp widget which is wrapped in your root widget and then you've got the scaffold widget for a page and on that page, you then have the body with all the other widgets where you have a column which might have an image and the text, so this is how you build flutter apps. And then you have stateless widgets on the one hand, these are widgets that only take data as an input optionally, they don't have to and they return a new widget tree.

 They have this build method which returns a widget or a tree of widgets and these tree of widgets can be affected by external data which you receive with the constructor but this is not a must, you could also have a widget that works without any external data, that just displays a static tree which never changes. You also have stateful widgets which can also receive external data just like the stateless widgets and they also will have a build method, though that lives in the state object which belongs to these widgets but they can also well work with that state object, they can manage internal data which they can change with setState which will also call the build function again so which will also lead to the build method being executed and the widget tree being re-rendered because that's important. Changes to external or internal data in your widgets lead to a re-render cycle so the build method gets re-executed and a new tree of widgets is created and flutter will then compare this new tree to the old tree which is already rendered onto the screen and will render any differences and update your view.

We also used dart and it's important to understand how dart relates to flutter, dart is the programming language used by flutter, it's not an alternative, it's just a programming language because flutter is both an SDK shipping with the tooling you need to build native mobile apps. So the tooling you need to compile the dart code to native code, so to say or wrap it in native code but it also is a dart framework so it's not just a tooling, it's also a framework which offers a rich set of classes and widgets you can use to build your app, all these widgets we have been using were exposed by flutter. Dart is an object oriented programming language which means you work with classes and you instantiate these classes by calling their constructor and it also uses static typing which simply means you define which types of data get stored in a variable, get returned by a function and so on. And check out that dart language tour I was pointing you at in this module to learn more about dart if you want to dive really deeply into it, you will learn more about it throughout this course though too. Now finally, one important part of working with flutter widgets is that you can pass data around and that you understand the widget lifecycle.

Now you can pass data between widgets by using their constructor methods, this is how you can pass data down the widget tree, you can pass data to a child widget. For stateful widgets, data can also be passed from the widget to the state object because remember, you create stateful widgets by connecting to classes basically, you can pass that with this special widget property which gives you access to the properties of the widget in your state. And stateful widgets offer additional lifecycle methods where you can execute code initState and didUpdateWidget, these will execute when certain things happen, initState when the widget and its state are first created, didUpdateWidget whenever the widget receives new external data and you can use these to run your code up on these events.

All widgets, stateless and stateful ones have the constructor and the build method, the constructor is called when the widget is created or re-rendered so if the parent tree of which this widget, this part is re-rendered and the build method is then always called when the widget is re-rendered, flutter needs the build method and the widget returned by it to know what it should draw onto the screen. And these are the basics about flutter you have to know right now, we'll obviously dive much deeper into it but for now this is what you should be aware of.

# Useful Resources & Links
You find the section source code attached to this lecture.
Official Flutter Docs: https://flutter.io/docs/
Full Dart Documentation: http://dartlang.org/
Flutter Framework Overview: https://flutter.io/widgets-intro/
Resources for this lecture



# Working with Lists & Conditionals (Section:5)
57. Module Introduction 0:57
We're making good progress, let's now dive into one important concept, rendering lists and conditional content.
We already tried rendering a list but with limited success I'd say, right now in our app we're building, we're not really rendering a list of products, we got multiple products but we can't scroll there and it is a bit broken and maybe we also don't want to start with anything in that list but in such a case, show an alternative text, something like please start adding elements and that's also something which we can't really do right now.
So time to dive into that and learn how we can correctly render multiple elements beneath each other and there after also, how we can show ever a content A or a content B depending on some condition.
---
58. Creating Scrollable Lists with "ListView"
4:25

So back in our app, the first problem I want to tackle sits in the products widget. Here we are trying to render a list by using the column widget which is capable of holding multiple children and then we take our products list, use a built-in map method to convert it into a list of widgets basically and we return these cards here so we return a list of cards and dart is able to render that to the screen, as you can see.

The problem is not really right, we can't scroll so flutter tries to squeeze it all on one page and then detects that this doesn't work, that there isn't enough space. So the column simply is not the right widget, use the column if you have elements that sit on top of each other, so which are rendered from top to bottom but that's important where you don't plan on scrolling. ::A column is great in this case here where you know hey I want to have an image and below that image, I want to have a text, that's a great place for a column.::
[image:3A020C42-E716-4FD9-ADB6-55569E2C9A2A-67708-000055694FB5B0DF/Screen Shot 2018-10-04 at 3.10.48 PM.png]
::However where you know I will have multiple, bigger widgets and eventually they will go beyond my boundaries, the boundaries of my device, if you know something like this, the column is not the right widget.::
[image:D8151122-C302-4816-BE33-6AD79A65B851-67708-000055695104C192/Screen Shot 2018-10-04 at 3.11.30 PM.png]

::There is a widget which exists for these cases though, that is the ListView widget.:: The ListView widget as the name suggests is a widget for rendering lists and it also has a children argument you can pass to it and that argument indeed has to hold a list, here we're converting it into a list, a list of widgets.
[image:E80C7CA4-A1DB-4BC4-9265-2504CBE78682-67708-0000556950CC790B/Screen Shot 2018-10-04 at 3.14.11 PM.png]
Now just with adding the ListView, it won’t start working though. If you save everything and do a full restart and you then go back, you don't see anything on the page, right? And we also got an error here, we got an error which tells us that this object's geometry is not known at this time.
Now this is a bit of a cryptic error message to be honest, the problem is ::that a ListView can't be used beneath a button as we are using it or beneath another widget in general as we are doing it::.
So having a container here and then the product which is our ListView, that won't work. If you want to have a set up where you got a container or any widget and beneath that, ::a ListView then you need to wrap that ListView with another container where ListView or the widget holding the ListView then is the child and then you need to set the height property on that container, this defines how big this container will be and that's an information the ListView requires.::
[image:07B839B9-6459-490A-B2F4-A71FE285B4E7-67708-0000556950A12972/Screen Shot 2018-10-04 at 3.31.55 PM.png]
You could set this to 300.0 then so this has to be a double and these are pixels and now you see, this is our list, it's now existing and if I add a product, that is because we have a height of 300, that is our list.
Now if you want to take the available remaining space, we can remove that height assignment and replace the container with a special widget, the ::Expanded widget, that will take the remaining space after the other widget in that column.:: in this case ,So now you see that takes the remaining space and now here is our list and we even got this you can't scroll any more indicator here at the bottom and top if you watch closely.
So now we got a scrollable list and if we add more items, we can scroll it without issues.
[image:4358D6FB-5125-4988-968B-30478C18AD79-67708-000055694F7695E3/Screen Shot 2018-10-04 at 3.33.14 PM.png]
`However we will face an issue at some point of time if I add a bunch of items here, well my device is still too fast but eventually you would hit performance issues with this approach because with this approach we're currently using, we're doing one thing which we might want to avoid for lists where we don't know the exact length or amount of items in advance.`
Let's see how we can improve that ListView in the next lecture.
---
59. Optimizing the List Loading Behaviour
6:46

The ListView is very useful and we're using it like this, we're creating our ListView widget and we're then assigning a list of widgets to the children argument. Now this is fine for lists where you know that you only got a couple of elements, let's say you would create a user input form where you have like four different input fields, something we will also do later in the course. ::So whenever you know in advance how many items you'll need and that this won't be too many items so just a couple of items, then using a ListView like this is great.::

::If you got a ListView where you will dynamically add items and where you don't know how many these are going to be or if you know that these will be hundreds and thousands of items, then creating a ListView like this is very inefficient because if you create a ListView like this, then all items will be rendered in advance.::

Now what's wrong with that and what's the alternative? ::Well you could also render an item when you need it so if I scroll down, the next item after this last card is only needed now.::

::So you could render it immediately before it comes into the view and on the other hand, you could destroy items which scroll out of the view and this can be handled for you by the operating system on the device or by flutter therefore. So you don't have to write the code for this on your own because this would be quite an advanced code but you can use the ListView in a way so that it does this for you, that it automatically destroys items it doesn't need to display anymore and adds items which are going to be seen very soon. This is highly efficient because this doesn't keep all these items which you don't see anyways in memory and for very long lists, this is a way more performant way of displaying items in a list.::

### To use the ListView in that way, you will use a different constructor, not the default one but the builder constructor.

Now the builder constructor knows no children so we can actually just cut the card so that we keep our widget layout but then we can get rid of that entire content here. Instead, ::the builder constructor here uses different arguments and there are two important arguments, the item builder and the item count::, the `item count indicates how many items will have to be built` and` the item builder contains a method which defines what does building an item mean, how is an item built.` Now a function as you know is just a list of arguments and the function body, this is an anonymous function with no name.
[image:A6AD6A3F-A28F-4598-8A44-49C7B6ED4F5B-67708-000055695040265D/Screen Shot 2018-10-04 at 3.49.31 PM.png]
You could also reference a method of your class though, you could add a method to this product widget here which I'll name `_buildProductItem` and `I'll start with an underscore to indicate that this is only used internally in this class, it's a convention, it's not a must but it's something I'll try to do throughout this course`. So build product item could now return a widget because that is probably what we want to build, we want to build a widget and therefore we could return the code we cut before so our card widget here. 
[image:2B9D1B2D-713A-4276-8A9F-9F875314B3E4-67708-000055694F237181/Screen Shot 2018-10-04 at 3.53.25 PM.png]

Now element to something we required, now the issue is we wanted to know which text to print out, let’s handle this step by step. Let's assign our build product item method without executing it so without parentheses, just to pass the reference to it and this will then be executed by flutter when it builds this item
[image:00BF53EF-D114-4AA7-BCAA-6F4300F4690F-67708-000055694FE9FFEF/Screen Shot 2018-10-04 at 3.54.27 PM.png]
 and the ::item builder actually takes a function which does not just return a widget but and that’s important, which takes two arguments, the context the build context, you know that's the thing which contains theme, information and so on and the index, so the index of the item which is being built. Index because we'll be talking about items that are of course in a list and each item in a list has an index, so the position where it is in that list, we get that information here too.:: The context is of type build context, we saw that before and the index will just be an integer.
[image:120175F8-FFB6-419B-9C71-3F95C522272A-67708-00005569506D1C15/Screen Shot 2018-10-04 at 3.57.03 PM.png]
Now we get that and now since we know the position of the item in the list and the list itself is a property in our widget class here, we can just access products and then you can access a certain position or index with square brackets and then just by passing the index.
[image:38589789-AC0B-4EA9-9A19-F0C7E9D0AC4F-67708-000055694ED6A220/Screen Shot 2018-10-04 at 3.58.13 PM.png]
 This could be a hardcoded number like 0, 0 targets the first element by the way, lists start at zero where the first element has the index 0 in the list, it could be something like 1 but here of course, it'll be a dynamic value, it'll be that index argument which will be a number, an integer to be precise and which therefore will be a number from that products list. So now this will access a certain element in our products list and since it still is a list of strings, it will simply retrieve that string and output it with the text widget. 

Now we're not done with the ListView builder though, now we got a function which will build every item but of course we need to know how many items to build and that is where item count comes into play. ::Now we know that we want to build this products list and every list has a useful property we can access with the dot notation, so we can type products and then dot and then length and this gives us information about how many items are in that list and with that, the builder will do the rest for us.::
[image:A39FD817-1FDA-43BB-8BBB-806CFAD0D42E-67708-000055695017EBB5/Screen Shot 2018-10-04 at 3.59.32 PM.png]
It will execute the build product item as often as required by the count we specified here, so if we got three items in the list, it will execute this method three times and in this method, we then do whatever we want to do, in this case we extract the item from the list.

::With that if we save that and we do a full restart, it'll work as before and we can't even notice a difference in performance here. But this actually is the way more performant way because this will now remove the items when we don't see them and it will add them just before they become visible. And this is great especially for very long lists or lists where you don't know how long they are going to be.::
---
60. Rendering Content Conditionally
5:13
We learned a lot about ListView and right now in our app if I do a full restart, ::we always start with one element, we start with one element because in our product manager here, we pass products to our products widget and products always starts with one product because in initState, we add our starting product.:: Now if I go to the main.dart file and I don't add my starting product, so if I remove that, then if I save this and I hot reload and I do a full restart, then we still get a starting product because remember, in that case where we don't pass one, well then we simply use a default value which we assign in the constructor here, the default value is sweets tester.

::Now this is something we can do but for now, I want to get rid of that default value so I'll just set up my still named arguments to mix it up but doesn't have a default value. Now if I don't pass anything which I can do, named values are always optional so if I don't pass anything to product manager, this means that product, starting product will be undefined, will be null, it doesn't have a value.  So now we can check that here in initState,  we can check if widget starting product is unequal to null, null is a special type and if it is unequal to null so if it does hold some value, then I want to add it otherwise I'll not do anything.::
[image:C66814B7-83FA-402E-B47D-52CD4B30B7AB-67708-00006CE61547F849/Screen Shot 2018-10-05 at 2.26.03 PM.png]
::Now this will have one important effect, if I now do a full restart,  we start with no card and if I would go back to the main.dart file and set the starting product again and do a full restart, then we would start with that card.::

Now let me reverse this and remove that element or that starting product and now let's say that's nice and we have some kind of conditional code here with this if statement but we want to display something different in the case that we don't have any products. So in the products widget, we're outputting our ListView but we only want to output that if we got products. Now it's no problem to have this code like this but ::maybe we want to show some alternative text in case we don't have any products. So what we want to do is we want to render different content depending on some condition and we can do this in multiple ways,::

1. one quick and easy way is to go to the return statement in the build method of our products widget and there we can check if products.length is greater than zero, this is a Boolean operation here and I'm just comparing, whoops products without underscore and I'm just comparing whether products. length is greater than zero, this will return true or false.

/Now typically you would put this in a if statement as you saw it in the product manager here but there is an inline if statement, so an if statement you can write in the one line only or you can split it across multiple lines but which you can write without curly braces so with one statement being executed only I should say. You write it by first adding your condition then a question mark and now you write the code which should execute if this condition is true. Now if this condition is true then we have items so then I want to execute this code, this ListView builder method. Now we also have to define the else case because dart, just as pretty much all other programming languages, support if else statements so you can just execute code if something happens, you can also specify code which should execute if that does not happen. And for that inline statement you add that by adding a colon here and then after that colon, you define the widget you want to return if this is not true./

 And there, let's say I want to return some centered text so I will return the center widget with a child which is text no products found, please add some, any text of your choice.
[image:A103FDB1-B3DA-48E4-A26D-E33244D18A85-67708-00006E6D88D1433F/Screen Shot 2018-10-05 at 2.54.16 PM.png]
With this if I save that and again do my full restart here, we see no products found, please add some and as soon as I do add one, well then we got that list again. So this is how you can render a content conditionally, this is a fine way of doing it if you get a very simple condition. If you've got a condition with multiple AND or OR conditions though, you might not want to use that. So let me show you an alternative way in the next lecture.

61. Alternative Approaches to Render Content Conditionally
5:39

We saw that ternary expression, this inline if statement in the last lecture. Now it's nice for a simple checks and simple if and else content like this but if you've got more complex checks or more complex, well widgets or more complex nested widgets you want to render, then you might not want to do this all inline because imagine this being part of a bigger widget tree because it's not just a top level check, you can do it to start with a return statement, you can do it anywhere in your return widget code, so if you have something like that, then it quickly becomes hard to read.

So there are more elegant solutions, ::one elegant solution is to outsource this into a variable:: so here we could add a variable which will return a widget in the end or which will hold a widget I should say which is my product card, you can give it any name you want. This is now not a property in your class, this is just a variable inside of this function so you can only use product card inside of this function, you can't use it anywhere else in this file. ::The value this should hold now is let's say by default our centered text,:: let's say that's our default assumption for the case that it doesn't work but then I add an if check and I do all of that in the build method because this code should run whenever this is rebuilt but before I return. And this if check of course is this condition, ::I want to check that condition here, then I have curly braces and then I set product card equal to this ListView builder method in case we do have more than zero items::. Let's add a semi-colon and remove this text down there and now let's return product card here. This is valid code because product card will hold a widget and we just need to return a widget here so returning product cards is fine and the widget which it will hold is either our center text or if we make it into the if block, then it will be this widget.
[image:2D0F65B2-53F0-429E-9189-C61D911B7C23-67708-00007028448ED5B0/Screen Shot 2018-10-05 at 3.25.41 PM.png]
And of course you could have more complex if statements with the else case here where you could set well the text in case you don't want to initialize is up there, you could define it uninitialize like this and then set product card equal to your center text down there, this would yield the exact same result as I can prove to you of course if we restart the app, it still works as before. ::So these are other options you have and this is a more elegant way, now it doesn't look that more elegant because it's now more code but if that were a more complex widget tree down there, then it would be easier to read through that if check widget easier to understand than our ternary expression especially once you also got more complex widgets you construct in these different branches of your if statement.::
[image:369C685D-9464-4A2A-83C2-2BC14DA1BE31-67708-0000704A2FCFEEA3/Screen Shot 2018-10-05 at 3.27.59 PM.png]

::There is an even more elegant way of handling this widget creation here:: though or at least there’s something you should consider, ultimately it comes down to personal preference. ::It's not the worst practice to outsource your widget creations into methods of your widget class, we already got the build product item method, now we can add another method which will also return a widget which is `_buildProductLists`,:: the naming always is up to you. I'm a fan of using that build starting phrase because it clearly shows that this is a method which only exists to return a widget and build the widget we plan on printing in the build method but ultimately that name is totally up to you. Now build product list could now contain this code here so let's cut it from the build method. So it contains the product card variable, the if check and return the variable which holds a widget
[image:9DF6343F-B039-434E-8234-C373958ACB31-67708-0000707291B2007F/Screen Shot 2018-10-05 at 3.31.01 PM.png]
 and then in the build method here, I just return build product list, this should be list not lists so let me rename this, build product list up there and now I'm just returning the result of this execution.
[image:A9E79577-0C43-497E-AD98-46659E5F6FCE-67708-0000707E3E0BD438/Screen Shot 2018-10-05 at 3.31.53 PM.png]
Here ::I am executing this function because I want to run it whenever we rebuild this widget because then I want to see if we got some update here, maybe we now have to list items so certainly this function should run again, should then go into this if branch and set product card equal to our ListView and then return that.::

So with that if I save it, it will still work as before, ::as you can see here but we got a very clean build method and your goal should be to keep this clean so that people can quickly see what's getting constructed there.:: Yes they will have to jump to the build product list method here but at least they see that you're doing something with a product list and if you got more widgets in there, some of them directly added here, some of them outsourced in methods, then you should have quite a readable build method and then you can always go into the detail method and see what's it going on there. And this is the last way or the last alternative when it comes to rendering conditionals, though the main difference is that you can use ternary expressions or if statements no matter if you then put them into methods or manage them inside the build method but this is how you can render different content depending on different conditions.

62. One Important Gotcha
1:47
Now before I wrap this module up there is one important gotcha or error or you can run into when working with conditional content.

::Here we are showing some centered text as an alternative, sometimes you don't want to show anything::. Now you could have the idea that you simply remove the else block here, product card is undefined initially and we only set a value if we do have products so otherwise we return an undefined product card and I just noticed this should of course be product cards therefore, makes more sense but that doesn't matter so we'd return an undefined variable, no matter how we name it and then we try to render that. Now let's see if that works, if we save that and do a full restart and you could already see I'm getting an error here and we see an error here, a build function returned null.

So that's a pretty clear error message again and the issue is pretty clear, ::we must not return null here. The build method must not return null, It has to return some widget. So if you got a case where you really don't want to render anything, well then you have to at least render an empty container like this, this is valid code and this will not occupy any space on the screen, will also not impact performance in any measurable way and it will, that's the most important lead to a valid app that works as before but now is also able to handle the case that you don't want to render anything. So don't return undefined or null here, return the container instead, an empty container is what you need in such a case.::
[image:636F91E0-69D4-4997-8689-17BDA2DBBCEC-67708-000070BDE2D0B3B6/Screen Shot 2018-10-05 at 3.36.39 PM.png]

63. Wrap Up
1:52
[image:B0E12344-9ADF-4B40-A420-728C69BA5E55-67708-000070DEDEC18EE3/Screen Shot 2018-10-05 at 3.39.03 PM.png]
After this module you should have way less problems when it comes to rendering lists of items or conditional content.

We learned how we can render lists, that a column is not a great option because it tries to squeeze all the elements onto one page or to be even more clear into the column and if you have one column on the page, that is the entire page but it tries to squeeze all the elements into it. Use a ListView instead to render a scrollable list but make sure to wrap it into a fixed height container or expandable widget if it's not the only widget on the screen so if you have some neighbor widget. Use the ListView with the children argument for a short lists where you know the amount of items in advance, so user input forms are a great example.

But if you've got longer lists or lists with dynamic items where you don't know how many items will exist, you should use to ListView builder, this allows you to create dynamic and more performant lists. For conditional content, you can use ternary expressions or if statements to render different widgets for different conditions, it's just important that you should always render a widget, don't return null, use an empty container instead if you don't want to render anything and consider using if statements over ternary expressions if you got more complex conditions or widget trees or always, that's also fine.

If you always want to use if statements, that's fine, they tend to be easier to be read so definitely not bad to use them. And that's it, that are crucial core features which we will use a lot throughout this course and with that, we're well-prepared to continue and spend more time adding cool features to our app.

64. Useful Resources & Links
---

