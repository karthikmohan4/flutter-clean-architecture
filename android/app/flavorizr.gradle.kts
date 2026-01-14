import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.enterprise.dev"
            resValue(type = "string", name = "app_name", value = "Enterprise Dev")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.example.enterprise.staging"
            resValue(type = "string", name = "app_name", value = "Enterprise Staging")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.example.enterprise"
            resValue(type = "string", name = "app_name", value = "Enterprise")
        }
    }
}