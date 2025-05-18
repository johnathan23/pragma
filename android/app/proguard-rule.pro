-keep class com.google.android.play.core.** { *; }
-keep class com.google.android.play.core.splitcompat.SplitCompatApplication { *; }
-keep class io.flutter.app.FlutterPlayStoreSplitApplication { *; }
-dontwarn com.google.android.play.core.**

# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**
-repackageclasses

# Retrofit
-keep class retrofit2.** { *; }
-keep class com.squareup.okhttp3.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes Exceptions

# OkHTTP
-dontwarn okhttp3.**
-keep class okhttp3.**{ *; }
-keep interface okhttp3.**{ *; }

# JsonSerializable
-keep class co.johnathan.silva.pragma_exam** { *; }  # Reemplaza 'com.yourpackage' con tu paquete real
-keep class * implements com.fasterxml.jackson.databind.JsonSerializer
-keep class * implements com.fasterxml.jackson.databind.JsonDeserializer

# Riverpod
-keep class co.johnathan.silva.pragma_exam** { *; }

# Cached Network Image
-keep class com.** { *; }

# Shimmer
-keep class com.** { *; }

# General Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class com.google.gson.** { *; }

# Keep all annotations
-keepattributes *Annotation*

# Keep the main activity
-keep class co.johnathan.silva.pragma_exam.MainActivity { *; }

# Other
-keepattributes SourceFile, LineNumberTable

# Prevent R8 from removing Compose-related classes used by dependencies
-keep class androidx.compose.** { *; }
-dontwarn androidx.compose.**
-keep class androidx.window.** { *; }
-dontwarn androidx.window.**

# Keep AutoSafeParcelables
-keep public class * extends org.microg.safeparcel.AutoSafeParcelable {
    @org.microg.safeparcel.SafeParcelable.Field *;
    @org.microg.safeparcel.SafeParceled *;
}

# Keep asInterface method cause it's accessed from SafeParcel
-keepattributes InnerClasses
-keepclassmembers interface * extends android.os.IInterface {
    public static class *;
}

-keep public class * extends android.os.Binder { public static *; }