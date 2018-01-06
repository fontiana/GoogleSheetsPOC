# GoogleSheetsPOC

*You should install cocoapods on your mac before executing the app*

```
sudo gem install cocoapods
```

### Executing APP

1. Prepare your CocoaPods Repo. *Only if it is your first time installing any pod*
```shell
pod repo remove master
cd ~/.cocoapods/repos 
git clone --depth 1 https://github.com/CocoaPods/Specs.git master
```

2. Installing dependencies.

```shell
pod install
```

3. Make sure you open `GoogleSheetsPOC.xcworkspace` file
