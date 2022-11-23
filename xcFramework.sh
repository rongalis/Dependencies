set -e

WORKSPACE="ServiceKit.xcworkspace"
SCHEME="ServiceKit"
FRAMEWORK_NAME="ServiceKit"

BUILD_DIR=${PWD}/"_build"
IOS_ARCHIVE_PATH="${BUILD_DIR}/iOSDevice.xcarchive"
IOS_SIM_ARCHIVE_PATH="${BUILD_DIR}/iOSSimulator.xcarchive"
LIB=${PWD}/"lib"


rm -rf ${BUILD_DIR}
rm -rf "${LIB}/${FRAMEWORK_NAME}.xcframework"


build_sim(){
	xcodebuild archive \
	-workspace ${WORKSPACE} \
	-scheme ${SCHEME} \
	-destination="iOS Simulator" \
	-archivePath "${IOS_SIM_ARCHIVE_PATH}" \
	-sdk iphonesimulator \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	SWIFT_SERIALIZE_DEBUGGING_OPTIONS=NO
}

build_device(){
	xcodebuild archive \
	-workspace ${WORKSPACE} \
	-scheme ${SCHEME} \
	-destination="iOS" \
	-archivePath "${IOS_ARCHIVE_PATH}" \
	-sdk iphoneos \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	SWIFT_SERIALIZE_DEBUGGING_OPTIONS=NO
}

make_xcframework(){
	xcodebuild -create-xcframework \
	-framework ${IOS_SIM_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
	-debug-symbols ${IOS_SIM_ARCHIVE_PATH}/dSYMs/ServiceKit.framework.dSYM \
    -framework ${IOS_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
    -debug-symbols ${IOS_ARCHIVE_PATH}/dSYMs/ServiceKit.framework.dSYM \
    -output ${LIB}/${FRAMEWORK_NAME}.xcframework
}

build_sim
build_device
make_xcframework

rm -rf ${BUILD_DIR}