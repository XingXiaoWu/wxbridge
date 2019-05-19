
# react-native-wx-bridge

## Getting started

`$ npm install react-native-wx-bridge --save`

### Mostly automatic installation

`$ react-native link react-native-wx-bridge`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-wx-bridge` and add `RNWxBridge.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNWxBridge.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNWxBridgePackage;` to the imports at the top of the file
  - Add `new RNWxBridgePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-wx-bridge'
  	project(':react-native-wx-bridge').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-wx-bridge/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-wx-bridge')
  	```


## Usage
```javascript
import RNWxBridge from 'react-native-wx-bridge';

// TODO: What to do with the module?
RNWxBridge;
```
  