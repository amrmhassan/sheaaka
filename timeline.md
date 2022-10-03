# start implementing creating stores with sign up stores screen

-- steps

- when signing up if the userRole is trader, and set the userCreatedStoreSuccess Property to the sharedPref to be false, show the create store after signing the user up
- then start creating the store process, after finishing creating store set userCreatedStoreSuccess to be true
- if closing the app without creating the store, set the userCreatedStoreSuccess in the app state provider to be false, and show him a warning that he need to create his store soon
- when loading the app, if the userRole is trader, fetch the userCreatedStoreSuccess from shared prefs,
  if not set => get the user store from firebase,
  if set to true, get user store from firebase
  if set to false just warn the user
  each store will hold his creator UID, so u can get the store by his userUID
  one user can create up to 4 stores, as a series

# add the date liked to each product in the list of the products provider, \_favoriteProducts

-- add the error handling to show readable messages to the user
-- add try catch to every future running in the app

# add filter type as search type

# add the helper widget to the screen wrapper, with a (Widget ?helperWidget) and show it if not null
