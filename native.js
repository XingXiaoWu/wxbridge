import {NativeModules, Platform, ToastAndroid} from "react-native";

const { wxnative } = NativeModules;


// 展示Toast
function showToast(message) {
    if (Platform.OS === 'ios') {
        wxnative.showToast(message)
    } else {
        ToastAndroid.show(message,2)
    }
}
// loading
function showLoading() {
    wxnative.showLoading()
}

function dismissLoading() {
    wxnative.dismissLoading()
}


export {showToast,showLoading,dismissLoading}
