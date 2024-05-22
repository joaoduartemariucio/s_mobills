#!/bin/bash
## declare an array paths to exclude

flutter clean
flutter pub get 
flutter build apk --release --flavor production -t lib/main_production.dart --no-tree-shake-icons

mv ./build/app/outputs/flutter-apk/app-production-release.apk /Users/joao/Desktop/smobills-production-release_v1_2_0_build-4.apk