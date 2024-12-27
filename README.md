
# react-native-new-year-luckymoney-collection

## Getting started

`$ npm install react-native-new-year-luckymoney-collection --save`

### Mostly automatic installation

`$ react-native link react-native-new-year-luckymoney-collection`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-new-year-luckymoney-collection` and add `RNNewYearLuckymoneyCollection.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNNewYearLuckymoneyCollection.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNNewYearLuckymoneyCollectionPackage;` to the imports at the top of the file
  - Add `new RNNewYearLuckymoneyCollectionPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-new-year-luckymoney-collection'
  	project(':react-native-new-year-luckymoney-collection').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-new-year-luckymoney-collection/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-new-year-luckymoney-collection')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNNewYearLuckymoneyCollection.sln` in `node_modules/react-native-new-year-luckymoney-collection/windows/RNNewYearLuckymoneyCollection.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using New.Year.Luckymoney.Collection.RNNewYearLuckymoneyCollection;` to the usings at the top of the file
  - Add `new RNNewYearLuckymoneyCollectionPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNNewYearLuckymoneyCollection from 'react-native-new-year-luckymoney-collection';

// TODO: What to do with the module?
RNNewYearLuckymoneyCollection;
```
  