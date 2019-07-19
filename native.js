import {NativeModules, Platform, ToastAndroid} from "react-native";

const { wxnative } = NativeModules;


/**
 *
 * @param {*} moduleName 模块注册名,去index.js看
 * @param {*} fileName 打包出来的文件名称,如果使用的是wx脚本提供的打包命令,会和moduleName相同
 * @param {*} params 可选项,可不填.需要传递给将要打开的bundle的参数
 */
function navigate(moduleName, fileName, params) {
    if (Platform.OS === 'ios') {
        wxnative.navigate(moduleName, fileName, params)
    } else {
        // ToastAndroid.show(message)
    }
}

function popViewCtrl() {
    if (Platform.OS === 'ios') {
        wxnative.popViewCtrl()
    } else {
        // ToastAndroid.show(message)
    }
}



/**
 * 获取原生数据,包含
 * versionCode  build号
 * versionName  app版本
 * deviceId     设备唯一标识
 *  phoneVersion    手机系统版本
 *  phoneModel      deviceModelName
 *  phoneBrand      手机厂商
 */
async function getNativeInfo() {
    let result = await native.getNativeInfo()
    console.log(result)
    return result
}


export {navigate, popViewCtrl, getNativeInfo}
