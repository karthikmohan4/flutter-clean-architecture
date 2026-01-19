# Enterprise - Production setup
1. Clean code architecture (Bloc, GetIt, Secure storage)
2. Shared Preference & Secure storage
3. Theme
4. Localization
5. Flavors

# Flavors - (Dev, Staging, Production)

 - Adding in .vscode -> launch.json file
   {
    "version": "0.2.0",
    "configurations": [
        {
            "name": "dev Debug",
            "request": "launch",
            "type": "dart",
            "flutterMode": "debug",
            "args": [
                "--flavor",
                "dev"
            ],
            "program": "lib/main_dev.dart"
        },
        {
            "name": "dev Profile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--flavor",
                "dev"
            ],
            "program": "lib/main_dev.dart"
        },
        {
            "name": "dev Release",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--flavor",
                "dev"
            ],
            "program": "lib/main_dev.dart"
        },
        {
            "name": "staging Debug",
            "request": "launch",
            "type": "dart",
            "flutterMode": "debug",
            "args": [
                "--flavor",
                "staging"
            ],
            "program": "lib/main_staging.dart"
        },
        {
            "name": "staging Profile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--flavor",
                "staging"
            ],
            "program": "lib/main_staging.dart"
        },
        {
            "name": "staging Release",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--flavor",
                "staging"
            ],
            "program": "lib/main_staging.dart"
        },
        {
            "name": "production Debug",
            "request": "launch",
            "type": "dart",
            "flutterMode": "debug",
            "args": [
                "--flavor",
                "production"
            ],
            "program": "lib/main_prod.dart"
        },
        {
            "name": "production Profile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--flavor",
                "production"
            ],
            "program": "lib/main_prod.dart"
        },
        {
            "name": "production Release",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--flavor",
                "production"
            ],
            "program": "lib/main_prod.dart"
        }
    ]
}