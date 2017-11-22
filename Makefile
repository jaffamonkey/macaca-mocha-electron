git_version = 'git branch 2>/dev/null | sed -e '/^[^*]/d'-e's/* \(.*\)/\1/''
npm_bin= ./node_modules/.bin
custom_port = './node_modules/.bin/detect-port 3458 -s'

all: test
install:
	@npm i
test:
	@echo ""
	@echo "make test-ios               Test sample for iOS"
	@echo "make test-android           Test sample for Android"
	@echo "make test-ios-safari        Test sample for iOS Safari"
	@echo "make test-android-chrome    Test sample for Android Chrome"
	@echo "make test-desktop-puppeteer Test sample for Desktop PC"
	@echo "make test-desktop-electron  Test sample for Desktop PC"
	@echo "make test-desktop-chrome    Test sample for Desktop PC"
	@echo "make simple-reporter        Test sample for PC with simple reporter"
test-ios:
	macaca doctor
	platform=ios ./node_modules/.bin/macaca run --verbose --reporter macaca-reporter -d ./macaca-test/mobile-app-sample.test.js
travis-ios: install
	npm i macaca-ios --save-dev
	./node_modules/.bin/macaca doctor
	platform=ios ./node_modules/.bin/macaca run --verbose -d ./macaca-test/mobile-app-sample.test.js
test-android:
	macaca doctor
	platform=android ./node_modules/.bin/macaca run --verbose --reporter macaca-reporter -d ./macaca-test/mobile-app-sample.test.js
travis-android: install
	CHROMEDRIVER_VERSION=2.20 npm i macaca-android --save-dev
	./node_modules/.bin/macaca doctor
	platform=android ./node_modules/.bin/macaca run --verbose -d ./macaca-test/mobile-app-sample.test.js
test-ios-safari:
	macaca doctor
	browser=safari ./node_modules/.bin/macaca run --verbose --reporter macaca-reporter -d ./macaca-test/mobile-browser-sample.test.js
travis-ios-safari: install
	npm i macaca-ios --save-dev
	./node_modules/.bin/macaca doctor
	browser=safari ./node_modules/.bin/macaca run --verbose -d ./macaca-test/mobile-browser-sample.test.js
test-android-chrome:
	macaca doctor
	browser=chrome ./node_modules/.bin/macaca run --verbose --reporter macaca-reporter -d ./macaca-test/mobile-browser-sample.test.js
travis-android-chrome: install
	CHROMEDRIVER_VERSION=2.20 npm i macaca-android --save-dev
	./node_modules/.bin/macaca doctor
	browser=chrome ./node_modules/.bin/macaca run --verbose -d ./macaca-test/mobile-browser-sample.test.js
test-desktop-electron:
	browser=electron ./node_modules/.bin/macaca run --verbose --reporter macaca-reporter -d ./macaca-test/desktop-browser-sample.test.js
travis-desktop-electron: install
	npm i macaca-electron --save-dev
	./node_modules/.bin/macaca doctor
	browser=electron ./node_modules/.bin/macaca run --no-window --verbose -d ./macaca-test/desktop-browser-sample.test.js
test-desktop-chrome:
	./node_modules/.bin/macaca doctor
	CHROMEDRIVER_VERSION=2.33 browser=chrome macaca run --verbose --reporter macaca-reporter -d ./macaca-test/desktop-browser-sample.test.js
travis-desktop-chrome:
	./node_modules/.bin/macaca doctor
	CHROMEDRIVER_VERSION=2.33 browser=chrome ./node_modules/.bin/macaca run --verbose --reporter macaca-reporter -d ./macaca-test/desktop-browser-sample.test.js
test-desktop-puppeteer:
	browser=puppeteer ./node_modules/.bin/macaca run --verbose --reporter macaca-reporter -d ./macaca-test/desktop-browser-sample.test.js
travis-desktop-puppeteer:
	npm i macaca-puppeteer --save-dev
	./node_modules/.bin/macaca doctor
	browser=puppeteer ./node_modules/.bin/macaca run --verbose -d ./macaca-test/desktop-browser-sample.test.js
simple-reporter:
	npm i macaca-simple-reportor --save-dev
	./node_modules/.bin/macaca doctor
	CUSTOM_DIR=macaca-logs/desktop-browser-sample ./node_modules/.bin/macaca run --verbose --reporter macaca-simple-reportor -d ./macaca-test/desktop-browser-sample.test.js
custom-port:
	npm i macaca-electron --save-dev
	./node_modules/.bin/macaca doctor
	MACACA_SERVER_PORT=${custom_port} browser=electron ./node_modules/.bin/macaca run --no-window --verbose -d ./macaca-test/desktop-browser-sample.test.js -p ${custom_port}

.PHONY: test-ios
