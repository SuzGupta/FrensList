#  TODO
Recall how to work with SwiftData

Initial view will be empty list with encouraging message on how to add from Camera Roll, and a Plus button that leads to AddFren view which will be where the PhotoPicker code should move

Try out ContentUnavailableView

Need to add permission for accessing Photos

List view shows the array of Frens

Detail view shows the selected Fren and lets you edit the label (or change the photo?)

From Paul's instructions:

Your goal is to build an app that asks users to import a picture from their photo library, then attach a name to whatever they imported. The full collection of pictures they name should be shown in a List, and tapping an item in the list should show a detail screen with a larger version of the picture.

Breaking it down, you should:

Use PhotosPicker to let users import a photo from their photo library.
Detect when a new photo is imported, and immediately ask the user to name the photo.
Save that name and photo somewhere safe.
Show all names and photos in a list, sorted by name.
Create a detail screen that shows a picture full size.
Decide on a way to save all this data.
Remember to import the user's photo as Data, so you can write it out easily.

You can use SwiftData for this project if you want to, but it isn’t required – a simple JSON file written out to the documents directory is fine, although you will need to add a custom conformance to Comparable to get array sorting to work.

If you do choose to use SwiftData, here's an important tip: when storing large data like images or movies in your models, define them using a special @Attribute macro like this:

@Attribute(.externalStorage) var photo: Data
That tells SwiftData not to save the image data directly inside its database, but to put it alongside instead – it's much more efficient.

what can I do to improve this now?

I wonder how I make the list rows reorderable? I guess that does not go along with the query that sorts alphabetically on first name (which is probably not quite right)

don't I need to add some sort of Photos permission to an info.plist? I guess not for working in the simulator?
